#!/usr/bin/env python3
"""ARARA Zynq-7000 Console Capture, Log Parser & Publication Plotter.

Captures or loads the structured benchmark output emitted by `software/main.c`
on Digilent Zybo Z7-10 (`PS UART1`, 115200 bps) and generates:
  * Detailed side-by-side tabular summary (Accuracy, Confusion Matrix, Precision/Recall/F1,
    Latency, Throughput, PL DMA/Compute cycles, and Speedup vs NEON & Raspberry Pi 3).
  * 4-panel figure (`comparison_results.png`):
      1. PS ARM NEON (FP32) Normalized 4x4 Confusion Matrix
      2. Zynq PL 64-MAC Tensor Accelerator (INT8) Normalized 4x4 Confusion Matrix
      3. Per-Class F1-Score Comparison (`chainsaw`, `engine`, `hand_saw`, `others`, Macro Avg)
      4. End-to-End Inference Latency & Speedup Comparison (RPi 3 vs Zynq NEON vs Zynq PL INT8)
"""

import os
import re
import time
import numpy as np

import matplotlib
if not os.environ.get("DISPLAY"):
    matplotlib.use("Agg")
import matplotlib.pyplot as plt

CLASS_NAMES = ["chainsaw", "engine", "hand_saw", "others"]
RPI3_BASELINE_MS = 1250.0


def capture_uart_benchmark(port="/dev/ttyUSB1", baudrate=115200, timeout=180.0):
    """Listen on Zybo Z7-10 USB-UART console until `[BENCHMARK_COMPLETE]` arrives."""
    import serial

    print(f"[*] Listening on Zybo Z7-10 console {port} @ {baudrate} bps (reset/program board if needed)...")
    lines = []
    start_t = time.time()
    with serial.Serial(port, baudrate, timeout=2.0) as ser:
        while time.time() - start_t < timeout:
            raw = ser.readline()
            if not raw:
                continue
            line = raw.decode("utf-8", errors="replace")
            print(line, end="")
            lines.append(line)
            if "[BENCHMARK_COMPLETE]" in line:
                break
    return "".join(lines)


def _parse_kv_tokens(rest: str) -> dict:
    out = {}
    for tok in rest.strip().split():
        if "=" in tok:
            k, v = tok.split("=", 1)
            out[k] = v
    return out


def parse_benchmark_output(text: str) -> dict:
    """Parse `[HW_ID]`, `[CM]`, `[CLASS_METRIC]`, `[SUMMARY]`, and `[COMPARISON]` tags."""
    parsed = {
        "hw_id": {},
        "modes": {},
        "comparison": {},
    }

    def ensure_mode(m: str):
        if m not in parsed["modes"]:
            parsed["modes"][m] = {
                "cm": np.zeros((4, 4), dtype=np.int32),
                "metrics": {},
                "summary": {},
            }
        return parsed["modes"][m]

    for raw_line in text.splitlines():
        line = raw_line.strip()
        if line.startswith("[HW_ID]"):
            parsed["hw_id"] = _parse_kv_tokens(line[len("[HW_ID]"):])
        elif line.startswith("[CM]"):
            kv = _parse_kv_tokens(line[len("[CM]"):])
            m = ensure_mode(kv["mode"])
            r = int(kv["row"])
            for c in range(4):
                m["cm"][r, c] = int(kv[f"c{c}"])
        elif line.startswith("[CLASS_METRIC]"):
            kv = _parse_kv_tokens(line[len("[CLASS_METRIC]"):])
            m = ensure_mode(kv["mode"])
            m["metrics"][kv["class"]] = {
                "precision": float(kv["precision"]),
                "recall": float(kv["recall"]),
                "f1": float(kv["f1"]),
                "support": int(kv["support"]),
            }
        elif line.startswith("[SUMMARY]"):
            kv = _parse_kv_tokens(line[len("[SUMMARY]"):])
            m = ensure_mode(kv["mode"])
            m["summary"] = {
                "acc": float(kv["acc"]),
                "correct": int(kv["correct"]),
                "total": int(kv["total"]),
                "macro_p": float(kv["macro_p"]),
                "macro_r": float(kv["macro_r"]),
                "macro_f1": float(kv["macro_f1"]),
                "infer_ms": float(kv["infer_ms"]),
                "frontend_ms": float(kv["frontend_ms"]),
                "e2e_ms": float(kv["e2e_ms"]),
                "mops": float(kv["mops"]),
                "pl_cyc": int(kv.get("pl_cyc", 0)),
                "pl_comp_cyc": int(kv.get("pl_comp_cyc", 0)),
                "pl_dma_cyc": int(kv.get("pl_dma_cyc", 0)),
            }
        elif line.startswith("[COMPARISON]"):
            kv = _parse_kv_tokens(line[len("[COMPARISON]"):])
            parsed["comparison"] = {k: float(v) for k, v in kv.items()}

    return parsed


