# ==============================================================================
# XSDB JTAG Programming & Bare-Metal Launch Script for Digilent Zybo Z7-10
# Usage:
#   xsdb scripts/program_board.tcl
# Requirements:
#   1. Connect Zybo Z7-10 PROG/UART micro-USB port (J12) and power on board.
#   2. Set Boot Mode jumper JP5 to JTAG (middle pins) or QSPI/SD.
# ==============================================================================

set script_dir [file normalize [file dirname [info script]]]
set proj_dir   [file normalize [file join $script_dir ".."]]

set bit_file   [file join $proj_dir "zynq_ml.runs" "impl_1" "system_wrapper.bit"]
set ps7_tcl    [file join $proj_dir "zynq_ml.gen" "sources_1" "bd" "system" "ip" "system_processing_system7_0_0" "ps7_init.tcl"]
set elf_file   [file join $proj_dir "software" "app.elf"]

foreach f [list $bit_file $ps7_tcl $elf_file] {
    if {![file exists $f]} {
        puts "ERROR: Required file missing: $f"
        puts "Run 'make vivado-bitstream' and 'make app' first."
        exit 1
    }
}

puts "\[*\] Connecting to hw_server / Digilent Zybo Z7-10 over JTAG..."
connect

puts "\[*\] Resetting Zynq-7000 system..."
targets -set -nocase -filter {name =~ "APU*"}
rst -system
after 500

puts "\[*\] Programming PL Bitstream: $bit_file"
targets -set -nocase -filter {name =~ "xc7z*"}
fpga -file $bit_file

puts "\[*\] Running ps7_init & ps7_post_config (1 GB DDR3 + 100 MHz FCLK_CLK0)..."
targets -set -nocase -filter {name =~ "APU*"}
source $ps7_tcl
ps7_init
ps7_post_config

puts "\[*\] Downloading bare-metal ELF to DDR3 (~35.9 MiB, takes ~10-20s over JTAG): $elf_file"
targets -set -nocase -filter {name =~ "*Cortex-A9*#0"}
rst -processor
dow $elf_file

puts "\[*\] Starting ARM Cortex-A9 Core 0 execution..."
con
after 200
disconnect
puts "\[+\] Zybo Z7-10 programmed and running! Listen on /dev/ttyUSB1 @ 115200 bps."
exit 0

