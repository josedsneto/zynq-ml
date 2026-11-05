#!/usr/bin/env python3
"""Export YAMNet + ARARA Deforestation Classifier weights, audio frontend tables,
and ESC-50 Fold-5 evaluation dataset for bare-metal Zynq-7000 execution.

Outputs:
  * build/model_blob.bin      : 4 KB-aligned binary payload embedded via .incbin
  * software/model_blob.s     : GAS wrapper placing g_model_blob in .rodata
  * software/model_weights.h  : Typed C descriptors, constants & declarations
  * software/model_weights.c  : Const descriptor tables bound into g_model_blob
"""

import os
import struct
import sys
import numpy as np

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_DIR = os.path.dirname(SCRIPT_DIR)
sys.path.insert(0, SCRIPT_DIR)

from arara import BUILD_DIR, frontend, yamnet_np, head, dataset, quant  # noqa: E402
from prepare_features import CATEGORIES, main as run_prepare_features    # noqa: E402

# Map the 8 ARARA categories -> 4 reported classes:
# [0: chainsaw, 1: rain, 2: engine, 3: hand_saw, 4: chirping_birds, 5: thunderstorm, 6: wind, 7: insects]
CAT8_TO_CLASS4 = np.array([0, 3, 1, 2, 3, 3, 3, 3], dtype=np.uint8)
CLASS4_NAMES = ["chainsaw", "engine", "hand_saw", "others"]


class BlobBuilder:
    """Packs aligned binary tensors into a single contiguous byte buffer."""

    def __init__(self):
        self.buf = bytearray()

    def align(self, alignment: int):
        rem = len(self.buf) % alignment
        if rem != 0:
            self.buf.extend(b"\x00" * (alignment - rem))

    def add_bytes(self, data: bytes, alignment: int = 16) -> int:
        self.align(alignment)
        offset = len(self.buf)
        self.buf.extend(data)
        return offset

    def add_array(self, arr: np.ndarray, dtype, alignment: int = 16) -> int:
        a = np.ascontiguousarray(arr, dtype=dtype)
        return self.add_bytes(a.tobytes(), alignment=alignment)