def print_comparison_table(parsed: dict):
    modes = parsed.get("modes", {})
    ne = modes.get("NEON_FP32", {}).get("summary", {})
    i8 = modes.get("PL_INT8", {}).get("summary", {})
    cmp_d = parsed.get("comparison", {})

    print("\n" + "=" * 86)
    print(f"{'ARARA ZYNQ-7000 BENCHMARK SUMMARY (ESC-50 FOLD-5, N=640)':^86}")
    print("=" * 86)
    print(f"{'Metric':<34} | {'PS ARM NEON (FP32)':>21} | {'PL 64-MAC (INT8)':>21}")
    print("-" * 86)
    if ne and i8:
        print(f"{'Global Accuracy':<34} | {ne['acc']:>13.2f}% ({ne['correct']}/{ne['total']}) | {i8['acc']:>13.2f}% ({i8['correct']}/{i8['total']})")
        print(f"{'Macro Precision':<34} | {ne['macro_p']:>20.2f}% | {i8['macro_p']:>20.2f}%")
        print(f"{'Macro Recall':<34} | {ne['macro_r']:>20.2f}% | {i8['macro_r']:>20.2f}%")
        print(f"{'Macro F1-Score':<34} | {ne['macro_f1']:>20.2f}% | {i8['macro_f1']:>20.2f}%")
        print(f"{'Audio Frontend Latency (STFT/Mel)':<34} | {ne['frontend_ms']:>18.3f} ms | {i8['frontend_ms']:>18.3f} ms")
        print(f"{'Network Inference Latency':<34} | {ne['infer_ms']:>18.3f} ms | {i8['infer_ms']:>18.3f} ms")
        print(f"{'End-to-End Patch Latency':<34} | {ne['e2e_ms']:>18.3f} ms | {i8['e2e_ms']:>18.3f} ms")
        print(f"{'Effective Compute Throughput':<34} | {ne['mops']:>14.2f} MFLOPS | {i8['mops']:>16.2f} MOPS")
        if i8.get("pl_cyc", 0) > 0:
            pl_ms = i8["pl_cyc"] / 100000.0
            print(f"{'PL 64-MAC Engine Time (@100 MHz)':<34} | {'N/A':>21} | {pl_ms:>18.3f} ms")
    print("-" * 86)
    if cmp_d:
        print(f"  * Network Speedup (PL INT8 vs PS NEON FP32)    : {cmp_d.get('speedup_net', 0.0):.2f}x")
        print(f"  * End-to-End Speedup (PL INT8 vs PS NEON FP32) : {cmp_d.get('speedup_e2e', 0.0):.2f}x")
        print(f"  * Speedup vs Raspberry Pi 3 (1250 ms baseline) : {cmp_d.get('rpi3_speedup', 0.0):.2f}x")
        print(f"  * FP32 <-> INT8 Prediction Agreement           : {cmp_d.get('agreement', 0.0):.2f}%")
    print("=" * 86)


def _draw_cm(ax, cm: np.ndarray, title: str):
    row_sums = np.maximum(cm.sum(axis=1, keepdims=True), 1)
    cm_norm = cm.astype(np.float64) / row_sums

    im = ax.imshow(cm_norm, interpolation="nearest", cmap="Blues", vmin=0.0, vmax=1.0)
    ax.set_title(title, fontsize=11, fontweight="bold", pad=10)
    ticks = np.arange(len(CLASS_NAMES))
    ax.set_xticks(ticks)
    ax.set_yticks(ticks)
    ax.set_xticklabels(CLASS_NAMES, rotation=25, ha="right", fontsize=9)
    ax.set_yticklabels(CLASS_NAMES, fontsize=9)
    ax.set_ylabel("True Class", fontsize=10)
    ax.set_xlabel("Predicted Class", fontsize=10)

    for i in range(4):
        for j in range(4):
            val = cm_norm[i, j]
            cnt = cm[i, j]
            txt_color = "white" if val > 0.52 else "#1a1a1a"
            ax.text(j, i, f"{val:.2f}\n({cnt})",
                    ha="center", va="center", color=txt_color, fontsize=8.5, fontweight="bold")
    return im


