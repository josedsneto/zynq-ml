"""Post-training INT8 quantization (with Cross-Layer Activation Equalization) and bit-exact
integer golden model for YAMNet + ARARA Head.

Every operation in `YamnetInt8Golden` uses the exact integer arithmetic executed by:
  * the Zynq PL 64-MAC INT8 Tensor/Pointwise Accelerator (`logic/axi_cnn_accelerator.vhd`) for all
    13 pointwise 1x1 conv layers + 2 classifier Dense layers (96.3% of total MACs), and
  * the ARM Cortex-A9 INT8 engine (`software/cnn_int8.c`) for Conv1 3x3, the 13 Depthwise 3x3
    layers, and Global Average Pooling (3.7% of total MACs).
"""

import copy
import numpy as np
from .yamnet_np import YamnetFP32, same_pad
from .head import Head, softmax, map_8_to_4


def equalize_for_int8(fp32_net: YamnetFP32, fp32_head: Head, calib_patches: np.ndarray,
                      floor_ratio: float = 0.08):
    """Cross-layer per-channel activation equalization (Nagel et al., ICCV 2019).
    Mathematically equivalent in FP32 (ReLU homogeneity: ReLU(a*x) = a*ReLU(x) for a > 0),
    eliminating MobileNetV1's 20x outlier channels in layers 11-14 before INT8 quantization.
    """
    net_eq = copy.deepcopy(fp32_net)
    hd_eq = copy.deepcopy(fp32_head)

    def chan_scale(act):
        flat = act.reshape(-1, act.shape[-1])
        s = np.percentile(flat, 99.9, axis=0)
        s_max = max(float(s.max()), 1e-5)
        return np.maximum(s, s_max * floor_ratio).astype(np.float32)

    x = np.asarray(calib_patches, dtype=np.float32)[..., None]
    for i, L in enumerate(net_eq.layers, start=1):
        if L["kind"] == "conv":
            y = net_eq.conv3x3_ci1(x, L["w"], L["b"], L["stride"])
            s = chan_scale(y)
            L["w"] = L["w"] / s[None, None, None, :]
            L["b"] = L["b"] / s
            net_eq.layers[i]["dw_w"] = net_eq.layers[i]["dw_w"] * s[None, None, :]
            x = y / s[None, None, None, :]
        else:
            y_dw = net_eq.depthwise3x3(x, L["dw_w"], L["dw_b"], L["stride"])
            s_dw = chan_scale(y_dw)
            L["dw_w"] = L["dw_w"] / s_dw[None, None, :]
            L["dw_b"] = L["dw_b"] / s_dw
            L["pw_w"] = L["pw_w"] * s_dw[:, None]
            x_dw = y_dw / s_dw[None, None, :]

            y_pw = net_eq.pointwise(x_dw, L["pw_w"], L["pw_b"])
            s_pw = chan_scale(y_pw)
            L["pw_w"] = L["pw_w"] / s_pw[None, :]
            L["pw_b"] = L["pw_b"] / s_pw
            if i < len(net_eq.layers):
                net_eq.layers[i]["dw_w"] = net_eq.layers[i]["dw_w"] * s_pw[None, None, :]
            else:
                hd_eq.w1 = hd_eq.w1 * s_pw[:, None]
            x = y_pw / s_pw[None, None, :]

    emb_eq = x.mean(axis=(1, 2))
    h1 = hd_eq.hidden(emb_eq)
    s_h1 = chan_scale(h1)
    hd_eq.w1 = hd_eq.w1 / s_h1[None, :]
    hd_eq.b1 = hd_eq.b1 / s_h1
    hd_eq.w2 = hd_eq.w2 * s_h1[:, None]
    return net_eq, hd_eq


