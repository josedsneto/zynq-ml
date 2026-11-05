# ==============================================================================
# Recreate Complete ARARA Zynq-7000 Block Design for Zybo Z7-10 (xc7z010clg400-1)
#   * PS7 Cortex-A9 @ 666.67 MHz + 1 GB DDR3L (MT41K256M16 RE-125) + USB-UART1
#   * FCLK_CLK0 = 100 MHz PL System Clock
#   * axi_cnn_accelerator_0 : 64-MAC INT8 DMA Tensor Engine (0x43C10000 + HP0)
#   * axi_i2s_rx_0          : INMP441 I2S Master RX + 16K FIFO (0x43C20000, Pmod JC)
#   * axi_uart_0            : B-L072Z-LRWAN1 LoRaWAN UART (0x43C00000, Pmod JD)
# ==============================================================================
set script_dir [file normalize [file dirname [info script]]]
set proj_dir   [file normalize [file join $script_dir ".."]]
open_project [file join $proj_dir "zynq_ml.xpr"]
set_property source_mgmt_mode All [current_project]

# Remove obsolete legacy module if still listed in project
set legacy_file [get_files -quiet *cnn_int8_accelerator.vhd]
if {[llength $legacy_file] > 0} {
    remove_files $legacy_file
}

# Ensure all RTL design files and Zybo Z7-10 XDC constraints are registered
set rtl_files [list \
    [file join $proj_dir "logic" "pw_sdp_ram.vhd"] \
    [file join $proj_dir "logic" "axi_cnn_accelerator.vhd"] \
    [file join $proj_dir "logic" "axi_i2s_rx.vhd"] \
    [file join $proj_dir "logic" "uart_rx.vhd"] \
    [file join $proj_dir "logic" "uart_tx.vhd"] \
    [file join $proj_dir "logic" "axi_uart.vhd"] \
]
foreach f $rtl_files {
    if {[llength [get_files -of_objects [get_filesets sources_1] -quiet $f]] == 0} {
        add_files -fileset sources_1 -norecurse $f
    }
    set_property file_type {VHDL} [get_files $f]
}

set xdc_file [file join $proj_dir "constraints" "zybo_z7_10.xdc"]
if {[llength [get_files -of_objects [get_filesets constrs_1] -quiet $xdc_file]] == 0} {
    add_files -fileset constrs_1 -norecurse $xdc_file
}

set sim_files [list \
    [file join $proj_dir "logic" "tb_cnn_accelerator.vhd"] \
    [file join $proj_dir "logic" "tb_axi_i2s_rx.vhd"] \
    [file join $proj_dir "logic" "tb_axi_uart.vhd"] \
]
foreach f $sim_files {
    if {[llength [get_files -of_objects [get_filesets sim_1] -quiet $f]] == 0} {
        add_files -fileset sim_1 -norecurse $f
    }
    set_property file_type {VHDL} [get_files $f]
}
set_property top tb_cnn_accelerator [get_filesets sim_1]

# Remove old system.bd / wrapper if present so the new architecture builds cleanly
set old_wraps [get_files -quiet *system_wrapper*]
if {[llength $old_wraps] > 0} {
    remove_files $old_wraps
}
set old_bd [get_files -quiet system.bd]
if {[llength $old_bd] > 0} {
    remove_files $old_bd
    file delete -force [file join $proj_dir "zynq_ml.srcs" "sources_1" "bd" "system"]
    file delete -force [file join $proj_dir "zynq_ml.gen" "sources_1" "bd" "system"]
}

update_compile_order -fileset sources_1

puts "=== Creating ARARA Block Design (system.bd) for Zybo Z7-10 ==="
create_bd_design "system"

