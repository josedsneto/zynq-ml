# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "CLK_HZ" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FIFO_ADDR_W" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FS_HZ" -parent ${Page_0}


}

proc update_PARAM_VALUE.CLK_HZ { PARAM_VALUE.CLK_HZ } {
	# Procedure called to update CLK_HZ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CLK_HZ { PARAM_VALUE.CLK_HZ } {
	# Procedure called to validate CLK_HZ
	return true
}

proc update_PARAM_VALUE.FIFO_ADDR_W { PARAM_VALUE.FIFO_ADDR_W } {
	# Procedure called to update FIFO_ADDR_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FIFO_ADDR_W { PARAM_VALUE.FIFO_ADDR_W } {
	# Procedure called to validate FIFO_ADDR_W
	return true
}

proc update_PARAM_VALUE.FS_HZ { PARAM_VALUE.FS_HZ } {
	# Procedure called to update FS_HZ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FS_HZ { PARAM_VALUE.FS_HZ } {
	# Procedure called to validate FS_HZ
	return true
}


proc update_MODELPARAM_VALUE.CLK_HZ { MODELPARAM_VALUE.CLK_HZ PARAM_VALUE.CLK_HZ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CLK_HZ}] ${MODELPARAM_VALUE.CLK_HZ}
}

proc update_MODELPARAM_VALUE.FS_HZ { MODELPARAM_VALUE.FS_HZ PARAM_VALUE.FS_HZ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FS_HZ}] ${MODELPARAM_VALUE.FS_HZ}
}

proc update_MODELPARAM_VALUE.FIFO_ADDR_W { MODELPARAM_VALUE.FIFO_ADDR_W PARAM_VALUE.FIFO_ADDR_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIFO_ADDR_W}] ${MODELPARAM_VALUE.FIFO_ADDR_W}
}

