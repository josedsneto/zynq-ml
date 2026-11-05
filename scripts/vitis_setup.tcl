# XSCT Automation Script for Classic Vitis Flow (Zybo Z7-10 ARARA Port)
# Usage: xsct scripts/vitis_setup.tcl
set script_dir [file normalize [file dirname [info script]]]
set proj_dir   [file normalize [file join $script_dir ".."]]
set ws_dir     [file join $proj_dir "vitis_workspace"]
set xsa_file   [file join $proj_dir "zynq_ml.xsa"]
set src_dir    [file join $ws_dir "src"]

setws $ws_dir
puts "=== Vitis Workspace set to: $ws_dir ==="

if {![file exists $xsa_file]} {
    puts "Warning: $xsa_file not found. Run 'make vivado-bitstream' first."
    exit 0
}

platform create -name "arara_zybo_z7_10_platform" -hw $xsa_file -proc "ps7_cortexa9_0" -os "standalone"
platform generate

app create -name "arara_deforestation_app" -platform "arara_zybo_z7_10_platform" -domain "standalone_domain" -template "Empty Application"
importsources -name "arara_deforestation_app" -path $src_dir
app config -name "arara_deforestation_app" -set compiler-misc [list -mcpu=cortex-a9 -mfpu=neon -mfloat-abi=hard -O2 -Wa,-I$proj_dir]
app config -name "arara_deforestation_app" -add libraries m
app build -name "arara_deforestation_app"

puts "=== Vitis XSCT Setup Complete ==="
exit