def make_requant_params(real_scales):
    """Encode positive float array `real_scales` as (mult_int32, shift_uint8) with
    mult in [2^29, 2^30 - 1] (31-bit signed positive) and shift in [1, 62] so that:
        round(acc * real_scale) ~= (acc * mult + (1 << (shift - 1))) >> shift
    """
    mults = np.zeros(len(real_scales), dtype=np.int32)
    shifts = np.zeros(len(real_scales), dtype=np.uint8)
    for i, m in enumerate(real_scales):
        m = float(m)
        if m <= 0.0:
            mults[i] = 0
            shifts[i] = 31
            continue
        shift = 30
        while m * (1 << shift) < (1 << 29) and shift < 62:
            shift += 1
        while m * (1 << shift) >= (1 << 30) and shift > 1:
            shift -= 1
        q = int(round(m * (1 << shift)))
        if q >= (1 << 30):
            q = (1 << 30) - 1
        mults[i] = q
        shifts[i] = shift
    return mults, shifts


def requant_vec(acc_i32, mult_i32, shift_u8, out_zp, relu=True):
    """Bit-exact vectorised version of the hardware requantizer."""
    acc = acc_i32.astype(np.int64, copy=True)
    if relu:
        acc = np.maximum(acc, 0)
    sh = shift_u8.astype(np.int64)
    rnd = np.int64(1) << (sh - 1)
    scaled = (acc * mult_i32.astype(np.int64) + rnd) >> sh
    out = scaled + np.int64(out_zp)
    return np.clip(out, -128, 127).astype(np.int8)


def quantize_weights_per_channel(w_out_first):
    """w_out_first: (Cout, K) float32 -> (w_q int8 (Cout, K), w_scale float64 (Cout,))."""
    w64 = w_out_first.astype(np.float64)
    max_abs = np.maximum(np.max(np.abs(w64), axis=1), 1e-8)
    scale = max_abs / 127.0
    w_q = np.clip(np.round(w64 / scale[:, None]), -127, 127).astype(np.int8)
    return w_q, scale