def plot_comparison(parsed: dict, output_fig_path: str = "comparison_results.png",
                    hw_latency_override: dict = None):
    modes = parsed.get("modes", {})
    if "NEON_FP32" not in modes or "PL_INT8" not in modes:
        print("[!] Missing NEON_FP32 or PL_INT8 data; skipping plot.")
        return

    ne_m = modes["NEON_FP32"]
    i8_m = modes["PL_INT8"]

    fig, axes = plt.subplots(2, 2, figsize=(13.5, 10.5))
    fig.suptitle(
        "ARARA Acoustic Deforestation Detection on Zynq-7000 (Zybo Z7-10)\n"
        "YAMNet + Refined Head: PS ARM NEON (FP32) vs. PL 64-MAC Tensor Accelerator (INT8)",
        fontsize=13, fontweight="bold", y=0.98
    )

    # Panel 1 & 2: Normalized Confusion Matrices
    _draw_cm(axes[0, 0], ne_m["cm"],
             f"PS ARM NEON FP32 (Acc: {ne_m['summary']['acc']:.2f}%)")
    _draw_cm(axes[0, 1], i8_m["cm"],
             f"Zynq PL 64-MAC INT8 (Acc: {i8_m['summary']['acc']:.2f}%)")

    # Panel 3: Per-Class & Macro F1-Score Comparison
    ax_f1 = axes[1, 0]
    labels_f1 = CLASS_NAMES + ["Macro Avg"]
    ne_f1 = [ne_m["metrics"][c]["f1"] for c in CLASS_NAMES] + [ne_m["summary"]["macro_f1"]]
    i8_f1 = [i8_m["metrics"][c]["f1"] for c in CLASS_NAMES] + [i8_m["summary"]["macro_f1"]]
    paper_f1 = [96.0, 96.0, 96.0, 93.0, 95.25]  # ARARA SBrT Table I reference

    x = np.arange(len(labels_f1))
    w = 0.26
    b1 = ax_f1.bar(x - w, paper_f1, w, label="ARARA Paper (RPi3 FP32)", color="#7f8c8d", alpha=0.85)
    b2 = ax_f1.bar(x,     ne_f1,    w, label="Zybo Z7-10 PS NEON (FP32)", color="#1f77b4")
    b3 = ax_f1.bar(x + w, i8_f1,    w, label="Zybo Z7-10 PL 64-MAC (INT8)", color="#2ca02c")

    ax_f1.set_ylim(80.0, 103.0)
    ax_f1.set_ylabel("F1-Score (%)", fontsize=10)
    ax_f1.set_title("Per-Class & Macro F1-Score (ESC-50 Fold 5)", fontsize=11, fontweight="bold")
    ax_f1.set_xticks(x)
    ax_f1.set_xticklabels(labels_f1, fontsize=9.5)
    ax_f1.grid(axis="y", linestyle="--", alpha=0.5)
    ax_f1.legend(loc="lower right", fontsize=8.5)
    for bars in (b2, b3):
        for bar in bars:
            h = bar.get_height()
            ax_f1.text(bar.get_x() + bar.get_width() / 2.0, h + 0.35, f"{h:.1f}",
                       ha="center", va="bottom", fontsize=7.5)

    # Panel 4: End-to-End Inference Latency Comparison (ms, log scale)
    ax_lat = axes[1, 1]
    ne_e2e = ne_m["summary"]["e2e_ms"]
    i8_e2e = i8_m["summary"]["e2e_ms"]
    note_suffix = ""
    if hw_latency_override:
        ne_e2e = hw_latency_override["neon_e2e_ms"]
        i8_e2e = hw_latency_override["int8_e2e_ms"]
        note_suffix = " (Zynq Cycle-Accurate)"

    platforms = [
        "Raspberry Pi 3\n(Paper Baseline)",
        "Zybo Z7-10\nPS NEON (FP32)",
        "Zybo Z7-10\nPL 64-MAC (INT8)",
    ]
    latencies = [RPI3_BASELINE_MS, ne_e2e, i8_e2e]
    colors = ["#d62728", "#1f77b4", "#2ca02c"]

    bars = ax_lat.bar(platforms, latencies, color=colors, width=0.52)
    ax_lat.set_yscale("log")
    ax_lat.set_ylim(1.0, 3000.0)
    ax_lat.set_ylabel("End-to-End Latency per 0.96s Patch (ms, log scale)", fontsize=9.5)
    ax_lat.set_title(f"Edge Latency & Hardware Speedup{note_suffix}", fontsize=11, fontweight="bold")
    ax_lat.grid(axis="y", which="both", linestyle="--", alpha=0.5)

    for bar, val in zip(bars, latencies):
        sp_rpi = RPI3_BASELINE_MS / max(val, 1e-6)
        lbl = f"{val:.2f} ms\n({sp_rpi:.1f}x vs RPi3)" if val < RPI3_BASELINE_MS else f"{val:.0f} ms\n(1.0x)"
        ax_lat.text(bar.get_x() + bar.get_width() / 2.0, val * 1.18, lbl,
                    ha="center", va="bottom", fontsize=8.5, fontweight="bold")

    plt.tight_layout(rect=[0, 0, 1, 0.94])
    plt.savefig(output_fig_path, dpi=300)
    plt.close(fig)
    print(f"[+] Saved 4-panel benchmark report figure -> {output_fig_path}")
