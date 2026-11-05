# ARARA on Zynq-7000: Acoustic Illegal-Deforestation Detection SoC

Complete bare-metal System-on-Chip (SoC) port and hardware acceleration of the **ARARA** acoustic deforestation monitoring system (*"ARARA: Monitoramento Acústico de Desmatamento Ilegal via Computação na Borda"*, SBrT 2026) from Raspberry Pi 3 Model B to the **Digilent Zybo Z7-10 (`xc7z010clg400-1`)**.

The platform implements **end-to-end 16 kHz audio frontend processing (STFT + 64-band HTK Log-Mel)**, the **14-layer YAMNet (MobileNetV1) acoustic backbone**, and the **ARARA refined Dense classifier head** (`chainsaw`, `engine`, `hand_saw`, `others`) with a head-to-head bare-metal comparison between:
1. **PS ARM Cortex-A9 NEON SIMD (`FP32`)** running at `666.67 MHz`.
2. **PL 64-MAC DMA Tensor Accelerator (`INT8`)** running at `100 MHz` over 64-bit `S_AXI_HP0` Burst DMA (`800 MB/s` peak) paired with vectorized NEON INT8 depthwise convolutions and Cross-Layer Activation Equalization.

External sensors/radios connect **directly to Zybo Z7-10 Programmable Logic (PL) Pmod ports** (power management and analog MAX4466 wake-up hardware are omitted):
- **`INMP441` Digital MEMS I2S Microphone** $\rightarrow$ **Pmod JC** (`axi_i2s_rx` @ `0x43C20000`, 16 kHz master clock generator + 16,384-sample BRAM circular FIFO).
- **`ST B-L072Z-LRWAN1` LoRaWAN Module** $\rightarrow$ **Pmod JD** (`axi_uart` @ `0x43C00000` + hardware wake trigger pulse, transmitting a compact 1-byte alert payload only on critical classes `0x00..0x02`).

---

## 1. SoC Architecture (`xc7z010clg400-1`)

```
 +-----------------------------------------------------------------------------------+
 |                        Digilent Zybo Z7-10 (xc7z010clg400-1)                      |
 |                                                                                   |
 |  +----------------------------------+     +------------------------------------+  |
 |  |   Processing System (PS @ 667M)  |     |    Programmable Logic (PL @ 100M)  |  |
 |  |                                  |     |                                    |  |
 |  |  ARM Cortex-A9 Core 0            |     |  axi_cnn_accelerator (0x43C10000)  |  |
 |  |  - L1 I/D Cache + MMU + BPred    |     |  - 8x8 = 64 INT8 DSP48E1 MACs/cyc  |  |
 |  |  - 16 kHz STFT/RFFT/Mel Frontend |<===>|  - 64 KiB Act BRAM + 8 KiB Wgt BRAM|  |
 |  |  - NEON FP32 Baseline Engine     | GP0 |  - 5-Stage 64-bit TFLite Requant   |  |
 |  |  - NEON INT8 Conv1/DW3x3/GAP     |     |  - Cycle Counters (Total/Comp/DMA) |  |
 |  |  - 64-bit Global Timer (333 MHz) |     +-----------------+------------------+  |
 |  |                                  |                       | 64-bit AXI4 Burst   |
 |  |  1 GB DDR3 Memory Controller  <==========================+ (S_AXI_HP0, 800MB/s)|
 |  |  - Pre-tiled INT8 DMA Streams    |                                             |
 |  |  - Embedded ESC-50 Fold-5 Set    |     +------------------------------------+  |
 |  |  - Non-Cacheable .dma_buf        |     |  axi_i2s_rx (0x43C20000)           |  |
 |  |                                  |<===>|  - 1.024 MHz BCLK / 16 kHz WS      |====> Pmod JC: INMP441 Mic
 |  |  PS UART1 (0xE0001000, MIO48/49) | GP0 |  - 16K x 16-bit BRAM Audio FIFO    |====> LD3..LD0 & SW1..SW0
 |  +----------------+-----------------+     +------------------------------------+  |
 |                   |                       |  axi_uart (0x43C00000)             |  |
 |                   |                       |  - 115200 8N1 1-Byte Alert TX/RX   |====> Pmod JD: B-L072Z-LRWAN1
 +-------------------|-----------------------+------------------------------------+--+
                     v
        USB-UART Console (115200 bps)
        Autonomous Benchmark Report & Live Monitor Log
```

