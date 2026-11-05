#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SIM_DIR="${REPO_DIR}/build/xsim"
rm -rf "${SIM_DIR}"
mkdir -p "${SIM_DIR}"
cd "${SIM_DIR}"

export LIBRARY_PATH="/usr/lib/x86_64-linux-gnu:${LIBRARY_PATH:-}"
XVHDL="/home/nectx/Xilinx/2026.1/Vivado/bin/xvhdl"
XELAB="/home/nectx/Xilinx/2026.1/Vivado/bin/xelab"
XSIM="/home/nectx/Xilinx/2026.1/Vivado/bin/xsim"

echo "[1/4] Compiling VHDL RTL & Testbenches..."
"${XVHDL}" \
    "${REPO_DIR}/logic/pw_sdp_ram.vhd" \
    "${REPO_DIR}/logic/axi_cnn_accelerator.vhd" \
    "${REPO_DIR}/logic/axi_i2s_rx.vhd" \
    "${REPO_DIR}/logic/uart_tx.vhd" \
    "${REPO_DIR}/logic/uart_rx.vhd" \
    "${REPO_DIR}/logic/axi_uart.vhd" \
    "${REPO_DIR}/logic/tb_cnn_accelerator.vhd" \
    "${REPO_DIR}/logic/tb_axi_i2s_rx.vhd" \
    "${REPO_DIR}/logic/tb_axi_uart.vhd"

echo "[2/4] Simulating 64-MAC INT8 DMA Tensor Accelerator (tb_cnn_accelerator)..."
"${XELAB}" -debug off tb_cnn_accelerator -s snap_cnn
"${XSIM}" snap_cnn -runall | tee sim_cnn.log
grep -q "TB PASS" sim_cnn.log

echo "[3/4] Simulating INMP441 I2S Master Receiver + FIFO (tb_axi_i2s_rx)..."
"${XELAB}" -debug off tb_axi_i2s_rx -s snap_i2s
"${XSIM}" snap_i2s -runall | tee sim_i2s.log
grep -q "TB PASS" sim_i2s.log

echo "[4/4] Simulating B-L072Z-LRWAN1 AXI UART Transceiver (tb_axi_uart)..."
"${XELAB}" -debug off tb_axi_uart -s snap_uart
printf "run 10 us\nquit\n" > run_uart.tcl
"${XSIM}" snap_uart -tclbatch run_uart.tcl | tee sim_uart.log
grep -q "SUCCESS: Loopback test verified successfully!" sim_uart.log

echo "=== ALL RTL SIMULATIONS PASSED ==="
