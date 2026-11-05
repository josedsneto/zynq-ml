## ============================================================================
## Physical Pin Constraints for ARARA on Digilent Zybo Z7-10 (xc7z010clg400-1)
## Reference: Digilent Zybo-Z7-Master.xdc (Rev. B)
## ============================================================================

## 1. INMP441 Digital MEMS I2S Microphone -> Pmod Header JC (3.3V LVCMOS33)
##    JC1 (Pin 1) : i2s_sck    (1.024 MHz BCLK output)
##    JC2 (Pin 2) : i2s_ws     (16.000 kHz LRCLK/WS output)
##    JC3 (Pin 3) : i2s_sd     (24-bit I2S data input from INMP441 SD)
##    JC4 (Pin 4) : i2s_lr_sel (Tied '0' -> selects Left channel on INMP441 L/R)
set_property -dict { PACKAGE_PIN V15 IOSTANDARD LVCMOS33 SLEW FAST } [get_ports { i2s_sck }]
set_property -dict { PACKAGE_PIN W15 IOSTANDARD LVCMOS33 SLEW FAST } [get_ports { i2s_ws }]
set_property -dict { PACKAGE_PIN T11 IOSTANDARD LVCMOS33 PULLDOWN TRUE } [get_ports { i2s_sd }]
set_property -dict { PACKAGE_PIN T10 IOSTANDARD LVCMOS33 } [get_ports { i2s_lr_sel }]

## 2. ST B-L072Z-LRWAN1 LoRaWAN Discovery Kit -> Pmod Header JD (3.3V LVCMOS33)
##    JD1 (Pin 1) : lora_uart_txd (FPGA TX -> B-L072Z RX, 1-byte class payload)
##    JD2 (Pin 2) : lora_uart_rxd (B-L072Z TX -> FPGA RX, ACK/status)
##    JD3 (Pin 3) : lora_trig_o   (Wake / Event Trigger GPIO pulse)
set_property -dict { PACKAGE_PIN T14 IOSTANDARD LVCMOS33 } [get_ports { lora_uart_txd }]
set_property -dict { PACKAGE_PIN T15 IOSTANDARD LVCMOS33 PULLUP TRUE } [get_ports { lora_uart_rxd }]
set_property -dict { PACKAGE_PIN P14 IOSTANDARD LVCMOS33 } [get_ports { lora_trig_o }]

## 3. Zybo Z7-10 On-Board User LEDs (LD0..LD3)
##    LD0 = chainsaw, LD1 = engine, LD2 = hand_saw, LD3 = active/heartbeat
set_property -dict { PACKAGE_PIN M14 IOSTANDARD LVCMOS33 } [get_ports { leds_o[0] }]
set_property -dict { PACKAGE_PIN M15 IOSTANDARD LVCMOS33 } [get_ports { leds_o[1] }]
set_property -dict { PACKAGE_PIN G14 IOSTANDARD LVCMOS33 } [get_ports { leds_o[2] }]
set_property -dict { PACKAGE_PIN D18 IOSTANDARD LVCMOS33 } [get_ports { leds_o[3] }]

## 4. Zybo Z7-10 On-Board Slide Switches (SW0..SW1)
set_property -dict { PACKAGE_PIN G15 IOSTANDARD LVCMOS33 } [get_ports { switches_i[0] }]
set_property -dict { PACKAGE_PIN P15 IOSTANDARD LVCMOS33 } [get_ports { switches_i[1] }]