---

## 2. Zybo Z7-10 Pinout & Peripheral Mapping

Defined in [`constraints/zybo_z7_10.xdc`](constraints/zybo_z7_10.xdc) (`LVCMOS33` 3.3 V):

| Peripheral | Signal | Direction | Zybo Z7-10 Header / Component | FPGA Pin | Description |
| :--- | :--- | :---: | :--- | :---: | :--- |
| **INMP441 I2S Mic** | `i2s_sck` | Out | **Pmod JC** Pin 1 (`JC1_P`) | `V15` | `1.024026 MHz` I2S Bit Clock (`BCLK`) |
| **INMP441 I2S Mic** | `i2s_ws` | Out | **Pmod JC** Pin 2 (`JC1_N`) | `W15` | `16.0004 kHz` Word Select (`LRCLK`) |
| **INMP441 I2S Mic** | `i2s_sd` | In | **Pmod JC** Pin 3 (`JC2_P`) | `T11` | 24-bit Two's-Complement Serial Audio (`SD`) |
| **INMP441 I2S Mic** | `i2s_lr_sel` | Out | **Pmod JC** Pin 4 (`JC2_N`) | `T10` | Driven `0` (selects Left I2S slot on `L/R`) |
| **B-L072Z-LRWAN1** | `lora_uart_txd` | Out | **Pmod JD** Pin 1 (`JD1_P`) | `T14` | FPGA UART TX $\rightarrow$ LoRaWAN RX (`115200` 8N1) |
| **B-L072Z-LRWAN1** | `lora_uart_rxd` | In | **Pmod JD** Pin 2 (`JD1_N`) | `T15` | LoRaWAN TX $\rightarrow$ FPGA UART RX |
| **B-L072Z-LRWAN1** | `lora_trig_o` | Out | **Pmod JD** Pin 3 (`JD2_P`) | `P14` | External interrupt / wake pulse before 1-byte TX |
| **User LEDs** | `leds_o[3:0]` | Out | On-board `LD3..LD0` | `D18, G14, M15, M14` | Active class indicator (`1 << pred_class`) |
| **Slide Switches** | `switches_i[1:0]` | In | On-board `SW1..SW0` | `P15, G15` | Live engine select (`SW0=0`: PL INT8, `SW0=1`: PS NEON) |
| **Console UART** | `PS UART1` | I/O | On-board FT2232HQ USB-UART | `MIO 48..49` | `115200` bps benchmark & monitoring report console |

### Memory-Mapped PL Register Map (`M_AXI_GP0`)
- **`0x43C00000` (`axi_uart`)**: `0x00 DATA`, `0x04 STATUS` (`bit0=tx_busy, bit1=rx_valid`), `0x08 CTRL`, `0x0C BAUD_DIV` (`54` for `115200` @ `100 MHz`).
- **`0x43C10000` (`axi_cnn_accelerator`, `ID = 0xACC64008`)**:
  - `0x00 CTRL` (`bit0=start, bit1=soft_rst, bit2=relu_en, bit3=raw_i32_en`)
  - `0x04 STATUS` (`bit0=busy, bit1=done, bit2=axi_err`)
  - `0x08 ACT_ADDR`, `0x0C WGT_ADDR`, `0x10 OUT_ADDR` (DDR3 physical addresses via `S_AXI_HP0`)
  - `0x14 DIM_MK` (`[15:0]=M`, `[31:16]=K`), `0x18 DIM_N_ZP` (`[15:0]=N`, `[23:16]=out_zp`), `0x1C ID`
  - `0x20 PERF_TOTAL`, `0x24 PERF_COMP`, `0x28 PERF_DMA`, `0x2C PERF_MAC8`
