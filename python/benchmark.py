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

os.environ["MPLCONFIGDIR"] = "/tmp/mpl_cache"

import matplotlib
if not os.environ.get("DISPLAY"):
    matplotlib.use("Agg")
import matplotlib.pyplot as plt

CLASS_NAMES = ["chainsaw", "engine", "hand_saw", "others"]
CLASS_LABELS = ["Chainsaw", "Engine", "Hand Saw", "Others"]
RPI3_BASELINE_MS = 1250.0


def setup_publication_style():
    """Configure matplotlib for publication-quality figures with LaTeX-like serif typography."""
    plt.rcParams.update({
        "font.family": "serif",
        "font.serif": ["DejaVu Serif", "Times New Roman", "Computer Modern Roman", "serif"],
        "mathtext.fontset": "cm",
        "font.size": 10.5,
        "axes.labelsize": 11,
        "axes.titlesize": 12,
        "xtick.labelsize": 10,
        "ytick.labelsize": 10,
        "legend.fontsize": 9.5,
        "figure.titlesize": 13,
        "axes.edgecolor": "#2d3748",
        "axes.linewidth": 0.9,
        "grid.color": "#cbd5e1",
        "grid.linestyle": ":",
        "grid.linewidth": 0.8,
    })


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


def _draw_cm(ax, cm: np.ndarray, title: str = None, add_colorbar: bool = True):
    """Draw a minimalist, publication-grade confusion matrix with LaTeX-like serif typography."""
    row_sums = np.maximum(cm.sum(axis=1, keepdims=True), 1)
    cm_norm = cm.astype(np.float64) / row_sums

    cmap = plt.cm.Blues
    im = ax.imshow(cm_norm, interpolation="nearest", cmap=cmap, vmin=0.0, vmax=1.0)

    if title:
        ax.set_title(title, fontsize=11, fontweight="bold", pad=8)

    ticks = np.arange(len(CLASS_LABELS))
    ax.set_xticks(ticks)
    ax.set_yticks(ticks)
    ax.set_xticklabels(CLASS_LABELS, rotation=20, ha="right", fontsize=9.5)
    ax.set_yticklabels(CLASS_LABELS, fontsize=9.5)
    ax.set_ylabel("True Class", fontsize=10)
    ax.set_xlabel("Predicted Class", fontsize=10)

    # Clean white grid lines separating matrix cells
    ax.set_xticks(np.arange(len(CLASS_LABELS) + 1) - 0.5, minor=True)
    ax.set_yticks(np.arange(len(CLASS_LABELS) + 1) - 0.5, minor=True)
    ax.grid(which="minor", color="white", linestyle="-", linewidth=1.5)
    ax.tick_params(which="minor", bottom=False, left=False)

    for i in range(len(CLASS_LABELS)):
        for j in range(len(CLASS_LABELS)):
            val = cm_norm[i, j]
            cnt = cm[i, j]
            txt_color = "white" if val > 0.52 else "#0f172a"
            txt = f"{val * 100.0:.1f}%\n" + r"$\mathrm{(" + f"{cnt}" + r")}$"
            ax.text(j, i, txt, ha="center", va="center", color=txt_color,
                    fontsize=8.5, fontweight="bold", linespacing=1.1)

    if add_colorbar:
        cbar = plt.colorbar(im, ax=ax, fraction=0.046, pad=0.03)
        cbar.ax.tick_params(labelsize=8)
        cbar.set_label("Normalized Recall", fontsize=8.5)
    return im


def plot_single_cm(cm: np.ndarray, title: str, output_path: str):
    """Save an individual standalone confusion matrix figure (minimalist paper style)."""
    setup_publication_style()
    fig, ax = plt.subplots(figsize=(4.8, 4.2), dpi=300)
    _draw_cm(ax, cm, title, add_colorbar=True)
    plt.tight_layout()
    plt.savefig(output_path, dpi=300, bbox_inches="tight")
    base, _ = os.path.splitext(output_path)
    plt.savefig(f"{base}.pdf", bbox_inches="tight")
    plt.close(fig)
    print(f"[+] Saved standalone confusion matrix -> {output_path} & {base}.pdf")