# 1. Zynq-7000 Processing System configured for Digilent Zybo Z7-10
set ps7 [create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0]
set_property -dict [list \
    CONFIG.PCW_CRYSTAL_PERIPHERAL_FREQMHZ {33.333333} \
    CONFIG.PCW_APU_PERIPHERAL_FREQMHZ {666.666666} \
    CONFIG.PCW_APU_CLK_RATIO_ENABLE {6:2:1} \
    CONFIG.PCW_PRESET_BANK0_VOLTAGE {LVCMOS 3.3V} \
    CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} \
    CONFIG.PCW_UART0_PERIPHERAL_ENABLE {0} \
    CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_UART1_UART1_IO {MIO 48 .. 49} \
    CONFIG.PCW_UART1_BAUD_RATE {115200} \
    CONFIG.PCW_EN_CLK0_PORT {1} \
    CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
    CONFIG.PCW_USE_M_AXI_GP0 {1} \
    CONFIG.PCW_USE_S_AXI_HP0 {1} \
    CONFIG.PCW_S_AXI_HP0_DATA_WIDTH {64} \
    CONFIG.PCW_UIPARAM_DDR_ENABLE {1} \
    CONFIG.PCW_UIPARAM_DDR_MEMORY_TYPE {DDR 3 (Low Voltage)} \
    CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41K256M16 RE-125} \
    CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH {16 Bits} \
    CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {32 Bit} \
    CONFIG.PCW_UIPARAM_DDR_FREQ_MHZ {533.333333} \
    CONFIG.PCW_UIPARAM_DDR_TRAIN_WRITE_LEVEL {1} \
    CONFIG.PCW_UIPARAM_DDR_TRAIN_READ_GATE {1} \
    CONFIG.PCW_UIPARAM_DDR_TRAIN_DATA_EYE {1} \
    CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {0.221} \
    CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {0.222} \
    CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {0.217} \
    CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {0.244} \
    CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {-0.050} \
    CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 {-0.044} \
    CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {-0.035} \
    CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {-0.100} \
] $ps7

# Make DDR and FIXED_IO external
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 \
    -config {make_external "FIXED_IO, DDR" Master "Disable" Slave "Disable"} $ps7

# 2. Instantiate Custom VHDL Modules in PL
set cnn  [create_bd_cell -type module -reference axi_cnn_accelerator axi_cnn_accelerator_0]
set i2s  [create_bd_cell -type module -reference axi_i2s_rx          axi_i2s_rx_0]
set lora [create_bd_cell -type module -reference axi_uart            axi_uart_0]

# 3. AXI SmartConnects and Processor System Reset (100 MHz)
set smc_gp0 [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 axi_smc_gp0]
set_property -dict [list CONFIG.NUM_SI {1} CONFIG.NUM_MI {3}] $smc_gp0

set smc_hp0 [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 axi_smc_hp0]
set_property -dict [list CONFIG.NUM_SI {1} CONFIG.NUM_MI {1}] $smc_hp0

set rst [create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_100M]

# 4. Clock & Reset Nets
connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] \
               [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] \
               [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] \
               [get_bd_pins rst_ps7_100M/slowest_sync_clk] \
               [get_bd_pins axi_smc_gp0/aclk] \
               [get_bd_pins axi_smc_hp0/aclk] \
               [get_bd_pins axi_cnn_accelerator_0/s_axi_aclk] \
               [get_bd_pins axi_i2s_rx_0/s_axi_aclk] \
               [get_bd_pins axi_uart_0/s_axi_aclk]

connect_bd_net [get_bd_pins processing_system7_0/FCLK_RESET0_N] \
               [get_bd_pins rst_ps7_100M/ext_reset_in]

connect_bd_net [get_bd_pins rst_ps7_100M/peripheral_aresetn] \
               [get_bd_pins axi_smc_gp0/aresetn] \
               [get_bd_pins axi_smc_hp0/aresetn] \
               [get_bd_pins axi_cnn_accelerator_0/s_axi_aresetn] \
               [get_bd_pins axi_i2s_rx_0/s_axi_aresetn] \
               [get_bd_pins axi_uart_0/s_axi_aresetn]