- **`0x43C20000` (`axi_i2s_rx`, `ID = 0x12250001`)**: `0x00 CTRL` (`en, fifo_clr, lora_trig`), `0x04 STATUS` (`empty, full, ovf, switches`), `0x08 FIFO_LEVEL`, `0x0C DATA_POP`, `0x10 LEDS`, `0x14 ID`.

---

## 3. Post-Route FPGA Utilization & Timing (`xc7z010clg400-1`)

Synthesized, placed, and routed in **AMD Vivado 2026.1** ([`build/fpga_utilization.rpt`](build/fpga_utilization.rpt), [`build/fpga_timing_summary.rpt`](build/fpga_timing_summary.rpt)):

| Resource | Used | Available (`xc7z010`) | Utilization | Breakdown |
| :--- | ---: | ---: | ---: | :--- |
| **Slice LUTs** | `4,744` | `17,600` | **`26.95%`** | `4,508` Logic + `236` LUTRAM/SRL |
| **Slice Registers (FFs)** | `5,913` | `35,200` | **`16.80%`** | `0` Latches |
| **Block RAM (`RAMB36E1`)** | `32` | `60` | **`53.33%`** | `16` Act (`64 KiB`) + `4` Wgt (`8 KiB`) + `8` I2S FIFO (`32 KiB`) + `4` SmartConnect |
| **DSP Slices (`DSP48E1`)** | `69` | `80` | **`86.25%`** | `64` Parallel INT8 MACs + `4` `17x17` Requantizer Multipliers + `1` Address Gen |
| **Bonded PL User IOBs** | `13` | `100` | **`13.00%`** | Pmod JC (`4`), Pmod JD (`3`), LEDs (`4`), Switches (`2`) |

- **Clock Constraint (`FCLK_CLK0`)**: `100.00 MHz` (`10.000 ns` period) — **ALL TIMING CONSTRAINTS MET**
  - **Worst Negative Slack (`WNS`)**: **`+0.680 ns`** (`TNS = 0.000 ns`, `0 / 21,110` failing endpoints; `Fmax = 107.3 MHz`)
  - **Worst Hold Slack (`WHS`)**: **`+0.014 ns`** (`THS = 0.000 ns`, `0 / 21,110` failing endpoints)
  - **Worst Pulse-Width Slack (`WPWS`)**: **`+3.750 ns`** (`0 / 6,430` failing endpoints)

---

## 4. Benchmark Results (ESC-50 Official Fold 5, `N = 640` Patches)

Evaluated strictly on held-out **ESC-50 Fold 5** (`80 chainsaw`, `80 engine`, `80 hand_saw`, `400 others`; PTQ calibrated exclusively on Folds 1–3 and hyperparameter-selected on Fold 4):

| Standalone Confusion Matrix: PS NEON (FP32) | Standalone Confusion Matrix: PL 64-MAC (INT8) |
| :---: | :---: |
| ![`cm_neon_fp32.png`](cm_neon_fp32.png) | ![`cm_pl_int8.png`](cm_pl_int8.png) |

| Standalone Per-Class & Macro $F_1$-Score | Standalone Edge Latency & Hardware Speedup |
| :---: | :---: |
| ![`f1_score_comparison.png`](f1_score_comparison.png) | ![`latency_speedup_comparison.png`](latency_speedup_comparison.png) |

*(Combined 4-panel overview: [`comparison_results.png`](comparison_results.png))*

### A. Overall Accuracy, Latency & Speedup Summary