class YamnetInt8Golden:
    """Calibrates (with cross-layer equalization) and executes bit-exact INT8 YAMNet + ARARA Head."""

    def __init__(self, fp32_net: YamnetFP32, fp32_head: Head, calib_patches: np.ndarray,
                 percentile: float = 99.99, equalize: bool = True):
        if equalize:
            fp32_net, fp32_head = equalize_for_int8(fp32_net, fp32_head, calib_patches)
        self.ops = []
        acts = {}
        emb_cal = fp32_net.forward(calib_patches, collect=acts)
        h1_cal = fp32_head.hidden(emb_cal)

        x_in = acts["in"]
        xmin = min(float(np.percentile(x_in, 100.0 - percentile)), 0.0)
        xmax = max(float(np.percentile(x_in, percentile)), 1e-5)
        self.in_scale = (xmax - xmin) / 255.0
        self.in_zp = int(np.clip(round(-128.0 - xmin / self.in_scale), -128, 127))

        def relu_act_scale(t):
            amax = max(float(np.percentile(t, percentile)), 1e-5)
            return amax / 255.0, -128

        cur_scale, cur_zp = self.in_scale, self.in_zp

        for i, L in enumerate(fp32_net.layers, start=1):
            if L["kind"] == "conv":
                w_co = np.transpose(L["w"][:, :, 0, :], (2, 0, 1)).reshape(32, 9)
                w_q, w_sc = quantize_weights_per_channel(w_co)
                out_sc, out_zp = relu_act_scale(acts["l1"])
                b_q = np.round(L["b"].astype(np.float64) / (cur_scale * w_sc)).astype(np.int64)
                b_fold = (b_q - cur_zp * np.sum(w_q.astype(np.int64), axis=1)).astype(np.int32)
                mult, shift = make_requant_params((cur_scale * w_sc) / out_sc)
                self.ops.append({
                    "type": "conv1", "name": "l1_conv", "stride": L["stride"],
                    "cin": 1, "cout": 32,
                    "in_zp": cur_zp, "out_zp": out_zp,
                    "w_q": w_q.reshape(32, 3, 3), "b_fold": b_fold,
                    "mult": mult, "shift": shift,
                    "out_scale": out_sc,
                })
                cur_scale, cur_zp = out_sc, out_zp
            else:
                C = L["dw_w"].shape[2]
                dw_co = np.transpose(L["dw_w"], (2, 0, 1)).reshape(C, 9)
                dw_q, dw_sc = quantize_weights_per_channel(dw_co)
                out_sc, out_zp = relu_act_scale(acts[f"l{i}_dw"])
                b_q = np.round(L["dw_b"].astype(np.float64) / (cur_scale * dw_sc)).astype(np.int64)
                b_fold = (b_q - cur_zp * np.sum(dw_q.astype(np.int64), axis=1)).astype(np.int32)
                mult, shift = make_requant_params((cur_scale * dw_sc) / out_sc)
                self.ops.append({
                    "type": "dw", "name": f"l{i}_dw", "stride": L["stride"],
                    "channels": C,
                    "in_zp": cur_zp, "out_zp": out_zp,
                    "w_q": dw_q.reshape(C, 3, 3), "b_fold": b_fold,
                    "mult": mult, "shift": shift,
                    "out_scale": out_sc,
                })
                cur_scale, cur_zp = out_sc, out_zp

                Cout = L["cout"]
                pw_co = L["pw_w"].T.copy()
                pw_q, pw_sc = quantize_weights_per_channel(pw_co)
                out_sc, out_zp = relu_act_scale(acts[f"l{i}_pw"])
                b_q = np.round(L["pw_b"].astype(np.float64) / (cur_scale * pw_sc)).astype(np.int64)
                b_fold = (b_q - cur_zp * np.sum(pw_q.astype(np.int64), axis=1)).astype(np.int32)
                mult, shift = make_requant_params((cur_scale * pw_sc) / out_sc)
                self.ops.append({
                    "type": "pw", "name": f"l{i}_pw",
                    "cin": C, "cout": Cout,
                    "in_zp": cur_zp, "out_zp": out_zp,
                    "w_q": pw_q, "b_fold": b_fold,
                    "mult": mult, "shift": shift,
                    "out_scale": out_sc,
                })
                cur_scale, cur_zp = out_sc, out_zp

        self.emb_scale = cur_scale
        self.emb_zp = cur_zp

        h1_co = fp32_head.w1.T.copy()
        h1_q, h1_sc = quantize_weights_per_channel(h1_co)
        h1_out_sc, h1_out_zp = relu_act_scale(h1_cal)
        b1_q = np.round(fp32_head.b1.astype(np.float64) / (cur_scale * h1_sc)).astype(np.int64)
        b1_fold = (b1_q - cur_zp * np.sum(h1_q.astype(np.int64), axis=1)).astype(np.int32)
        h1_mult, h1_shift = make_requant_params((cur_scale * h1_sc) / h1_out_sc)
        self.head_fc1 = {
            "type": "dense", "name": "head_fc1",
            "cin": 1024, "cout": 512,
            "in_zp": cur_zp, "out_zp": h1_out_zp,
            "w_q": h1_q, "b_fold": b1_fold,
            "mult": h1_mult, "shift": h1_shift,
            "out_scale": h1_out_sc,
        }

        h2_co = fp32_head.w2.T.copy()
        h2_q, h2_sc = quantize_weights_per_channel(h2_co)
        b2_q = np.round(fp32_head.b2.astype(np.float64) / (h1_out_sc * h2_sc)).astype(np.int64)
        b2_fold = (b2_q - h1_out_zp * np.sum(h2_q.astype(np.int64), axis=1)).astype(np.int32)
        self.head_fc2 = {
            "type": "dense_raw", "name": "head_fc2",
            "cin": 512, "cout": 8,
            "in_zp": h1_out_zp,
            "w_q": h2_q, "b_fold": b2_fold,
            "logit_scale": (h1_out_sc * h2_sc).astype(np.float32),
        }

    def quantize_input(self, patches_fp32):
        q = np.round(patches_fp32 / np.float32(self.in_scale)) + self.in_zp
        return np.clip(q, -128, 127).astype(np.int8)

    @staticmethod
    def _run_conv1(x_q, op):
        N, H, W, _ = x_q.shape
        s = op["stride"]
        pt, pb, Ho = same_pad(H, 3, s)
        pl, pr, Wo = same_pad(W, 3, s)
        xp = np.pad(x_q, ((0, 0), (pt, pb), (pl, pr), (0, 0)),
                    mode="constant", constant_values=op["in_zp"]).astype(np.int32)
        acc = np.broadcast_to(op["b_fold"].astype(np.int32), (N, Ho, Wo, op["cout"])).copy()
        w_i32 = op["w_q"].astype(np.int32)
        for ky in range(3):
            for kx in range(3):
                sl = xp[:, ky:ky + s * Ho:s, kx:kx + s * Wo:s, 0]
                acc += sl[..., None] * w_i32[:, ky, kx][None, None, None, :]
        return requant_vec(acc, op["mult"], op["shift"], op["out_zp"], relu=True)

    @staticmethod
    def _run_dw(x_q, op):
        N, H, W, C = x_q.shape
        s = op["stride"]
        pt, pb, Ho = same_pad(H, 3, s)
        pl, pr, Wo = same_pad(W, 3, s)
        xp = np.pad(x_q, ((0, 0), (pt, pb), (pl, pr), (0, 0)),
                    mode="constant", constant_values=op["in_zp"]).astype(np.int32)
        acc = np.broadcast_to(op["b_fold"].astype(np.int32), (N, Ho, Wo, C)).copy()
        w_i32 = op["w_q"].astype(np.int32)
        for ky in range(3):
            for kx in range(3):
                sl = xp[:, ky:ky + s * Ho:s, kx:kx + s * Wo:s, :]
                acc += sl * w_i32[:, ky, kx][None, None, :]
        return requant_vec(acc, op["mult"], op["shift"], op["out_zp"], relu=True)

    @staticmethod
    def _run_pw(x_q, op):
        N, H, W, C = x_q.shape
        flat = x_q.reshape(-1, C).astype(np.int32)
        acc = flat @ op["w_q"].T.astype(np.int32) + op["b_fold"].astype(np.int32)
        out = requant_vec(acc, op["mult"], op["shift"], op["out_zp"], relu=True)
        return out.reshape(N, H, W, op["cout"])

    @staticmethod
    def _run_gap6(x_q):
        u = x_q.astype(np.int32) + 128
        s = u.sum(axis=(1, 2))
        avg_u = (s * 10923 + 32768) >> 16
        return np.clip(avg_u - 128, -128, 127).astype(np.int8)

    def forward_logits8(self, patches_fp32):
        x = self.quantize_input(patches_fp32)[..., None]
        for op in self.ops:
            if op["type"] == "conv1":
                x = self._run_conv1(x, op)
            elif op["type"] == "dw":
                x = self._run_dw(x, op)
            else:
                x = self._run_pw(x, op)
        emb_q = self._run_gap6(x)
        acc1 = emb_q.astype(np.int32) @ self.head_fc1["w_q"].T.astype(np.int32) + self.head_fc1["b_fold"].astype(np.int32)
        h1_q = requant_vec(acc1, self.head_fc1["mult"], self.head_fc1["shift"], self.head_fc1["out_zp"], relu=True)
        acc2 = h1_q.astype(np.int32) @ self.head_fc2["w_q"].T.astype(np.int32) + self.head_fc2["b_fold"].astype(np.int32)
        return acc2.astype(np.float32) * self.head_fc2["logit_scale"][None, :]

    def probs4(self, patches_fp32):
        p8 = softmax(self.forward_logits8(patches_fp32), axis=-1)
        return map_8_to_4(p8)
