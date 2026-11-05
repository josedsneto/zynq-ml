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

update_compile_order -fileset sources_1

# Refresh Block Design module references and output products
set bd_file [get_files -quiet system.bd]
if {$bd_file ne ""} {
    open_bd_design $bd_file
    catch {update_module_reference [get_ips -quiet system_axi_*]}
    validate_bd_design -force
    save_bd_design
    generate_target all $bd_file
}

update_compile_order -fileset sources_1

# Reset and launch synthesis
reset_run synth_1
launch_runs synth_1 -jobs 8
wait_on_run synth_1

if {[get_property PROGRESS [get_runs synth_1]] ne "100%"} {
    puts "ERROR: Synthesis failed!"
    close_project
    exit 1
}

# Launch Implementation & Bitstream Generation
reset_run impl_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1

if {[get_property PROGRESS [get_runs impl_1]] ne "100%"} {
    puts "ERROR: Implementation / Bitstream generation failed!"
    close_project
    exit 1
}

# Save concise FPGA Utilization & Timing Reports
open_run impl_1
file mkdir [file join $proj_dir "build"]
report_utilization    -file [file join $proj_dir "build" "fpga_utilization.rpt"]
report_timing_summary -file [file join $proj_dir "build" "fpga_timing_summary.rpt"]

# Export Hardware Platform (XSA) including Bitstream for Vitis
set xsa_file [file join $proj_dir "zynq_ml.xsa"]
write_hw_platform -fixed -include_bit -force -file $xsa_file
puts "=== Hardware Platform + Bitstream Exported: $xsa_file ==="

close_project
exit