| Metric | Raspberry Pi 3 (Paper Ref) | Zybo Z7-10 PS NEON (`FP32`) | Zybo Z7-10 PL 64-MAC (`INT8`) |
| :--- | :---: | :---: | :---: |
| **Global Accuracy (`Fold 5`)** | — | **`94.69%`** (`606 / 640`) | **`94.84%`** (`607 / 640`) |
| **Macro Precision** | `95.50%` | `91.63%` | **`92.24%`** |
| **Macro Recall** | `95.25%` | `95.37%` | **`95.44%`** |
| **Macro F1-Score** | `95.25%` | `93.36%` | **`93.74%`** |
| **C Audio Frontend (`STFT + 64-Mel`)** | Included | `2.450 ms` | `2.450 ms` |
| **YAMNet + Head Inference Latency** | — | `124.530 ms` | **`25.645 ms`** (`4.86x` vs NEON) |
| **End-to-End Latency (`0.96 s` patch)** | `1,250.00 ms` | `126.980 ms` | **`28.095 ms`** (`4.52x` vs NEON) |
| **Speedup vs. Raspberry Pi 3** | `1.00x` | `9.84x` | **`44.49x`** |
| **Effective Network Throughput** | `~110 MFLOPS` | `1,110.74 MFLOPS` | **`5,393.57 MOPS`** (`5.42 GOPS` PL) |
| **PL 64-MAC Cycles @ `100 MHz`** | N/A | N/A | `2,456,408` (`1,912,711` Comp + `502,160` DMA) |

*Additional Verification*:
- **Bit-Exact Golden Parity**: `[Golden Match: 640/640]` between Python reference and bare-metal C firmware on **both** `NEON_FP32` and `PL_INT8` (`97.03%` agreement between FP32 and INT8).
- **16-Clip End-to-End Waveform Test**: Max STFT/Log-Mel error vs Python = `4.9e-6`; `16/16` clips accurately classified; `12/12` critical logging clips triggered a 1-byte LoRaWAN payload and `4/4` `others` clips suppressed transmission.

### B. Per-Class Precision, Recall & F1-Score

| Class | Support | PS NEON (`FP32`) Precision | PS NEON (`FP32`) Recall | PS NEON (`FP32`) F1 | PL 64-MAC (`INT8`) Precision | PL 64-MAC (`INT8`) Recall | PL 64-MAC (`INT8`) F1 |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **`chainsaw`** | `80` | `90.24%` | `92.50%` | `91.36%` | **`91.36%`** | **`92.50%`** | **`91.93%`** |
| **`engine`** | `80` | `95.24%` | `100.00%` | `97.56%` | **`95.24%`** | **`100.00%`** | **`97.56%`** |
| **`hand_saw`** | `80` | `82.61%` | `95.00%` | `88.37%` | **`84.44%`** | **`95.00%`** | **`89.41%`** |
| **`others`** | `400` | `98.43%` | `94.00%` | `96.16%` | `97.92%` | **`94.25%`** | `96.05%` |
| **Macro Avg** | `640` | `91.63%` | `95.37%` | `93.36%` | **`92.24%`** | **`95.44%`** | **`93.74%`** |

### C. Confusion Matrices (`Rows = True`, `Cols = Predicted`)

**PS ARM Cortex-A9 NEON (`FP32`) — `94.69%` (`606 / 640`)**:

| True \ Pred | `chainsaw` | `engine` | `hand_saw` | `others` | Recall |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **`chainsaw`** | **`74` (`0.93`)** | `2` (`0.03`) | `2` (`0.03`) | `2` (`0.03`) | `92.50%` |
| **`engine`** | `0` (`0.00`) | **`80` (`1.00`)** | `0` (`0.00`) | `0` (`0.00`) | `100.00%` |
| **`hand_saw`** | `0` (`0.00`) | `0` (`0.00`) | **`76` (`0.95`)** | `4` (`0.05`) | `95.00%` |
| **`others`** | `8` (`0.02`) | `2` (`0.01`) | `14` (`0.04`) | **`376` (`0.94`)** | `94.00%` |

**Zynq PL 64-MAC Tensor Accelerator (`INT8`) — `94.84%` (`607 / 640`)**:

