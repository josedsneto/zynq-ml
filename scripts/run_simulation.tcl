set script_dir [file normalize [file dirname [info script]]]
set proj_dir   [file normalize [file join $script_dir ".."]]
open_project [file join $proj_dir "zynq_ml.xpr"]
launch_simulation -step all -simset sim_1
run -all
close_sim
close_project
exit