# 5. AXI Bus Connections
connect_bd_intf_net [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins axi_smc_gp0/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_smc_gp0/M00_AXI]            [get_bd_intf_pins axi_uart_0/s_axi]
connect_bd_intf_net [get_bd_intf_pins axi_smc_gp0/M01_AXI]            [get_bd_intf_pins axi_cnn_accelerator_0/s_axi]
connect_bd_intf_net [get_bd_intf_pins axi_smc_gp0/M02_AXI]            [get_bd_intf_pins axi_i2s_rx_0/s_axi]

connect_bd_intf_net [get_bd_intf_pins axi_cnn_accelerator_0/m_axi]    [get_bd_intf_pins axi_smc_hp0/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_smc_hp0/M00_AXI]            [get_bd_intf_pins processing_system7_0/S_AXI_HP0]

# 6. External FPGA Pins (INMP441 I2S on Pmod JC, B-L072Z-LRWAN1 on Pmod JD, LEDs & Switches)
create_bd_port -dir O i2s_sck
create_bd_port -dir O i2s_ws
create_bd_port -dir I i2s_sd
create_bd_port -dir O i2s_lr_sel
connect_bd_net [get_bd_pins axi_i2s_rx_0/i2s_sck]    [get_bd_ports i2s_sck]
connect_bd_net [get_bd_pins axi_i2s_rx_0/i2s_ws]     [get_bd_ports i2s_ws]
connect_bd_net [get_bd_pins axi_i2s_rx_0/i2s_sd]     [get_bd_ports i2s_sd]
connect_bd_net [get_bd_pins axi_i2s_rx_0/i2s_lr_sel] [get_bd_ports i2s_lr_sel]

create_bd_port -dir O lora_uart_txd
create_bd_port -dir I lora_uart_rxd
create_bd_port -dir O lora_trig_o
connect_bd_net [get_bd_pins axi_uart_0/uart_txd]      [get_bd_ports lora_uart_txd]
connect_bd_net [get_bd_pins axi_uart_0/uart_rxd]      [get_bd_ports lora_uart_rxd]
connect_bd_net [get_bd_pins axi_i2s_rx_0/lora_trig_o] [get_bd_ports lora_trig_o]

create_bd_port -dir O -from 3 -to 0 leds_o
create_bd_port -dir I -from 1 -to 0 switches_i
connect_bd_net [get_bd_pins axi_i2s_rx_0/leds_o]     [get_bd_ports leds_o]
connect_bd_net [get_bd_pins axi_i2s_rx_0/switches_i] [get_bd_ports switches_i]

# 7. Memory-Mapped Address Assignments
assign_bd_address -offset 0x43C00000 -range 0x00010000 \
    -target_address_space [get_bd_addr_spaces processing_system7_0/Data] \
    [get_bd_addr_segs axi_uart_0/s_axi/reg0] -force

assign_bd_address -offset 0x43C10000 -range 0x00010000 \
    -target_address_space [get_bd_addr_spaces processing_system7_0/Data] \
    [get_bd_addr_segs axi_cnn_accelerator_0/s_axi/reg0] -force

assign_bd_address -offset 0x43C20000 -range 0x00010000 \
    -target_address_space [get_bd_addr_spaces processing_system7_0/Data] \
    [get_bd_addr_segs axi_i2s_rx_0/s_axi/reg0] -force

assign_bd_address -offset 0x00000000 -range 0x40000000 \
    -target_address_space [get_bd_addr_spaces axi_cnn_accelerator_0/m_axi] \
    [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] -force

validate_bd_design
save_bd_design

# 8. Generate Top-Level HDL Wrapper
set bd_file [get_files system.bd]
set wrapper_files [make_wrapper -files $bd_file -top]
if {[llength $wrapper_files] > 0} {
    add_files -norecurse $wrapper_files
}
set_property top system_wrapper [get_filesets sources_1]
update_compile_order -fileset sources_1

puts "=== ARARA Zybo Z7-10 Block Design Validated and Wrapper Generated ==="
close_project
exit
