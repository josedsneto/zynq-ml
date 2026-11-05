CROSS_COMPILE ?= arm-none-eabi-
CC            := $(CROSS_COMPILE)gcc
OBJCOPY       := $(CROSS_COMPILE)objcopy
OBJDUMP       := $(CROSS_COMPILE)objdump
SIZE          := $(CROSS_COMPILE)size
HOST_CC       ?= gcc

CFLAGS        := -mcpu=cortex-a9 -mfpu=neon -mfloat-abi=hard -marm -ffreestanding -fno-math-errno -O2 -Wall -Isoftware
LDFLAGS       := -T software/linker.ld -nostdlib

C_SRCS        := software/main.c \
                 software/uart.c \
                 software/peripherals.c \
                 software/frontend.c \
                 software/cnn_neon.c \
                 software/cnn_int8.c \
                 software/model_weights.c

OBJS          := software/startup.o \
                 software/main.o \
                 software/uart.o \
                 software/peripherals.o \
                 software/frontend.o \
                 software/cnn_neon.o \
                 software/cnn_int8.o \
                 software/model_weights.o \
                 software/model_blob.o

TARGET_ELF    := software/app.elf
TARGET_BIN    := software/app.bin
TARGET_DUMP   := software/app.dump
FEATURES_NPZ  := build/features_esc50.npz
MODEL_BLOB    := build/model_blob.bin
HOST_SIM_BIN  := build/host_arara_sim
GOLDEN_LOG    := build/golden_benchmark.log

VIVADO        ?= /home/nectx/Xilinx/2026.1/Vivado/bin/vivado
VITIS         ?= /home/nectx/Xilinx/2026.1/Vitis/bin/vitis
XSDB          ?= $(shell if [ -x /home/nectx/Xilinx/2026.1/Vitis/bin/xsdb ]; then echo /home/nectx/Xilinx/2026.1/Vitis/bin/xsdb; elif [ -x /home/nectx/Xilinx/2026.1/Vivado/bin/xsdb ]; then echo /home/nectx/Xilinx/2026.1/Vivado/bin/xsdb; else echo xsdb; fi)
VENV_PY       := $(abspath .venv/bin/python3)
PYTHON        := $(shell if [ -x $(VENV_PY) ]; then echo $(VENV_PY); else echo python3; fi)

PORT          ?= /dev/ttyUSB1
BAUD          ?= 115200
LOG           ?= $(GOLDEN_LOG)

.PHONY: all help features model app host-verify plot vivado vivado-sim vivado-bd vivado-bitstream vitis vitis-setup program run-hw benchmark monitor clean

all: app

help:
	@echo "=============================================================================="
	@echo " ARARA Zynq-7000 (Zybo Z7-10) Build, Simulation & Hardware Test Targets"
	@echo "=============================================================================="
	@echo "  1. Software & Model Verification (No FPGA Board Required):"
	@echo "     make features         - Extract & cache ESC-50 16 kHz log-mel features"
	@echo "     make model            - Run PTQ calibration & export build/model_blob.bin"
	@echo "     make host-verify      - Run bit-exact C firmware + PL DMA sim on host PC"
	@echo "     make plot             - Generate comparison_results.png from LOG=$(LOG)"
	@echo ""
	@echo "  2. FPGA RTL Simulation & Synthesis (AMD Vivado 2026.1):"
	@echo "     make vivado-sim       - Run all 3 self-checking VHDL testbenches in XSim"
	@echo "     make vivado-bd        - Recreate Zynq PS + PL AXI Block Design"
	@echo "     make vivado-bitstream - Run Synth + Impl + Bitstream + export zynq_ml.xsa"
	@echo "     make vivado           - Open zynq_ml.xpr in Vivado GUI"
	@echo ""
	@echo "  3. Bare-Metal Firmware & Physical Zybo Z7-10 Board Testing:"
	@echo "     make app              - Cross-compile bare-metal ARM ELF (software/app.elf)"
	@echo "     make program          - Flash bitstream + ps7_init + app.elf over USB-JTAG"
	@echo "     make run-hw           - Auto-program board + capture UART report + plot"
	@echo "     make benchmark        - Listen on PORT=$(PORT) ($(BAUD) bps) & plot"
	@echo "     make monitor          - Stream Phase-3 live INMP441 + LoRaWAN detections"
	@echo "     make vitis-setup      - Generate Vitis platform & app from zynq_ml.xsa"
	@echo "     make vitis            - Open vitis_workspace in AMD Vitis IDE"
	@echo "=============================================================================="

$(FEATURES_NPZ): python/prepare_features.py
	$(PYTHON) python/prepare_features.py

features: $(FEATURES_NPZ)

$(MODEL_BLOB) software/model_weights.h software/model_weights.c software/model_blob.s: python/generate_model.py $(FEATURES_NPZ)
	$(PYTHON) python/generate_model.py

model: $(MODEL_BLOB)

app: $(TARGET_ELF) $(TARGET_BIN) $(TARGET_DUMP)
	$(SIZE) $(TARGET_ELF)

software/%.o: software/%.c software/model_weights.h
	$(CC) $(CFLAGS) -c $< -o $@

software/startup.o: software/startup.s
	$(CC) $(CFLAGS) -c $< -o $@

software/model_blob.o: software/model_blob.s $(MODEL_BLOB)
	$(CC) $(CFLAGS) -c software/model_blob.s -o $@

$(TARGET_ELF): $(OBJS) software/linker.ld
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -lm -lgcc -o $(TARGET_ELF)

$(TARGET_BIN): $(TARGET_ELF)
	$(OBJCOPY) -O binary $< $@

$(TARGET_DUMP): $(TARGET_ELF)
	$(OBJDUMP) -d $< > $@

$(HOST_SIM_BIN): $(C_SRCS) software/model_blob.s $(MODEL_BLOB)
	@mkdir -p build
	$(HOST_CC) -O2 -Wall -DHOST_GOLDEN_SIM -Isoftware $(C_SRCS) software/model_blob.s -lm -o $(HOST_SIM_BIN)

host-verify: $(HOST_SIM_BIN)
	./$(HOST_SIM_BIN) | tee $(GOLDEN_LOG)

plot:
	$(PYTHON) analyze.py --log-file $(LOG) --skip-build

vivado:
	$(VIVADO) zynq_ml.xpr &

vivado-sim:
	./scripts/sim_all_rtl.sh

vivado-bd:
	$(VIVADO) -mode batch -source scripts/create_bd.tcl -notrace

vivado-bitstream:
	$(VIVADO) -mode batch -source scripts/build_hardware.tcl -notrace

vitis-setup:
	$(VITIS) -s scripts/vitis_setup.py

vitis:
	$(VITIS) -w vitis_workspace &

program: app
	$(XSDB) scripts/program_board.tcl

run-hw: app
	$(PYTHON) analyze.py --program --xsdb $(XSDB) --port $(PORT) --baud $(BAUD) $(ARGS)

benchmark: app
	$(PYTHON) analyze.py --port $(PORT) --baud $(BAUD) $(ARGS)

monitor:
	$(PYTHON) analyze.py --monitor --port $(PORT) --baud $(BAUD)

clean:
	rm -f $(OBJS) $(TARGET_ELF) $(TARGET_BIN) $(TARGET_DUMP) $(HOST_SIM_BIN)
	rm -rf zynq_ml.sim/sim_1/behav/xsim/*.wdb zynq_ml.sim/sim_1/behav/xsim/*.log zynq_ml.sim/sim_1/behav/xsim/*.jou
