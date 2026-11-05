#!/usr/bin/env python3
"""ARARA Zynq-7000 Acoustic Deforestation Classifier -- Benchmark Orchestrator & Analyzer.

Usage:
  # 1. Program Zybo Z7-10 via JTAG + capture live UART benchmark + generate plot:
  .venv/bin/python3 analyze.py --program --port /dev/ttyUSB1 --baud 115200

  # 2. Capture live autonomous benchmark from already-programmed Zybo Z7-10:
  .venv/bin/python3 analyze.py --port /dev/ttyUSB1 --baud 115200

  # 3. Parse a saved UART log file and generate comparison_results.png:
  .venv/bin/python3 analyze.py --log-file build/golden_benchmark.log --skip-build

  # 4. Run bit-exact C firmware verification natively on host and plot results:
  .venv/bin/python3 analyze.py --host-sim
"""

import argparse
import os
import shutil
import subprocess
import sys
import time

REPO_DIR = os.path.abspath(os.path.dirname(__file__))
sys.path.insert(0, os.path.join(REPO_DIR, "python"))

from benchmark import (  # noqa: E402
    capture_uart_benchmark,
    parse_benchmark_output,
    print_comparison_table,
    plot_comparison,
)


def _find_xsdb(explicit_xsdb: str = None) -> str:
    if explicit_xsdb:
        return explicit_xsdb
    for cand in (
        "/home/nectx/Xilinx/2026.1/Vitis/bin/xsdb",
        "/home/nectx/Xilinx/2026.1/Vivado/bin/xsdb",
        shutil.which("xsdb"),
    ):
        if cand and os.path.isfile(cand) and os.access(cand, os.X_OK):
            return cand
    return "xsdb"


def _program_and_capture(port: str, baud: int, xsdb_bin: str, save_log: str, monitor_after: bool) -> str:
    import serial

    tcl_script = os.path.join(REPO_DIR, "scripts", "program_board.tcl")
    print(f"[*] Opening {port} @ {baud} bps BEFORE JTAG boot so no UART output is missed...")
    lines = []
    with serial.Serial(port, baud, timeout=1.0) as ser:
        ser.reset_input_buffer()
        print(f"[*] Programming Zybo Z7-10 via {xsdb_bin} {tcl_script} ...")
        subprocess.run([xsdb_bin, tcl_script], cwd=REPO_DIR, check=True)

        print(f"[*] Streaming autonomous benchmark from Zybo Z7-10 ({port} @ {baud})...")
        deadline = time.time() + 240.0
        while time.time() < deadline:
            raw = ser.readline()
            if not raw:
                continue
            line = raw.decode("utf-8", errors="replace")
            print(line, end="", flush=True)
            lines.append(line)
            if "[BENCHMARK_COMPLETE]" in line:
                break

        raw_text = "".join(lines)
        if save_log:
            os.makedirs(os.path.dirname(os.path.abspath(save_log)), exist_ok=True)
            with open(save_log, "w", encoding="utf-8") as fh:
                fh.write(raw_text)
            print(f"[+] Saved captured hardware UART log -> {save_log}")

        if monitor_after:
            print("\n[*] Continuing into Phase 3 Live Acoustic Monitor (Press Ctrl+C to exit)...")
            try:
                while True:
                    raw = ser.readline()
                    if raw:
                        print(raw.decode("utf-8", errors="replace"), end="", flush=True)
            except KeyboardInterrupt:
                print("\n[*] Exited live monitor.")

    return raw_text


def _monitor_serial(port: str, baud: int):
    import serial

    print(f"[*] Attached to Zybo Z7-10 console {port} @ {baud} bps (Press Ctrl+C to exit)...")
    print("    Tip: Toggle SW0 on the board to switch live between PL_INT8 (SW0=0) and NEON_FP32 (SW0=1).")
    with serial.Serial(port, baud, timeout=1.0) as ser:
        try:
            while True:
                raw = ser.readline()
                if raw:
                    print(raw.decode("utf-8", errors="replace"), end="", flush=True)
        except KeyboardInterrupt:
            print("\n[*] Disconnected.")


def parse_args():
    p = argparse.ArgumentParser(description="ARARA Zynq-7000 YAMNet NEON vs PL INT8 Analyzer")
    p.add_argument("--port", default="/dev/ttyUSB1", help="Zybo Z7-10 USB-UART device (default: /dev/ttyUSB1)")
    p.add_argument("--baud", type=int, default=115200, help="Console baud rate (default: 115200)")
    p.add_argument("--program", action="store_true",
                   help="Auto-program bitstream + ps7_init + app.elf onto Zybo Z7-10 via XSDB before capturing")
    p.add_argument("--xsdb", default=None, help="Path to AMD xsdb binary")
    p.add_argument("--monitor", action="store_true",
                   help="Stream live Phase-3 INMP441 + LoRaWAN monitoring output from serial port")
    p.add_argument("--log-file", help="Parse an existing captured benchmark log file")
    p.add_argument("--save-log", default=os.path.join(REPO_DIR, "build", "hw_benchmark.log"),
                   help="Where to save captured UART benchmark output")
    p.add_argument("--host-sim", action="store_true",
                   help="Compile & run the exact C firmware in host golden simulation mode")
    p.add_argument("--skip-build", action="store_true",
                   help="Skip rebuilding model blob / bare-metal ELF before analyzing")
    p.add_argument("--output", default=os.path.join(REPO_DIR, "comparison_results.png"),
                   help="Output path for the 4-panel benchmark plot")
    return p.parse_args()


def main():
    args = parse_args()

    if args.monitor and not args.program and not args.host_sim and not args.log_file:
        _monitor_serial(args.port, args.baud)
        return

    if not args.skip_build and not args.log_file:
        if not os.path.exists(os.path.join(REPO_DIR, "build", "model_blob.bin")):
            subprocess.run([sys.executable, os.path.join(REPO_DIR, "python", "generate_model.py")],
                           cwd=REPO_DIR, check=True)
        if not args.host_sim:
            subprocess.run(["make", "app"], cwd=REPO_DIR, check=True)

    if args.host_sim:
        subprocess.run(["make", "host-verify"], cwd=REPO_DIR, check=True)
        log_path = os.path.join(REPO_DIR, "build", "golden_benchmark.log")
        with open(log_path, "r", encoding="utf-8") as fh:
            raw_text = fh.read()
    elif args.log_file:
        with open(args.log_file, "r", encoding="utf-8") as fh:
            raw_text = fh.read()
    elif args.program:
        xsdb_bin = _find_xsdb(args.xsdb)
        raw_text = _program_and_capture(args.port, args.baud, xsdb_bin, args.save_log, args.monitor)
    else:
        raw_text = capture_uart_benchmark(port=args.port, baudrate=args.baud)
        if args.save_log and raw_text:
            os.makedirs(os.path.dirname(os.path.abspath(args.save_log)), exist_ok=True)
            with open(args.save_log, "w", encoding="utf-8") as fh:
                fh.write(raw_text)

    parsed = parse_benchmark_output(raw_text)
    if not parsed.get("modes"):
        print("[!] Could not find structured [SUMMARY]/[CM] records in benchmark output.")
        sys.exit(1)

    print_comparison_table(parsed)
    plot_comparison(parsed, output_fig_path=args.output)


if __name__ == "__main__":
    main()
