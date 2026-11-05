# Setup Vivado Project for ARARA Zynq-7000 Acoustic Monitoring System (Zybo Z7-10)
set script_dir [file normalize [file dirname [info script]]]
set proj_dir   [file normalize [file join $script_dir ".."]]
set proj_file  [file join $proj_dir "zynq_ml.xpr"]

puts "=== Opening Vivado Project: $proj_file ==="
open_project $proj_file
set_property source_mgmt_mode All [current_project]

# Remove obsolete legacy module if still listed in project
set legacy_file [get_files -quiet *cnn_int8_accelerator.vhd]
if {[llength $legacy_file] > 0} {
    remove_files $legacy_file
}

puts "=== Registering Synthesizable VHDL RTL Sources ==="
set design_files [list \
    [file join $proj_dir "logic" "pw_sdp_ram.vhd"] \
    [file join $proj_dir "logic" "axi_cnn_accelerator.vhd"] \
    [file join $proj_dir "logic" "axi_i2s_rx.vhd"] \
    [file join $proj_dir "logic" "uart_rx.vhd"] \
    [file join $proj_dir "logic" "uart_tx.vhd"] \
    [file join $proj_dir "logic" "axi_uart.vhd"] \
]
foreach f $design_files {
    if {[llength [get_files -of_objects [get_filesets sources_1] -quiet $f]] == 0} {
        add_files -fileset sources_1 -norecurse $f
    }
    set_property file_type {VHDL} [get_files $f]
}

puts "=== Registering Zybo Z7-10 Pin Constraints ==="
set xdc_file [file join $proj_dir "constraints" "zybo_z7_10.xdc"]
if {[llength [get_files -of_objects [get_filesets constrs_1] -quiet $xdc_file]] == 0} {
    add_files -fileset constrs_1 -norecurse $xdc_file
}

puts "=== Registering Simulation Testbenches ==="
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
set_property top_lib xil_defaultlib [get_filesets sim_1]

update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
close_project
exit