def plot_single_f1(ne_m: dict, i8_m: dict, output_path: str):
    """Save an individual standalone F1-score comparison bar chart (minimalist paper style)."""
    setup_publication_style()
    fig, ax = plt.subplots(figsize=(6.2, 3.8), dpi=300)

    labels = CLASS_LABELS + ["Macro Avg"]
    ne_f1 = [ne_m["metrics"][c]["f1"] for c in CLASS_NAMES] + [ne_m["summary"]["macro_f1"]]
    i8_f1 = [i8_m["metrics"][c]["f1"] for c in CLASS_NAMES] + [i8_m["summary"]["macro_f1"]]
    paper_f1 = [96.0, 96.0, 96.0, 93.0, 95.25]  # ARARA Paper baseline (RPi 3)

    x = np.arange(len(labels))
    w = 0.25

    b1 = ax.bar(x - w, paper_f1, w, label="Paper Baseline (RPi 3)",
                color="#64748b", edgecolor="#334155", linewidth=0.6, alpha=0.9)
    b2 = ax.bar(x, ne_f1, w, label="PS NEON (FP32)",
                color="#2563eb", edgecolor="#1d4ed8", linewidth=0.6)
    b3 = ax.bar(x + w, i8_f1, w, label="PL 64-MAC (INT8)",
                color="#16a34a", edgecolor="#15803d", linewidth=0.6)

    ax.set_ylim(80.0, 103.0)
    ax.set_ylabel(r"$F_1\text{-Score (\%)} $", fontsize=10.5)
    ax.set_title(r"$F_1\text{-Score Comparison}$", fontsize=11, fontweight="bold", pad=8)
    ax.set_xticks(x)
    ax.set_xticklabels(labels, fontsize=9.5)
    ax.grid(axis="y", linestyle=":", alpha=0.5)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.legend(loc="lower right", frameon=True, framealpha=0.9, edgecolor="#e2e8f0", fontsize=8.5)

    for bars in (b1, b2, b3):
        for bar in bars:
            h = bar.get_height()
            ax.text(bar.get_x() + bar.get_width() / 2.0, h + 0.4, f"{h:.1f}",
                    ha="center", va="bottom", fontsize=7.5, family="serif")

    plt.tight_layout()
    plt.savefig(output_path, dpi=300, bbox_inches="tight")
    base, _ = os.path.splitext(output_path)
    plt.savefig(f"{base}.pdf", bbox_inches="tight")
    plt.close(fig)
    print(f"[+] Saved standalone F1-score comparison -> {output_path} & {base}.pdf")


def plot_single_latency(ne_m: dict, i8_m: dict, output_path: str, hw_latency_override: dict = None):
    """Save an individual standalone latency & speedup comparison bar chart (minimalist paper style)."""
    setup_publication_style()
    fig, ax = plt.subplots(figsize=(5.4, 3.8), dpi=300)

    ne_e2e = ne_m["summary"]["e2e_ms"]
    i8_e2e = i8_m["summary"]["e2e_ms"]
    if hw_latency_override:
        ne_e2e = hw_latency_override["neon_e2e_ms"]
        i8_e2e = hw_latency_override["int8_e2e_ms"]

    platforms = [
        "RPi 3 Baseline",
        "PS NEON (FP32)",
        "PL 64-MAC (INT8)",
    ]
    latencies = [RPI3_BASELINE_MS, ne_e2e, i8_e2e]
    colors = ["#dc2626", "#2563eb", "#16a34a"]
    edgecolors = ["#991b1b", "#1d4ed8", "#15803d"]

    bars = ax.bar(platforms, latencies, color=colors, edgecolor=edgecolors, width=0.45, linewidth=0.7)
    ax.set_yscale("log")
    ax.set_ylim(1.0, 4000.0)
    ax.set_ylabel(r"Latency per Patch ($\mathrm{ms}$, log scale)", fontsize=10)
    ax.set_title("Inference Latency & Speedup", fontsize=11, fontweight="bold", pad=8)
    ax.grid(axis="y", which="both", linestyle=":", alpha=0.5)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)

    # 960 ms audio window budget guideline
    ax.axhline(960.0, color="#d97706", linestyle="--", linewidth=1.0, alpha=0.8)
    ax.text(0.45, 1050.0, r"$\mathrm{Real\text{-}Time\ Budget\ (960\,ms)}$",
            color="#b45309", fontsize=8.0, ha="left", va="bottom", fontstyle="italic")

    for bar, val in zip(bars, latencies):
        sp_rpi = RPI3_BASELINE_MS / max(val, 1e-6)
        if val >= RPI3_BASELINE_MS:
            txt = f"{val:.0f} ms"
        else:
            txt = f"{val:.2f} ms\n({sp_rpi:.1f}" + r"$\times$)"
        ax.text(bar.get_x() + bar.get_width() / 2.0, val * 1.25, txt,
                ha="center", va="bottom", fontsize=8.0, fontweight="bold", linespacing=1.1)

    plt.tight_layout()
    plt.savefig(output_path, dpi=300, bbox_inches="tight")
    base, _ = os.path.splitext(output_path)
    plt.savefig(f"{base}.pdf", bbox_inches="tight")
    plt.close(fig)
    print(f"[+] Saved standalone latency comparison -> {output_path} & {base}.pdf")