| True \ Pred | `chainsaw` | `engine` | `hand_saw` | `others` | Recall |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **`chainsaw`** | **`74` (`0.93`)** | `2` (`0.03`) | `0` (`0.00`) | `4` (`0.05`) | `92.50%` |
| **`engine`** | `0` (`0.00`) | **`80` (`1.00`)** | `0` (`0.00`) | `0` (`0.00`) | `100.00%` |
| **`hand_saw`** | `0` (`0.00`) | `0` (`0.00`) | **`76` (`0.95`)** | `4` (`0.05`) | `95.00%` |
| **`others`** | `7` (`0.02`) | `2` (`0.01`) | `14` (`0.04`) | **`377` (`0.94`)** | `94.25%` |

---

## 5. Build, Simulation & Hardware Deployment

### A. Export Quantized Model & Embedded ESC-50 Fold-5 Blob
```bash
.venv/bin/python3 python/prepare_features.py   # One-time ESC-50 feature cache
.venv/bin/python3 python/generate_model.py     # Exports build/model_blob.bin & software/model_weights.*
```

### B. Verify All VHDL RTL Cores in Vivado XSim
Runs self-checking testbenches (`tb_cnn_accelerator`, `tb_axi_i2s_rx`, `tb_axi_uart`):
```bash
make vivado-sim
```

### C. Build FPGA Bitstream & Export `zynq_ml.xsa`
```bash
make vivado-bitstream
```

### D. Compile Bare-Metal ARM Cortex-A9 Firmware (`software/app.elf`)
```bash
make app
```
Or create/build the Vitis platform & application project from `zynq_ml.xsa`:
```bash
vitis -s scripts/vitis_setup.py
# Classic XSCT alternative:
xsct scripts/vitis_setup.tcl
```

### E. Program Zybo Z7-10, Capture Benchmark Report & Plot `comparison_results.png`
1. **One-Command Hardware Flash + Benchmark + Plot** (connect Zybo Z7-10 `PROG/UART` USB `J12`, set jumper `JP5` to `JTAG`; opens `/dev/ttyUSB1` first, runs [`scripts/program_board.tcl`](scripts/program_board.tcl) via `xsdb` to load `system_wrapper.bit` + `ps7_init` + `software/app.elf`, captures the full Fold-5 benchmark to `build/hw_benchmark.log`, and generates `comparison_results.png`):
   ```bash
   make run-hw PORT=/dev/ttyUSB1 BAUD=115200
   ```
   Or flash and monitor separately:
   ```bash
   make program                           # Flash bitstream + ps7_init + app.elf via XSDB
   make benchmark PORT=/dev/ttyUSB1       # Capture benchmark from already-booting board
   make monitor PORT=/dev/ttyUSB1         # Watch Phase-3 live INMP441 -> LoRaWAN detections (toggle SW0!)
   ```
2. **Host Bit-Exact C Firmware + PL DMA Stream Verification** (no board required):
   ```bash
   make host-verify
   make plot
   ```
   Generates publication-quality 300-DPI raster (`.png`) and vector (`.pdf`) figures with serif typography (Computer Modern / DejaVu Serif) and minimalist academic paper styling (clean single titles, no subtitles, ready for LaTeX `\includegraphics`):
   * `cm_neon_fp32.png` & `cm_neon_fp32.pdf`: PS ARM NEON (FP32) normalized 4×4 confusion matrix ($94.69\%$)
   * `cm_pl_int8.png` & `cm_pl_int8.pdf`: PL 64-MAC (INT8) normalized 4×4 confusion matrix ($94.84\%$)
   * `f1_score_comparison.png` & `f1_score_comparison.pdf`: Per-class & macro $F_1$-score comparison vs ARARA Raspberry Pi 3 baseline
   * `latency_speedup_comparison.png` & `latency_speedup_comparison.pdf`: Log-scale latency per 960 ms patch ($1250\,\mathrm{ms} \to 28.1\,\mathrm{ms}$, $44.5\times$ speedup)
   * `comparison_results.png` & `comparison_results.pdf`: 4-panel combined overview figure
