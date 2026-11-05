"""FP32 YAMNet backbone in NumPy (BatchNorm folded into the convolutions).

All tensors are NHWC. Weight layouts follow the Keras checkpoint:
  conv1      (3,3,1,32)    depthwise (3,3,C,1)    pointwise (1,1,Cin,Cout)
BN has centre=True / scale=False / eps=1e-4, so folding is  w' = w * rsqrt(var+eps),
b' = beta - mean * rsqrt(var+eps).
"""

import numpy as np
import h5py

from . import YAMNET_H5

BN_EPS = 1e-4

# (kind, kernel, stride, out_channels) -- from yamnet.py _YAMNET_LAYER_DEFS
LAYER_DEFS = [
    ("conv", 3, 2, 32),
    ("sep", 3, 1, 64),
    ("sep", 3, 2, 128),
    ("sep", 3, 1, 128),
    ("sep", 3, 2, 256),
    ("sep", 3, 1, 256),
    ("sep", 3, 2, 512),
    ("sep", 3, 1, 512),
    ("sep", 3, 1, 512),
    ("sep", 3, 1, 512),
    ("sep", 3, 1, 512),
    ("sep", 3, 1, 512),
    ("sep", 3, 2, 1024),
    ("sep", 3, 1, 1024),
]


def same_pad(n_in, k, s):
    """TensorFlow 'SAME' padding -> (before, after, n_out)."""
    n_out = -(-n_in // s)
    total = max((n_out - 1) * s + k - n_in, 0)
    before = total // 2
    return before, total - before, n_out


def _bn_fold(f, prefix):
    beta = np.array(f[f"{prefix}/bn/{prefix}/bn/beta:0"], dtype=np.float64)
    mean = np.array(f[f"{prefix}/bn/{prefix}/bn/moving_mean:0"], dtype=np.float64)
    var = np.array(f[f"{prefix}/bn/{prefix}/bn/moving_variance:0"], dtype=np.float64)
    scale = 1.0 / np.sqrt(var + BN_EPS)
    return scale, beta - mean * scale


class YamnetFP32:
    """Holds BN-folded FP32 weights; `forward` runs a batch of log-mel patches."""

    def __init__(self, h5_path=YAMNET_H5):
        self.layers = []   # list of dicts with the folded weights per YAMNet layer
        with h5py.File(h5_path, "r") as f:
            for i, (kind, k, s, cout) in enumerate(LAYER_DEFS, start=1):
                L = {"kind": kind, "k": k, "stride": s, "cout": cout, "name": f"layer{i}"}
                if kind == "conv":
                    w = np.array(f[f"layer{i}/conv/layer{i}/conv/kernel:0"], dtype=np.float64)  # (3,3,1,32)
                    sc, b = _bn_fold(f, f"layer{i}/conv")
                    L["w"] = (w * sc[None, None, None, :]).astype(np.float32)     # (3,3,1,32) [ky][kx][ci][co]
                    L["b"] = b.astype(np.float32)
                else:
                    dw = np.array(f[f"layer{i}/depthwise_conv/layer{i}/depthwise_conv/depthwise_kernel:0"],
                                  dtype=np.float64)[..., 0]                         # (3,3,C)
                    sc, b = _bn_fold(f, f"layer{i}/depthwise_conv")
                    L["dw_w"] = (dw * sc[None, None, :]).astype(np.float32)        # [ky][kx][c]
                    L["dw_b"] = b.astype(np.float32)
                    pw = np.array(f[f"layer{i}/pointwise_conv/layer{i}/pointwise_conv/kernel:0"],
                                  dtype=np.float64)[0, 0]                           # (Cin, Cout)
                    sc, b = _bn_fold(f, f"layer{i}/pointwise_conv")
                    L["pw_w"] = (pw * sc[None, :]).astype(np.float32)              # [ci][co]
                    L["pw_b"] = b.astype(np.float32)
                self.layers.append(L)
            self.logits_w = np.array(f["logits/logits/kernel:0"], dtype=np.float32)   # (1024, 521)
            self.logits_b = np.array(f["logits/logits/bias:0"], dtype=np.float32)

    # ---- primitive ops (NHWC, batched) ------------------------------------------------------
    @staticmethod
    def conv3x3_ci1(x, w, b, stride):
        """x:(N,H,W,1), w:(3,3,1,Co) -> relu(conv)+bias, 'SAME'."""
        N, H, W, _ = x.shape
        pt, pb, Ho = same_pad(H, 3, stride)
        pl, pr, Wo = same_pad(W, 3, stride)
        xp = np.pad(x, ((0, 0), (pt, pb), (pl, pr), (0, 0)))
        out = np.zeros((N, Ho, Wo, w.shape[-1]), dtype=np.float32)
        for ky in range(3):
            for kx in range(3):
                patch = xp[:, ky:ky + stride * Ho:stride, kx:kx + stride * Wo:stride, :]   # (N,Ho,Wo,1)
                out += patch * w[ky, kx, 0][None, None, None, :]
        return np.maximum(out + b, 0.0)

    @staticmethod
    def depthwise3x3(x, w, b, stride):
        N, H, W, C = x.shape
        pt, pb, Ho = same_pad(H, 3, stride)
        pl, pr, Wo = same_pad(W, 3, stride)
        xp = np.pad(x, ((0, 0), (pt, pb), (pl, pr), (0, 0)))
        out = np.zeros((N, Ho, Wo, C), dtype=np.float32)
        for ky in range(3):
            for kx in range(3):
                out += xp[:, ky:ky + stride * Ho:stride, kx:kx + stride * Wo:stride, :] * w[ky, kx][None, None, None, :]
        return np.maximum(out + b, 0.0)

    @staticmethod
    def pointwise(x, w, b):
        N, H, W, C = x.shape
        y = x.reshape(-1, C) @ w + b
        return np.maximum(y, 0.0).reshape(N, H, W, w.shape[1])

    def forward(self, patches, collect=None):
        """patches: (N,96,64) log-mel. Returns (N,1024) embeddings.

        `collect`, if a dict, receives every intermediate tensor under the keys
        'in', 'l1', 'l{i}_dw', 'l{i}_pw' (i=2..14) and 'emb'.
        """
        x = np.asarray(patches, dtype=np.float32)[..., None]
        if collect is not None:
            collect["in"] = x
        for i, L in enumerate(self.layers, start=1):
            if L["kind"] == "conv":
                x = self.conv3x3_ci1(x, L["w"], L["b"], L["stride"])
                if collect is not None:
                    collect["l1"] = x
            else:
                x = self.depthwise3x3(x, L["dw_w"], L["dw_b"], L["stride"])
                if collect is not None:
                    collect[f"l{i}_dw"] = x
                x = self.pointwise(x, L["pw_w"], L["pw_b"])
                if collect is not None:
                    collect[f"l{i}_pw"] = x
        emb = x.mean(axis=(1, 2)).astype(np.float32)
        if collect is not None:
            collect["emb"] = emb
        return emb

    def logits(self, emb):
        return emb @ self.logits_w + self.logits_b