def plot_comparison(parsed: dict, output_fig_path: str = "comparison_results.png",
                    hw_latency_override: dict = None):
    """Generate both the 4 split individual plots and the combined 4-panel overview with minimalist paper style."""
    modes = parsed.get("modes", {})
    if "NEON_FP32" not in modes or "PL_INT8" not in modes:
        print("[!] Missing NEON_FP32 or PL_INT8 data; skipping plot.")
        return

    ne_m = modes["NEON_FP32"]
    i8_m = modes["PL_INT8"]

    out_dir = os.path.dirname(os.path.abspath(output_fig_path)) or "."
    os.makedirs(out_dir, exist_ok=True)

    # Define paths for the 4 split individual plots
    cm_neon_path = os.path.join(out_dir, "cm_neon_fp32.png")
    cm_int8_path = os.path.join(out_dir, "cm_pl_int8.png")
    f1_path = os.path.join(out_dir, "f1_score_comparison.png")
    lat_path = os.path.join(out_dir, "latency_speedup_comparison.png")

    # 1. Standalone Plot 1: PS ARM NEON (FP32) Confusion Matrix (clean, no subtitle)
    plot_single_cm(ne_m["cm"], "PS ARM NEON (FP32)", cm_neon_path)

    # 2. Standalone Plot 2: Zynq PL 64-MAC (INT8) Confusion Matrix (clean, no subtitle)
    plot_single_cm(i8_m["cm"], "PL 64-MAC (INT8)", cm_int8_path)

    # 3. Standalone Plot 3: F1-Score Comparison
    plot_single_f1(ne_m, i8_m, f1_path)

    # 4. Standalone Plot 4: Latency & Speedup Comparison
    plot_single_latency(ne_m, i8_m, lat_path, hw_latency_override)

    # 5. Combined 4-Panel Overview (Minimalist Paper Styling)
    setup_publication_style()
    fig, axes = plt.subplots(2, 2, figsize=(10.5, 8.5), dpi=300)

    # Panels 1 & 2: Confusion Matrices (no subtitles)
    _draw_cm(axes[0, 0], ne_m["cm"], "PS ARM NEON (FP32)", add_colorbar=True)
    _draw_cm(axes[0, 1], i8_m["cm"], "PL 64-MAC (INT8)", add_colorbar=True)

    # Panel 3: F1-Scores
    ax_f1 = axes[1, 0]
    labels_f1 = CLASS_LABELS + ["Macro"]
    ne_f1 = [ne_m["metrics"][c]["f1"] for c in CLASS_NAMES] + [ne_m["summary"]["macro_f1"]]
    i8_f1 = [i8_m["metrics"][c]["f1"] for c in CLASS_NAMES] + [i8_m["summary"]["macro_f1"]]
    paper_f1 = [96.0, 96.0, 96.0, 93.0, 95.25]

    x = np.arange(len(labels_f1))
    w = 0.25
    b1 = ax_f1.bar(x - w, paper_f1, w, label=r"Paper Baseline",
                   color="#64748b", edgecolor="#334155", linewidth=0.6, alpha=0.9)
    b2 = ax_f1.bar(x, ne_f1, w, label=r"PS NEON (FP32)",
                   color="#2563eb", edgecolor="#1d4ed8", linewidth=0.6)
    b3 = ax_f1.bar(x + w, i8_f1, w, label=r"PL 64-MAC (INT8)",
                   color="#16a34a", edgecolor="#15803d", linewidth=0.6)

    ax_f1.set_ylim(80.0, 103.0)
    ax_f1.set_ylabel(r"$F_1\text{-Score (\%)} $", fontsize=10)
    ax_f1.set_title(r"$F_1\text{-Score Comparison}$", fontsize=11, fontweight="bold", pad=8)
    ax_f1.set_xticks(x)
    ax_f1.set_xticklabels(labels_f1, fontsize=9.0)
    ax_f1.grid(axis="y", linestyle=":", alpha=0.5)
    ax_f1.spines["top"].set_visible(False)
    ax_f1.spines["right"].set_visible(False)
    ax_f1.legend(loc="lower right", fontsize=8.0, frameon=True, framealpha=0.9, edgecolor="#e2e8f0")

    for bars in (b2, b3):
        for bar in bars:
            h = bar.get_height()
            ax_f1.text(bar.get_x() + bar.get_width() / 2.0, h + 0.35, f"{h:.1f}",
                       ha="center", va="bottom", fontsize=7.0, family="serif")

    # Panel 4: Latencies
    ax_lat = axes[1, 1]
    ne_e2e = ne_m["summary"]["e2e_ms"]
    i8_e2e = i8_m["summary"]["e2e_ms"]
    if hw_latency_override:
        ne_e2e = hw_latency_override["neon_e2e_ms"]
        i8_e2e = hw_latency_override["int8_e2e_ms"]

    platforms = [
        "RPi 3 Baseline",
        "PS NEON",
        "PL 64-MAC",
    ]
    latencies = [RPI3_BASELINE_MS, ne_e2e, i8_e2e]
    colors = ["#dc2626", "#2563eb", "#16a34a"]
    edgecolors = ["#991b1b", "#1d4ed8", "#15803d"]

    bars = ax_lat.bar(platforms, latencies, color=colors, edgecolor=edgecolors, width=0.45, linewidth=0.7)
    ax_lat.set_yscale("log")
    ax_lat.set_ylim(1.0, 4000.0)
    ax_lat.set_ylabel(r"Latency per Patch ($\mathrm{ms}$, log scale)", fontsize=9.5)
    ax_lat.set_title("Inference Latency & Speedup", fontsize=11, fontweight="bold", pad=8)
    ax_lat.grid(axis="y", which="both", linestyle=":", alpha=0.5)
    ax_lat.spines["top"].set_visible(False)
    ax_lat.spines["right"].set_visible(False)

    for bar, val in zip(bars, latencies):
        sp_rpi = RPI3_BASELINE_MS / max(val, 1e-6)
        if val >= RPI3_BASELINE_MS:
            txt = f"{val:.0f} ms"
        else:
            txt = f"{val:.2f} ms\n({sp_rpi:.1f}" + r"$\times$)"
        ax_lat.text(bar.get_x() + bar.get_width() / 2.0, val * 1.25, txt,
                    ha="center", va="bottom", fontsize=7.5, fontweight="bold", linespacing=1.1)

    plt.tight_layout()
    plt.savefig(output_fig_path, dpi=300, bbox_inches="tight")
    base, _ = os.path.splitext(output_fig_path)
    plt.savefig(f"{base}.pdf", bbox_inches="tight")
    plt.close(fig)
    print(f"[+] Saved 4-panel combined overview figure -> {output_fig_path} & {base}.pdf")