def pack_accel_dma_stream(w_q: np.ndarray, b_fold: np.ndarray,
                          mult: np.ndarray, shift: np.ndarray) -> bytes:
    """Pack per-layer (w_q[N, K], b_fold[N], mult[N], shift[N]) into the exact
    128-byte-header + tiled weight stream consumed by logic/axi_cnn_accelerator.vhd.

    For each tile t in 0 .. (N/8)-1:
      - Words 0..7  (uint64): low32 = int32 b_fold[8*t+j], high32 = int32 mult[8*t+j]
      - Word  8     (uint64): bytes 0..7 = uint8 shift[8*t .. 8*t+7]
      - Words 9..15 (uint64): zero padding (completes 128-byte tile header)
      - Words 16..16+K-1    : for k8 in 0..(K/8)-1, for j in 0..7:
                              8 bytes w_q[8*t+j, 8*k8 .. 8*k8+7]
    """
    n_out, k_in = w_q.shape
    assert n_out % 8 == 0 and k_in % 8 == 0, f"Invalid (N, K)=({n_out}, {k_in})"
    n_tiles = n_out // 8

    # Reshape weights: (n_tiles, 8, k_in//8, 8) -> transpose to (n_tiles, k_in//8, 8, 8)
    w_tiled = np.ascontiguousarray(
        w_q.astype(np.int8).reshape(n_tiles, 8, k_in // 8, 8).transpose(0, 2, 1, 3)
    )

    out = bytearray()
    for t in range(n_tiles):
        hdr = bytearray(128)
        for j in range(8):
            ch = 8 * t + j
            b_val = int(b_fold[ch])
            m_val = int(mult[ch])
            struct.pack_into("<ii", hdr, j * 8, b_val, m_val)
        for j in range(8):
            hdr[64 + j] = int(shift[8 * t + j]) & 0xFF
        out.extend(hdr)
        out.extend(w_tiled[t].tobytes())

    expected_len = n_tiles * (128 + 8 * k_in)
    assert len(out) == expected_len
    return bytes(out)


def select_representative_pcm_clips(esc: dataset.ESC50, npz_data, per_class: int = 4):
    """Select `per_class` Fold-5 real 16 kHz PCM 15,600-sample windows per class (16 total)
    with non-trivial acoustic energy for end-to-end C STFT/Mel frontend benchmarking.
    """
    clip_files = [str(f) for f in npz_data["clip_files"]]
    cat_arr = npz_data["cat"]
    fold_arr = npz_data["fold"]
    patch_arr = npz_data["patch"]
    logmel_arr = npz_data["logmel"]

    pcm_windows = []
    pcm_labels = []
    pcm_ref_patches = []
    pcm_names = []

    for c4 in range(4):
        # Find Fold-5 clips belonging to class c4
        cand_indices = np.where((fold_arr == 5) & (CAT8_TO_CLASS4[cat_arr] == c4))[0]
        seen_clips = []
        for idx in cand_indices:
            cid = int(npz_data["clip"][idx])
            if cid not in seen_clips:
                seen_clips.append(cid)
            if len(seen_clips) >= per_class:
                break

        for cid in seen_clips:
            fname = clip_files[cid]
            wav_f32 = esc.load(fname)
            wav_pad = frontend.pad_waveform(wav_f32)
            # Pick the patch within this clip that has highest mean log-mel energy
            clip_mask = np.where(npz_data["clip"] == cid)[0]
            best_local = max(clip_mask, key=lambda idx: float(logmel_arr[idx].mean()))
            p_idx = int(patch_arr[best_local])
            start = p_idx * frontend.PATCH_HOP_SAMPLES
            seg_f32 = wav_pad[start:start + frontend.PATCH_SAMPLES]
            seg_i16 = np.clip(np.round(seg_f32 * 32768.0), -32768, 32767).astype(np.int16)
            ref_patch = frontend.log_mel_patch(seg_i16.astype(np.float32) / 32768.0)

            pcm_windows.append(seg_i16)
            pcm_labels.append(c4)
            pcm_ref_patches.append(ref_patch)
            pcm_names.append(f"{fname}#p{p_idx}")

    return (
        np.stack(pcm_windows).astype(np.int16),
        np.array(pcm_labels, dtype=np.uint8),
        np.stack(pcm_ref_patches).astype(np.float32),
        pcm_names,
    )


def main():
    os.makedirs(BUILD_DIR, exist_ok=True)
    feat_path = os.path.join(BUILD_DIR, "features_esc50.npz")
    if not os.path.exists(feat_path):
        print("[*] Extracting ESC-50 features first...")
        run_prepare_features()

    print("[1/5] Loading YAMNet + ARARA Head & ESC-50 cached features...")
    data = np.load(feat_path, allow_pickle=False)
    logmel = data["logmel"].astype(np.float32)
    cat8 = data["cat"]
    fold = data["fold"]
    y4_all = CAT8_TO_CLASS4[cat8]

    fp32_net = yamnet_np.YamnetFP32()
    fp32_head = head.Head()

    # Calibrate INT8 strictly on training folds (Folds 1-3); hyperparameters
    # (floor_ratio=0.05, percentile=99.95) selected on official validation Fold 4 (94.53%)
    train_idx = np.where(np.isin(fold, [1, 2, 3]))[0]
    calib_sel = train_idx[::4]
    calib_patches = logmel[calib_sel]

    print("[2/5] Calibrating Cross-Layer Equalized INT8 Model on Folds 1-3...")
    eq_net, eq_head = quant.equalize_for_int8(fp32_net, fp32_head, calib_patches, floor_ratio=0.05)
    int8_gold = quant.YamnetInt8Golden(eq_net, eq_head, calib_patches, percentile=99.95, equalize=False)

    # Sanity-verify Fold-5 accuracy right here before exporting
    test_idx = np.where(fold == 5)[0]
    test_patches = logmel[test_idx]
    test_labels = y4_all[test_idx]

    emb_test = data["emb"][test_idx]
    fp32_pred = fp32_head.probs4(emb_test).argmax(axis=-1)
    int8_pred = np.concatenate([
        int8_gold.probs4(test_patches[i:i + 64]).argmax(axis=-1)
        for i in range(0, len(test_patches), 64)
    ])
    fp32_acc = 100.0 * float(np.mean(fp32_pred == test_labels))
    int8_acc = 100.0 * float(np.mean(int8_pred == test_labels))
    print(f"      Fold-5 Test Set (n={len(test_labels)}): FP32={fp32_acc:.2f}% | INT8={int8_acc:.2f}%")

    print("[3/5] Selecting 16 real 16 kHz PCM waveforms from ESC-50 Fold 5...")
    esc = dataset.ESC50()
    pcm_win, pcm_lbl, pcm_ref, pcm_names = select_representative_pcm_clips(esc, data, per_class=4)

    print("[4/5] Packing aligned binary model & dataset blob...")
    blob = BlobBuilder()

    # ---- A. Audio Frontend Tables ----
    hann_win = frontend.hann_periodic()                       # (400,) float32
    mel_mat = frontend.mel_matrix()                           # (257, 64) float32
    mel_mat_T = np.ascontiguousarray(mel_mat.T, dtype=np.float32)  # (64, 257) float32
    mel_start = np.zeros(frontend.N_MEL, dtype=np.uint16)
    mel_end = np.zeros(frontend.N_MEL, dtype=np.uint16)
    for m in range(frontend.N_MEL):
        nz = np.nonzero(mel_mat_T[m] > 0.0)[0]
        mel_start[m] = int(nz[0]) if len(nz) else 0
        mel_end[m] = int(nz[-1] + 1) if len(nz) else 0

    off_hann = blob.add_array(hann_win, np.float32, alignment=64)
    off_mel_T = blob.add_array(mel_mat_T, np.float32, alignment=64)
    off_mel_start = blob.add_array(mel_start, np.uint16, alignment=16)
    off_mel_end = blob.add_array(mel_end, np.uint16, alignment=16)

    # ---- B. FP32 YAMNet + ARARA Head Weights ----
    L1 = fp32_net.layers[0]
    # L1["w"] is (3, 3, 1, 32) -> reshape (3, 3, 32) [ky][kx][co]
    off_fp32_l1_w = blob.add_array(L1["w"][:, :, 0, :], np.float32, alignment=64)
    off_fp32_l1_b = blob.add_array(L1["b"], np.float32, alignment=64)

    fp32_sep_meta = []
    h_cur, w_cur, c_cur = 48, 32, 32
    for idx in range(1, 14):
        L = fp32_net.layers[idx]
        s = int(L["stride"])
        cout = int(L["cout"])
        pt, pb, h_out = yamnet_np.same_pad(h_cur, 3, s)
        pl, pr, w_out = yamnet_np.same_pad(w_cur, 3, s)
        off_dw_w = blob.add_array(L["dw_w"], np.float32, alignment=64)   # [3][3][c_cur]
        off_dw_b = blob.add_array(L["dw_b"], np.float32, alignment=64)
        off_pw_w = blob.add_array(L["pw_w"], np.float32, alignment=64)   # [c_cur][cout]
        off_pw_b = blob.add_array(L["pw_b"], np.float32, alignment=64)
        fp32_sep_meta.append({
            "h_in": h_cur, "w_in": w_cur, "h_out": h_out, "w_out": w_out,
            "cin": c_cur, "cout": cout, "stride": s,
            "pt": pt, "pb": pb, "pl": pl, "pr": pr,
            "off_dw_w": off_dw_w, "off_dw_b": off_dw_b,
            "off_pw_w": off_pw_w, "off_pw_b": off_pw_b,
        })
        h_cur, w_cur, c_cur = h_out, w_out, cout

    off_fp32_fc1_w = blob.add_array(fp32_head.w1, np.float32, alignment=64)  # (1024, 512)
    off_fp32_fc1_b = blob.add_array(fp32_head.b1, np.float32, alignment=64)  # (512,)
    off_fp32_fc2_w = blob.add_array(fp32_head.w2, np.float32, alignment=64)  # (512, 8)
    off_fp32_fc2_b = blob.add_array(fp32_head.b2, np.float32, alignment=64)  # (8,)

    # ---- C. INT8 Conv1 + 13 Depthwise Layers (PS NEON INT8) ----
    op_conv1 = int8_gold.ops[0]
    assert op_conv1["type"] == "conv1"
    # Transpose (32, 3, 3) -> (3, 3, 32) so output channels are contiguous
    c1_wq_kkc = np.transpose(op_conv1["w_q"], (1, 2, 0)).copy()
    off_i8_l1_wq = blob.add_array(c1_wq_kkc, np.int8, alignment=64)
    off_i8_l1_bf = blob.add_array(op_conv1["b_fold"], np.int32, alignment=64)
    off_i8_l1_mu = blob.add_array(op_conv1["mult"], np.int32, alignment=64)
    off_i8_l1_sh = blob.add_array(op_conv1["shift"], np.uint8, alignment=64)

    int8_dw_meta = []
    int8_pw_meta = []
    h_cur, w_cur = 48, 32
    for idx in range(13):
        op_dw = int8_gold.ops[1 + 2 * idx]
        op_pw = int8_gold.ops[2 + 2 * idx]
        assert op_dw["type"] == "dw" and op_pw["type"] == "pw"
        s = int(op_dw["stride"])
        ch = int(op_dw["channels"])
        pt, pb, h_out = yamnet_np.same_pad(h_cur, 3, s)
        pl, pr, w_out = yamnet_np.same_pad(w_cur, 3, s)

        # Transpose (C, 3, 3) -> (3, 3, C) for contiguous NEON SIMD channel loads
        dw_wq_kkc = np.transpose(op_dw["w_q"], (1, 2, 0)).copy()
        off_dw_wq = blob.add_array(dw_wq_kkc, np.int8, alignment=64)
        off_dw_bf = blob.add_array(op_dw["b_fold"], np.int32, alignment=64)
        off_dw_mu = blob.add_array(op_dw["mult"], np.int32, alignment=64)
        off_dw_sh = blob.add_array(op_dw["shift"], np.uint8, alignment=64)

        int8_dw_meta.append({
            "h_in": h_cur, "w_in": w_cur, "h_out": h_out, "w_out": w_out,
            "channels": ch, "stride": s,
            "pt": pt, "pb": pb, "pl": pl, "pr": pr,
            "in_zp": int(op_dw["in_zp"]), "out_zp": int(op_dw["out_zp"]),
            "off_wq": off_dw_wq, "off_bf": off_dw_bf,
            "off_mu": off_dw_mu, "off_sh": off_dw_sh,
        })

        # Pointwise DMA stream (128-byte aligned for S_AXI_HP0 burst DMA)
        pw_stream = pack_accel_dma_stream(
            op_pw["w_q"], op_pw["b_fold"], op_pw["mult"], op_pw["shift"]
        )
        off_pw_dma = blob.add_bytes(pw_stream, alignment=128)
        int8_pw_meta.append({
            "m": h_out * w_out,
            "k": int(op_pw["cin"]),
            "n": int(op_pw["cout"]),
            "in_zp": int(op_pw["in_zp"]),
            "out_zp": int(op_pw["out_zp"]),
            "relu_en": 1,
            "raw_i32_en": 0,
            "off_dma": off_pw_dma,
            "dma_bytes": len(pw_stream),
        })
        h_cur, w_cur = h_out, w_out

    # ---- D. INT8 Classifier Head DMA Streams (head_fc1 & head_fc2) ----
    fc1 = int8_gold.head_fc1
    fc1_stream = pack_accel_dma_stream(
        fc1["w_q"], fc1["b_fold"], fc1["mult"], fc1["shift"]
    )
    off_fc1_dma = blob.add_bytes(fc1_stream, alignment=128)

    fc2 = int8_gold.head_fc2
    fc2_dummy_mult = np.zeros(8, dtype=np.int32)
    fc2_dummy_shift = np.ones(8, dtype=np.uint8)
    fc2_stream = pack_accel_dma_stream(
        fc2["w_q"], fc2["b_fold"], fc2_dummy_mult, fc2_dummy_shift
    )
    off_fc2_dma = blob.add_bytes(fc2_stream, alignment=128)
    off_fc2_lscale = blob.add_array(fc2["logit_scale"], np.float32, alignment=64)

    # ---- E. Embedded ESC-50 Fold-5 Benchmark Dataset & 16 Real PCM Waveforms ----
    off_test_patches = blob.add_array(test_patches, np.float32, alignment=64)
    off_test_labels = blob.add_array(test_labels, np.uint8, alignment=64)
    off_fp32_gold_pred = blob.add_array(fp32_pred.astype(np.uint8), np.uint8, alignment=64)
    off_int8_gold_pred = blob.add_array(int8_pred.astype(np.uint8), np.uint8, alignment=64)

    off_pcm_win = blob.add_array(pcm_win, np.int16, alignment=64)
    off_pcm_lbl = blob.add_array(pcm_lbl, np.uint8, alignment=64)
    off_pcm_ref = blob.add_array(pcm_ref, np.float32, alignment=64)

    blob.align(4096)
    blob_path = os.path.join(BUILD_DIR, "model_blob.bin")
    with open(blob_path, "wb") as fh:
        fh.write(blob.buf)
    print(f"      Wrote {blob_path} ({len(blob.buf) / (1024 * 1024):.2f} MiB)")

    # ---- Write software/model_blob.s ----
    sw_dir = os.path.join(REPO_DIR, "software")
    s_path = os.path.join(sw_dir, "model_blob.s")
    with open(s_path, "w", encoding="utf-8") as fh:
        fh.write(
            '/* Auto-generated by python/generate_model.py */\n'
            '    .section .rodata\n'
            '    .balign 4096\n'
            '    .global g_model_blob\n'
            'g_model_blob:\n'
            '    .incbin "build/model_blob.bin"\n'
            '    .global g_model_blob_end\n'
            'g_model_blob_end:\n'
            '    .section .note.GNU-stack,"",%progbits\n'
        )

    # ---- Compute total MACs & FLOPs for exact hardware reporting ----
    # Conv1: 48*32*9*1*32 = 442,368 MACs
    total_macs = 48 * 32 * 9 * 1 * 32
    pw_dma_macs = 0
    for m_dw, m_pw in zip(int8_dw_meta, int8_pw_meta):
        total_macs += m_dw["h_out"] * m_dw["w_out"] * 9 * m_dw["channels"]
        layer_pw_macs = m_pw["m"] * m_pw["k"] * m_pw["n"]
        total_macs += layer_pw_macs
        pw_dma_macs += layer_pw_macs
    # Head Dense layers: 1024*512 + 512*8
    head_macs = 1024 * 512 + 512 * 8
    total_macs += head_macs
    pw_dma_macs += head_macs
    total_ops = 2 * total_macs

    print(f"[5/5] Writing software/model_weights.h and software/model_weights.c...")
    print(f"      Total Network MACs/patch = {total_macs:,} ({total_ops:,} OPs; "
          f"PL DMA Tensor Engine = {pw_dma_macs:,} MACs = {100.0 * pw_dma_macs / total_macs:.1f}%)")

    h_path = os.path.join(sw_dir, "model_weights.h")
    with open(h_path, "w", encoding="utf-8") as fh:
        fh.write(f"""/* Auto-generated by python/generate_model.py -- DO NOT EDIT MANUALLY */
#ifndef MODEL_WEIGHTS_H
#define MODEL_WEIGHTS_H

#include <stdint.h>

/* Audio & Spectrogram Geometry (YAMNet + ARARA) */
#define ARARA_SAMPLE_RATE        16000
#define ARARA_STFT_WIN           400
#define ARARA_STFT_HOP           160
#define ARARA_FFT_SIZE           512
#define ARARA_FFT_BINS           257
#define ARARA_MEL_BANDS          64
#define ARARA_PATCH_FRAMES       96
#define ARARA_PATCH_HOP_FRAMES   48
#define ARARA_PATCH_SAMPLES      15600
#define ARARA_PATCH_HOP_SAMPLES  7680
#define ARARA_LOG_OFFSET         0.001f

/* Network Dimensions & Compute Complexity */
#define ARARA_NUM_SEP_LAYERS     13
#define ARARA_EMBEDDING_DIM      1024
#define ARARA_HEAD_HIDDEN_DIM    512
#define ARARA_RAW_CLASSES        8
#define ARARA_NUM_CLASSES        4

#define ARARA_TOTAL_MACS         {total_macs}ULL
#define ARARA_PL_ACCEL_MACS      {pw_dma_macs}ULL
#define ARARA_TOTAL_OPS          {total_ops}.0f
#define ARARA_RPI3_REF_MS        1250.0f   /* Paper Sec. IV-B: Raspberry Pi 3 Model B latency */

/* Embedded ESC-50 Fold-5 Test Dataset & Waveform Clips */
#define ARARA_NUM_TEST_PATCHES   {len(test_labels)}
#define ARARA_NUM_PCM_CLIPS      {len(pcm_lbl)}

/* Input Quantization Parameters (INT8 Pipeline) */
#define ARARA_INT8_IN_SCALE      {float(int8_gold.in_scale):.10e}f
#define ARARA_INT8_IN_INV_SCALE  {float(1.0 / int8_gold.in_scale):.10e}f
#define ARARA_INT8_IN_ZP         ({int(int8_gold.in_zp)})
#define ARARA_INT8_CONV1_OUT_ZP  ({int(op_conv1["out_zp"])})

typedef struct {{
    uint16_t h_in, w_in;
    uint16_t h_out, w_out;
    uint16_t cin, cout;
    uint8_t  stride;
    uint8_t  pad_top, pad_bottom, pad_left, pad_right;
    const float *dw_w;   /* [3 * 3 * cin], layout [ky][kx][c] */
    const float *dw_b;   /* [cin] */
    const float *pw_w;   /* [cin * cout], layout [ci][co] */
    const float *pw_b;   /* [cout] */
}} yamnet_fp32_sep_t;

typedef struct {{
    uint16_t h_in, w_in;
    uint16_t h_out, w_out;
    uint16_t channels;
    uint8_t  stride;
    uint8_t  pad_top, pad_bottom, pad_left, pad_right;
    int8_t   in_zp;
    int8_t   out_zp;
    const int8_t  *w_q;    /* [3 * 3 * C], layout [ky][kx][c] */
    const int32_t *b_fold; /* [C] */
    const int32_t *mult;   /* [C] */
    const uint8_t *shift;  /* [C] */
}} yamnet_int8_dw_t;

typedef struct {{
    uint16_t m;
    uint16_t k;
    uint16_t n;
    int8_t   in_zp;
    int8_t   out_zp;
    uint8_t  relu_en;
    uint8_t  raw_i32_en;
    const uint8_t *dma_stream;
    uint32_t dma_bytes;
}} yamnet_int8_dma_op_t;

extern const uint8_t g_model_blob[];
extern const uint8_t g_model_blob_end[];
extern const char * const g_arara_class_names[ARARA_NUM_CLASSES];
extern const char * const g_arara_pcm_clip_names[ARARA_NUM_PCM_CLIPS];

/* Audio Frontend Accessors */
const float    *arara_hann_window(void);
const float    *arara_mel_weights_T(void);    /* [64][257] */
const uint16_t *arara_mel_bin_start(void);    /* [64] */
const uint16_t *arara_mel_bin_end(void);      /* [64] */

/* FP32 Weights */
const float *arara_fp32_conv1_w(void);        /* [3][3][32] */
const float *arara_fp32_conv1_b(void);        /* [32] */
extern const yamnet_fp32_sep_t g_yamnet_fp32_sep[ARARA_NUM_SEP_LAYERS];
const float *arara_fp32_fc1_w(void);          /* [1024][512] */
const float *arara_fp32_fc1_b(void);          /* [512] */
const float *arara_fp32_fc2_w(void);          /* [512][8] */
const float *arara_fp32_fc2_b(void);          /* [8] */

/* INT8 Weights & Pre-Tiled PL DMA Streams */
const int8_t  *arara_int8_conv1_wq(void);     /* [3][3][32] */
const int32_t *arara_int8_conv1_bfold(void);  /* [32] */
const int32_t *arara_int8_conv1_mult(void);   /* [32] */
const uint8_t *arara_int8_conv1_shift(void);  /* [32] */

extern const yamnet_int8_dw_t     g_yamnet_int8_dw[ARARA_NUM_SEP_LAYERS];
extern const yamnet_int8_dma_op_t g_yamnet_int8_pw[ARARA_NUM_SEP_LAYERS];
extern const yamnet_int8_dma_op_t g_arara_int8_fc1;
extern const yamnet_int8_dma_op_t g_arara_int8_fc2;
const float *arara_int8_fc2_logit_scale(void); /* [8] */

/* Embedded ESC-50 Fold-5 Test Set & 16 kHz PCM Clips */
const float   *arara_test_patch(int idx);     /* [96 * 64] float32 */
const uint8_t *arara_test_labels(void);       /* [640] in 0..3 */
const uint8_t *arara_fp32_golden_preds(void); /* [640] */
const uint8_t *arara_int8_golden_preds(void); /* [640] */

const int16_t *arara_pcm_clip(int idx);       /* [15600] int16 @ 16 kHz */
const uint8_t *arara_pcm_labels(void);        /* [16] in 0..3 */
const float   *arara_pcm_ref_patch(int idx);  /* [96 * 64] float32 */

/* Initialize descriptor pointers (call once at boot) */
void model_weights_init(void);

#endif /* MODEL_WEIGHTS_H */
""")

    c_path = os.path.join(sw_dir, "model_weights.c")
    with open(c_path, "w", encoding="utf-8") as fh:
        lines = [
            "/* Auto-generated by python/generate_model.py -- DO NOT EDIT MANUALLY */",
            '#include "model_weights.h"',
            "",
            "#define BLOB_PTR(type, off) ((const type *)(g_model_blob + (off)))",
            "",
            "const char * const g_arara_class_names[ARARA_NUM_CLASSES] = {",
            '    "chainsaw", "engine", "hand_saw", "others"',
            "};",
            "",
            "const char * const g_arara_pcm_clip_names[ARARA_NUM_PCM_CLIPS] = {",
        ]
        for nm in pcm_names:
            lines.append(f'    "{nm}",')
        lines += [
            "};",
            "",
            f"const float    *arara_hann_window(void)   {{ return BLOB_PTR(float,    {off_hann}U); }}",
            f"const float    *arara_mel_weights_T(void) {{ return BLOB_PTR(float,    {off_mel_T}U); }}",
            f"const uint16_t *arara_mel_bin_start(void) {{ return BLOB_PTR(uint16_t, {off_mel_start}U); }}",
            f"const uint16_t *arara_mel_bin_end(void)   {{ return BLOB_PTR(uint16_t, {off_mel_end}U); }}",
            "",
            f"const float *arara_fp32_conv1_w(void) {{ return BLOB_PTR(float, {off_fp32_l1_w}U); }}",
            f"const float *arara_fp32_conv1_b(void) {{ return BLOB_PTR(float, {off_fp32_l1_b}U); }}",
            f"const float *arara_fp32_fc1_w(void)   {{ return BLOB_PTR(float, {off_fp32_fc1_w}U); }}",
            f"const float *arara_fp32_fc1_b(void)   {{ return BLOB_PTR(float, {off_fp32_fc1_b}U); }}",
            f"const float *arara_fp32_fc2_w(void)   {{ return BLOB_PTR(float, {off_fp32_fc2_w}U); }}",
            f"const float *arara_fp32_fc2_b(void)   {{ return BLOB_PTR(float, {off_fp32_fc2_b}U); }}",
            "",
            f"const int8_t  *arara_int8_conv1_wq(void)    {{ return BLOB_PTR(int8_t,  {off_i8_l1_wq}U); }}",
            f"const int32_t *arara_int8_conv1_bfold(void) {{ return BLOB_PTR(int32_t, {off_i8_l1_bf}U); }}",
            f"const int32_t *arara_int8_conv1_mult(void)  {{ return BLOB_PTR(int32_t, {off_i8_l1_mu}U); }}",
            f"const uint8_t *arara_int8_conv1_shift(void) {{ return BLOB_PTR(uint8_t, {off_i8_l1_sh}U); }}",
            f"const float   *arara_int8_fc2_logit_scale(void) {{ return BLOB_PTR(float, {off_fc2_lscale}U); }}",
            "",
            f"const float   *arara_test_patch(int idx)    {{ return BLOB_PTR(float,   {off_test_patches}U) + ((uint32_t)idx * 96U * 64U); }}",
            f"const uint8_t *arara_test_labels(void)      {{ return BLOB_PTR(uint8_t, {off_test_labels}U); }}",
            f"const uint8_t *arara_fp32_golden_preds(void){{ return BLOB_PTR(uint8_t, {off_fp32_gold_pred}U); }}",
            f"const uint8_t *arara_int8_golden_preds(void){{ return BLOB_PTR(uint8_t, {off_int8_gold_pred}U); }}",
            "",
            f"const int16_t *arara_pcm_clip(int idx)      {{ return BLOB_PTR(int16_t, {off_pcm_win}U) + ((uint32_t)idx * 15600U); }}",
            f"const uint8_t *arara_pcm_labels(void)       {{ return BLOB_PTR(uint8_t, {off_pcm_lbl}U); }}",
            f"const float   *arara_pcm_ref_patch(int idx) {{ return BLOB_PTR(float,   {off_pcm_ref}U) + ((uint32_t)idx * 96U * 64U); }}",
            "",
            "const yamnet_fp32_sep_t g_yamnet_fp32_sep[ARARA_NUM_SEP_LAYERS] = {",
        ]
        for m in fp32_sep_meta:
            lines.append(
                f"    {{ {m['h_in']}, {m['w_in']}, {m['h_out']}, {m['w_out']}, "
                f"{m['cin']}, {m['cout']}, {m['stride']}, "
                f"{m['pt']}, {m['pb']}, {m['pl']}, {m['pr']}, "
                f"BLOB_PTR(float, {m['off_dw_w']}U), BLOB_PTR(float, {m['off_dw_b']}U), "
                f"BLOB_PTR(float, {m['off_pw_w']}U), BLOB_PTR(float, {m['off_pw_b']}U) }},"
            )
        lines += [
            "};",
            "",
            "const yamnet_int8_dw_t g_yamnet_int8_dw[ARARA_NUM_SEP_LAYERS] = {",
        ]
        for m in int8_dw_meta:
            lines.append(
                f"    {{ {m['h_in']}, {m['w_in']}, {m['h_out']}, {m['w_out']}, "
                f"{m['channels']}, {m['stride']}, "
                f"{m['pt']}, {m['pb']}, {m['pl']}, {m['pr']}, "
                f"{m['in_zp']}, {m['out_zp']}, "
                f"BLOB_PTR(int8_t, {m['off_wq']}U), BLOB_PTR(int32_t, {m['off_bf']}U), "
                f"BLOB_PTR(int32_t, {m['off_mu']}U), BLOB_PTR(uint8_t, {m['off_sh']}U) }},"
            )
        lines += [
            "};",
            "",
            "const yamnet_int8_dma_op_t g_yamnet_int8_pw[ARARA_NUM_SEP_LAYERS] = {",
        ]
        for m in int8_pw_meta:
            lines.append(
                f"    {{ {m['m']}, {m['k']}, {m['n']}, {m['in_zp']}, {m['out_zp']}, "
                f"{m['relu_en']}, {m['raw_i32_en']}, "
                f"BLOB_PTR(uint8_t, {m['off_dma']}U), {m['dma_bytes']}U }},"
            )
        lines += [
            "};",
            "",
            f"const yamnet_int8_dma_op_t g_arara_int8_fc1 = {{ 1, 1024, 512, {int(fc1['in_zp'])}, {int(fc1['out_zp'])}, 1, 0, BLOB_PTR(uint8_t, {off_fc1_dma}U), {len(fc1_stream)}U }};",
            f"const yamnet_int8_dma_op_t g_arara_int8_fc2 = {{ 1, 512, 8, {int(fc2['in_zp'])}, 0, 0, 1, BLOB_PTR(uint8_t, {off_fc2_dma}U), {len(fc2_stream)}U }};",
            "",
            "void model_weights_init(void) {",
            "    /* All tables are statically relocated at link time into .rodata */",
            "}",
            "",
        ]
        fh.write("\n".join(lines))

    print("[+] Model export complete!")


if __name__ == "__main__":
    main()
