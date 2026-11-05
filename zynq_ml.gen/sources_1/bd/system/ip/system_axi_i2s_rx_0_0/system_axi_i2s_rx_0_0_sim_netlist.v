// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (lin64) Build 6511674 Tue Jun 16 11:01:26 MDT 2026
// Date        : Wed Nov  4 20:37:08 2026
// Host        : pop-os running 64-bit Pop!_OS 24.04 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/nectx/Dev/zynq_ml/zynq_ml.gen/sources_1/bd/system/ip/system_axi_i2s_rx_0_0/system_axi_i2s_rx_0_0_sim_netlist.v
// Design      : system_axi_i2s_rx_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_axi_i2s_rx_0_0,axi_i2s_rx,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "axi_i2s_rx,Vivado 2026.1" *) 
(* NotValidForBitStream *)
module system_axi_i2s_rx_0_0
   (s_axi_aclk,
    s_axi_aresetn,
    s_axi_awaddr,
    s_axi_awprot,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arprot,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_rready,
    i2s_sck,
    i2s_ws,
    i2s_sd,
    i2s_lr_sel,
    lora_trig_o,
    switches_i,
    leds_o);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 s_axi_aclk CLK" *) (* x_interface_mode = "slave s_axi_aclk" *) (* x_interface_parameter = "XIL_INTERFACENAME s_axi_aclk, ASSOCIATED_BUSIF s_axi, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input s_axi_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 s_axi_aresetn RST" *) (* x_interface_mode = "slave s_axi_aresetn" *) (* x_interface_parameter = "XIL_INTERFACENAME s_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_axi_aresetn;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi AWADDR" *) (* x_interface_mode = "slave s_axi" *) (* x_interface_parameter = "XIL_INTERFACENAME s_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 8, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [7:0]s_axi_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi AWPROT" *) input [2:0]s_axi_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi AWVALID" *) input s_axi_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi AWREADY" *) output s_axi_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi WDATA" *) input [31:0]s_axi_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi WSTRB" *) input [3:0]s_axi_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi WVALID" *) input s_axi_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi WREADY" *) output s_axi_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi BRESP" *) output [1:0]s_axi_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi BVALID" *) output s_axi_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi BREADY" *) input s_axi_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi ARADDR" *) input [7:0]s_axi_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi ARPROT" *) input [2:0]s_axi_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi ARVALID" *) input s_axi_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi ARREADY" *) output s_axi_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi RDATA" *) output [31:0]s_axi_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi RRESP" *) output [1:0]s_axi_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi RVALID" *) output s_axi_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi RREADY" *) input s_axi_rready;
  output i2s_sck;
  output i2s_ws;
  input i2s_sd;
  output i2s_lr_sel;
  output lora_trig_o;
  input [1:0]switches_i;
  output [3:0]leds_o;

  wire \<const0> ;
  wire i2s_sck;
  wire i2s_sd;
  wire i2s_ws;
  wire [3:0]leds_o;
  wire lora_trig_o;
  wire s_axi_aclk;
  wire [7:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [7:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire s_axi_wvalid;
  wire [1:0]switches_i;

  assign i2s_lr_sel = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  system_axi_i2s_rx_0_0_axi_i2s_rx U0
       (.bvalid_r_reg_0(s_axi_bvalid),
        .i2s_sd(i2s_sd),
        .i2s_ws(i2s_ws),
        .leds_o(leds_o),
        .lora_trig_o(lora_trig_o),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr[7:2]),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr[7:2]),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata[3:0]),
        .s_axi_wready(s_axi_wready),
        .s_axi_wvalid(s_axi_wvalid),
        .sck_reg_reg_0(i2s_sck),
        .switches_i(switches_i));
endmodule

(* ORIG_REF_NAME = "axi_i2s_rx" *) 
module system_axi_i2s_rx_0_0_axi_i2s_rx
   (s_axi_arready,
    leds_o,
    s_axi_rdata,
    bvalid_r_reg_0,
    i2s_ws,
    sck_reg_reg_0,
    lora_trig_o,
    s_axi_rvalid,
    s_axi_awready,
    s_axi_wready,
    s_axi_aresetn,
    s_axi_arvalid,
    s_axi_rready,
    s_axi_aclk,
    s_axi_awaddr,
    s_axi_wdata,
    s_axi_araddr,
    switches_i,
    i2s_sd,
    s_axi_bready,
    s_axi_awvalid,
    s_axi_wvalid);
  output s_axi_arready;
  output [3:0]leds_o;
  output [31:0]s_axi_rdata;
  output bvalid_r_reg_0;
  output i2s_ws;
  output sck_reg_reg_0;
  output lora_trig_o;
  output s_axi_rvalid;
  output s_axi_awready;
  output s_axi_wready;
  input s_axi_aresetn;
  input s_axi_arvalid;
  input s_axi_rready;
  input s_axi_aclk;
  input [5:0]s_axi_awaddr;
  input [3:0]s_axi_wdata;
  input [5:0]s_axi_araddr;
  input [1:0]switches_i;
  input i2s_sd;
  input s_axi_bready;
  input s_axi_awvalid;
  input s_axi_wvalid;

  wire \FSM_onehot_rd_state[0]_i_1_n_0 ;
  wire \FSM_onehot_rd_state[1]_i_1_n_0 ;
  wire \FSM_onehot_rd_state[2]_i_1_n_0 ;
  wire \FSM_onehot_rd_state_reg_n_0_[0] ;
  wire \FSM_onehot_rd_state_reg_n_0_[2] ;
  wire \araddr_reg_reg_n_0_[5] ;
  wire \araddr_reg_reg_n_0_[6] ;
  wire \araddr_reg_reg_n_0_[7] ;
  wire arready_r;
  wire aw_latched_i_1_n_0;
  wire aw_latched_reg_n_0;
  wire \awaddr_reg_reg_n_0_[6] ;
  wire \awaddr_reg_reg_n_0_[7] ;
  wire awready_r_i_1_n_0;
  wire [5:0]bit_cnt;
  wire bvalid_r_i_1_n_0;
  wire bvalid_r_i_2_n_0;
  wire bvalid_r_reg_0;
  wire fifo_clr;
  wire fifo_clr1;
  wire fifo_clr_i_1_n_0;
  wire fifo_clr_i_2_n_0;
  wire \fifo_count[0]_i_10_n_0 ;
  wire \fifo_count[0]_i_1_n_0 ;
  wire \fifo_count[0]_i_3_n_0 ;
  wire \fifo_count[0]_i_4_n_0 ;
  wire \fifo_count[0]_i_5_n_0 ;
  wire \fifo_count[0]_i_6_n_0 ;
  wire \fifo_count[0]_i_7_n_0 ;
  wire \fifo_count[0]_i_8_n_0 ;
  wire \fifo_count[0]_i_9_n_0 ;
  wire \fifo_count[12]_i_2_n_0 ;
  wire \fifo_count[12]_i_3_n_0 ;
  wire \fifo_count[12]_i_4_n_0 ;
  wire \fifo_count[4]_i_2_n_0 ;
  wire \fifo_count[4]_i_3_n_0 ;
  wire \fifo_count[4]_i_4_n_0 ;
  wire \fifo_count[4]_i_5_n_0 ;
  wire \fifo_count[8]_i_2_n_0 ;
  wire \fifo_count[8]_i_3_n_0 ;
  wire \fifo_count[8]_i_4_n_0 ;
  wire \fifo_count[8]_i_5_n_0 ;
  wire [14:0]fifo_count_reg;
  wire \fifo_count_reg[0]_i_2_n_0 ;
  wire \fifo_count_reg[0]_i_2_n_1 ;
  wire \fifo_count_reg[0]_i_2_n_2 ;
  wire \fifo_count_reg[0]_i_2_n_3 ;
  wire \fifo_count_reg[0]_i_2_n_4 ;
  wire \fifo_count_reg[0]_i_2_n_5 ;
  wire \fifo_count_reg[0]_i_2_n_6 ;
  wire \fifo_count_reg[0]_i_2_n_7 ;
  wire \fifo_count_reg[12]_i_1_n_2 ;
  wire \fifo_count_reg[12]_i_1_n_3 ;
  wire \fifo_count_reg[12]_i_1_n_5 ;
  wire \fifo_count_reg[12]_i_1_n_6 ;
  wire \fifo_count_reg[12]_i_1_n_7 ;
  wire \fifo_count_reg[4]_i_1_n_0 ;
  wire \fifo_count_reg[4]_i_1_n_1 ;
  wire \fifo_count_reg[4]_i_1_n_2 ;
  wire \fifo_count_reg[4]_i_1_n_3 ;
  wire \fifo_count_reg[4]_i_1_n_4 ;
  wire \fifo_count_reg[4]_i_1_n_5 ;
  wire \fifo_count_reg[4]_i_1_n_6 ;
  wire \fifo_count_reg[4]_i_1_n_7 ;
  wire \fifo_count_reg[8]_i_1_n_0 ;
  wire \fifo_count_reg[8]_i_1_n_1 ;
  wire \fifo_count_reg[8]_i_1_n_2 ;
  wire \fifo_count_reg[8]_i_1_n_3 ;
  wire \fifo_count_reg[8]_i_1_n_4 ;
  wire \fifo_count_reg[8]_i_1_n_5 ;
  wire \fifo_count_reg[8]_i_1_n_6 ;
  wire \fifo_count_reg[8]_i_1_n_7 ;
  wire fifo_ram_reg_0_i_1_n_0;
  wire fifo_ram_reg_0_i_2_n_0;
  wire fifo_ram_reg_2_i_1_n_0;
  wire fifo_ram_reg_5_i_1_n_0;
  wire fifo_ram_reg_7_i_1_n_0;
  wire i2s_en;
  wire i2s_en_i_1_n_0;
  wire i2s_sd;
  wire i2s_ws;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__1_i_1_n_0;
  wire i__carry__1_i_2_n_0;
  wire i__carry__1_i_3_n_0;
  wire i__carry__2_i_1_n_0;
  wire i__carry__3_i_1_n_0;
  wire i__carry__3_i_2_n_0;
  wire i__carry__3_i_3_n_0;
  wire i__carry__4_i_1_n_0;
  wire i__carry__4_i_2_n_0;
  wire i__carry__5_i_1_n_0;
  wire i__carry__5_i_2_n_0;
  wire i__carry_i_1_n_0;
  wire [3:0]leds_o;
  wire [0:0]leds_reg;
  wire \leds_reg[3]_i_2_n_0 ;
  wire lora_trig_o;
  wire lora_trig_r_i_1_n_0;
  wire [31:1]nco_acc;
  wire [5:0]next_b;
  wire overrun_reg;
  wire overrun_reg_i_1_n_0;
  wire [2:0]p_0_in;
  wire p_0_in0;
  wire p_19_in;
  wire p_1_in;
  wire p_1_in_1;
  wire [0:0]p_2_in;
  wire pop_nonempty;
  wire pop_nonempty_i_1_n_0;
  wire pop_pulse_i_1_n_0;
  wire pop_pulse_i_2_n_0;
  wire pop_pulse_reg_n_0;
  wire [15:0]ram_rdata;
  wire [13:0]rd_ptr;
  wire rd_ptr1;
  wire \rd_ptr[0]_i_2_n_0 ;
  wire [13:0]rd_ptr_reg;
  wire \rd_ptr_reg[0]_i_1_n_0 ;
  wire \rd_ptr_reg[0]_i_1_n_1 ;
  wire \rd_ptr_reg[0]_i_1_n_2 ;
  wire \rd_ptr_reg[0]_i_1_n_3 ;
  wire \rd_ptr_reg[0]_i_1_n_4 ;
  wire \rd_ptr_reg[0]_i_1_n_5 ;
  wire \rd_ptr_reg[0]_i_1_n_6 ;
  wire \rd_ptr_reg[0]_i_1_n_7 ;
  wire \rd_ptr_reg[12]_i_1_n_3 ;
  wire \rd_ptr_reg[12]_i_1_n_6 ;
  wire \rd_ptr_reg[12]_i_1_n_7 ;
  wire \rd_ptr_reg[4]_i_1_n_0 ;
  wire \rd_ptr_reg[4]_i_1_n_1 ;
  wire \rd_ptr_reg[4]_i_1_n_2 ;
  wire \rd_ptr_reg[4]_i_1_n_3 ;
  wire \rd_ptr_reg[4]_i_1_n_4 ;
  wire \rd_ptr_reg[4]_i_1_n_5 ;
  wire \rd_ptr_reg[4]_i_1_n_6 ;
  wire \rd_ptr_reg[4]_i_1_n_7 ;
  wire \rd_ptr_reg[8]_i_1_n_0 ;
  wire \rd_ptr_reg[8]_i_1_n_1 ;
  wire \rd_ptr_reg[8]_i_1_n_2 ;
  wire \rd_ptr_reg[8]_i_1_n_3 ;
  wire \rd_ptr_reg[8]_i_1_n_4 ;
  wire \rd_ptr_reg[8]_i_1_n_5 ;
  wire \rd_ptr_reg[8]_i_1_n_6 ;
  wire \rd_ptr_reg[8]_i_1_n_7 ;
  wire \rd_ptr_reg_rep[12]_i_1_n_0 ;
  wire \rd_ptr_reg_rep[12]_i_1_n_1 ;
  wire \rd_ptr_reg_rep[12]_i_1_n_2 ;
  wire \rd_ptr_reg_rep[12]_i_1_n_3 ;
  wire \rd_ptr_reg_rep[12]_i_1_n_4 ;
  wire \rd_ptr_reg_rep[12]_i_1_n_5 ;
  wire \rd_ptr_reg_rep[12]_i_1_n_6 ;
  wire \rd_ptr_reg_rep[12]_i_1_n_7 ;
  wire \rd_ptr_reg_rep[13]_i_3_n_7 ;
  wire \rd_ptr_reg_rep[4]_i_1_n_0 ;
  wire \rd_ptr_reg_rep[4]_i_1_n_1 ;
  wire \rd_ptr_reg_rep[4]_i_1_n_2 ;
  wire \rd_ptr_reg_rep[4]_i_1_n_3 ;
  wire \rd_ptr_reg_rep[4]_i_1_n_4 ;
  wire \rd_ptr_reg_rep[4]_i_1_n_5 ;
  wire \rd_ptr_reg_rep[4]_i_1_n_6 ;
  wire \rd_ptr_reg_rep[4]_i_1_n_7 ;
  wire \rd_ptr_reg_rep[8]_i_1_n_0 ;
  wire \rd_ptr_reg_rep[8]_i_1_n_1 ;
  wire \rd_ptr_reg_rep[8]_i_1_n_2 ;
  wire \rd_ptr_reg_rep[8]_i_1_n_3 ;
  wire \rd_ptr_reg_rep[8]_i_1_n_4 ;
  wire \rd_ptr_reg_rep[8]_i_1_n_5 ;
  wire \rd_ptr_reg_rep[8]_i_1_n_6 ;
  wire \rd_ptr_reg_rep[8]_i_1_n_7 ;
  wire \rd_ptr_rep[0]_i_1_n_0 ;
  wire \rd_ptr_rep[13]_i_1_n_0 ;
  wire [0:0]rdata_r;
  wire \rdata_r[0]_i_1_n_0 ;
  wire \rdata_r[0]_i_2_n_0 ;
  wire \rdata_r[0]_i_3_n_0 ;
  wire \rdata_r[10]_i_1_n_0 ;
  wire \rdata_r[11]_i_1_n_0 ;
  wire \rdata_r[12]_i_1_n_0 ;
  wire \rdata_r[13]_i_1_n_0 ;
  wire \rdata_r[14]_i_1_n_0 ;
  wire \rdata_r[14]_i_2_n_0 ;
  wire \rdata_r[15]_i_1_n_0 ;
  wire \rdata_r[16]_i_1_n_0 ;
  wire \rdata_r[17]_i_1_n_0 ;
  wire \rdata_r[18]_i_1_n_0 ;
  wire \rdata_r[19]_i_1_n_0 ;
  wire \rdata_r[1]_i_1_n_0 ;
  wire \rdata_r[1]_i_2_n_0 ;
  wire \rdata_r[1]_i_3_n_0 ;
  wire \rdata_r[20]_i_1_n_0 ;
  wire \rdata_r[21]_i_1_n_0 ;
  wire \rdata_r[22]_i_1_n_0 ;
  wire \rdata_r[23]_i_1_n_0 ;
  wire \rdata_r[24]_i_1_n_0 ;
  wire \rdata_r[25]_i_1_n_0 ;
  wire \rdata_r[26]_i_1_n_0 ;
  wire \rdata_r[27]_i_1_n_0 ;
  wire \rdata_r[28]_i_1_n_0 ;
  wire \rdata_r[28]_i_2_n_0 ;
  wire \rdata_r[29]_i_1_n_0 ;
  wire \rdata_r[2]_i_1_n_0 ;
  wire \rdata_r[2]_i_2_n_0 ;
  wire \rdata_r[2]_i_3_n_0 ;
  wire \rdata_r[2]_i_4_n_0 ;
  wire \rdata_r[2]_i_5_n_0 ;
  wire \rdata_r[30]_i_1_n_0 ;
  wire \rdata_r[31]_i_1_n_0 ;
  wire \rdata_r[31]_i_2_n_0 ;
  wire \rdata_r[31]_i_3_n_0 ;
  wire \rdata_r[31]_i_4_n_0 ;
  wire \rdata_r[3]_i_1_n_0 ;
  wire \rdata_r[3]_i_2_n_0 ;
  wire \rdata_r[3]_i_3_n_0 ;
  wire \rdata_r[4]_i_1_n_0 ;
  wire \rdata_r[4]_i_2_n_0 ;
  wire \rdata_r[5]_i_1_n_0 ;
  wire \rdata_r[5]_i_2_n_0 ;
  wire \rdata_r[5]_i_3_n_0 ;
  wire \rdata_r[6]_i_1_n_0 ;
  wire \rdata_r[7]_i_1_n_0 ;
  wire \rdata_r[8]_i_1_n_0 ;
  wire \rdata_r[9]_i_1_n_0 ;
  wire rvalid_r_i_1_n_0;
  wire s_axi_aclk;
  wire [5:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [5:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [3:0]s_axi_wdata;
  wire s_axi_wready;
  wire s_axi_wvalid;
  wire [15:0]sample_data;
  wire \sample_data[15]_i_1_n_0 ;
  wire \sample_data[15]_i_2_n_0 ;
  wire \sample_data[15]_i_3_n_0 ;
  wire sample_push;
  wire sample_push0;
  wire \sample_push1_inferred__0/i__carry__0_n_0 ;
  wire \sample_push1_inferred__0/i__carry__0_n_1 ;
  wire \sample_push1_inferred__0/i__carry__0_n_2 ;
  wire \sample_push1_inferred__0/i__carry__0_n_3 ;
  wire \sample_push1_inferred__0/i__carry__0_n_4 ;
  wire \sample_push1_inferred__0/i__carry__0_n_5 ;
  wire \sample_push1_inferred__0/i__carry__0_n_6 ;
  wire \sample_push1_inferred__0/i__carry__0_n_7 ;
  wire \sample_push1_inferred__0/i__carry__1_n_0 ;
  wire \sample_push1_inferred__0/i__carry__1_n_1 ;
  wire \sample_push1_inferred__0/i__carry__1_n_2 ;
  wire \sample_push1_inferred__0/i__carry__1_n_3 ;
  wire \sample_push1_inferred__0/i__carry__1_n_4 ;
  wire \sample_push1_inferred__0/i__carry__1_n_5 ;
  wire \sample_push1_inferred__0/i__carry__1_n_6 ;
  wire \sample_push1_inferred__0/i__carry__1_n_7 ;
  wire \sample_push1_inferred__0/i__carry__2_n_0 ;
  wire \sample_push1_inferred__0/i__carry__2_n_1 ;
  wire \sample_push1_inferred__0/i__carry__2_n_2 ;
  wire \sample_push1_inferred__0/i__carry__2_n_3 ;
  wire \sample_push1_inferred__0/i__carry__2_n_4 ;
  wire \sample_push1_inferred__0/i__carry__2_n_5 ;
  wire \sample_push1_inferred__0/i__carry__2_n_6 ;
  wire \sample_push1_inferred__0/i__carry__2_n_7 ;
  wire \sample_push1_inferred__0/i__carry__3_n_0 ;
  wire \sample_push1_inferred__0/i__carry__3_n_1 ;
  wire \sample_push1_inferred__0/i__carry__3_n_2 ;
  wire \sample_push1_inferred__0/i__carry__3_n_3 ;
  wire \sample_push1_inferred__0/i__carry__3_n_4 ;
  wire \sample_push1_inferred__0/i__carry__3_n_5 ;
  wire \sample_push1_inferred__0/i__carry__3_n_6 ;
  wire \sample_push1_inferred__0/i__carry__3_n_7 ;
  wire \sample_push1_inferred__0/i__carry__4_n_0 ;
  wire \sample_push1_inferred__0/i__carry__4_n_1 ;
  wire \sample_push1_inferred__0/i__carry__4_n_2 ;
  wire \sample_push1_inferred__0/i__carry__4_n_3 ;
  wire \sample_push1_inferred__0/i__carry__4_n_4 ;
  wire \sample_push1_inferred__0/i__carry__4_n_5 ;
  wire \sample_push1_inferred__0/i__carry__4_n_6 ;
  wire \sample_push1_inferred__0/i__carry__4_n_7 ;
  wire \sample_push1_inferred__0/i__carry__5_n_0 ;
  wire \sample_push1_inferred__0/i__carry__5_n_1 ;
  wire \sample_push1_inferred__0/i__carry__5_n_2 ;
  wire \sample_push1_inferred__0/i__carry__5_n_3 ;
  wire \sample_push1_inferred__0/i__carry__5_n_4 ;
  wire \sample_push1_inferred__0/i__carry__5_n_5 ;
  wire \sample_push1_inferred__0/i__carry__5_n_6 ;
  wire \sample_push1_inferred__0/i__carry__5_n_7 ;
  wire \sample_push1_inferred__0/i__carry__6_n_0 ;
  wire \sample_push1_inferred__0/i__carry__6_n_1 ;
  wire \sample_push1_inferred__0/i__carry__6_n_2 ;
  wire \sample_push1_inferred__0/i__carry__6_n_3 ;
  wire \sample_push1_inferred__0/i__carry__6_n_4 ;
  wire \sample_push1_inferred__0/i__carry__6_n_5 ;
  wire \sample_push1_inferred__0/i__carry__6_n_6 ;
  wire \sample_push1_inferred__0/i__carry__6_n_7 ;
  wire \sample_push1_inferred__0/i__carry_n_0 ;
  wire \sample_push1_inferred__0/i__carry_n_1 ;
  wire \sample_push1_inferred__0/i__carry_n_2 ;
  wire \sample_push1_inferred__0/i__carry_n_3 ;
  wire \sample_push1_inferred__0/i__carry_n_4 ;
  wire \sample_push1_inferred__0/i__carry_n_5 ;
  wire \sample_push1_inferred__0/i__carry_n_6 ;
  wire sample_push_reg_n_0;
  wire sck_reg_i_2_n_0;
  wire sck_reg_reg_0;
  wire sd_sync1;
  wire sd_sync2;
  wire [2:0]sel0;
  wire [6:0]shift_reg;
  wire [0:0]shift_reg_0;
  wire \shift_reg_reg_n_0_[10] ;
  wire \shift_reg_reg_n_0_[11] ;
  wire \shift_reg_reg_n_0_[12] ;
  wire \shift_reg_reg_n_0_[13] ;
  wire \shift_reg_reg_n_0_[14] ;
  wire \shift_reg_reg_n_0_[15] ;
  wire \shift_reg_reg_n_0_[16] ;
  wire \shift_reg_reg_n_0_[17] ;
  wire \shift_reg_reg_n_0_[18] ;
  wire \shift_reg_reg_n_0_[19] ;
  wire \shift_reg_reg_n_0_[20] ;
  wire \shift_reg_reg_n_0_[21] ;
  wire \shift_reg_reg_n_0_[22] ;
  wire \shift_reg_reg_n_0_[7] ;
  wire \shift_reg_reg_n_0_[8] ;
  wire \shift_reg_reg_n_0_[9] ;
  wire [1:0]sw_sync1;
  wire [1:0]sw_sync2;
  wire [1:0]switches_i;
  wire \total_cnt[0]_i_2_n_0 ;
  wire [31:0]total_cnt_reg;
  wire \total_cnt_reg[0]_i_1_n_0 ;
  wire \total_cnt_reg[0]_i_1_n_1 ;
  wire \total_cnt_reg[0]_i_1_n_2 ;
  wire \total_cnt_reg[0]_i_1_n_3 ;
  wire \total_cnt_reg[0]_i_1_n_4 ;
  wire \total_cnt_reg[0]_i_1_n_5 ;
  wire \total_cnt_reg[0]_i_1_n_6 ;
  wire \total_cnt_reg[0]_i_1_n_7 ;
  wire \total_cnt_reg[12]_i_1_n_0 ;
  wire \total_cnt_reg[12]_i_1_n_1 ;
  wire \total_cnt_reg[12]_i_1_n_2 ;
  wire \total_cnt_reg[12]_i_1_n_3 ;
  wire \total_cnt_reg[12]_i_1_n_4 ;
  wire \total_cnt_reg[12]_i_1_n_5 ;
  wire \total_cnt_reg[12]_i_1_n_6 ;
  wire \total_cnt_reg[12]_i_1_n_7 ;
  wire \total_cnt_reg[16]_i_1_n_0 ;
  wire \total_cnt_reg[16]_i_1_n_1 ;
  wire \total_cnt_reg[16]_i_1_n_2 ;
  wire \total_cnt_reg[16]_i_1_n_3 ;
  wire \total_cnt_reg[16]_i_1_n_4 ;
  wire \total_cnt_reg[16]_i_1_n_5 ;
  wire \total_cnt_reg[16]_i_1_n_6 ;
  wire \total_cnt_reg[16]_i_1_n_7 ;
  wire \total_cnt_reg[20]_i_1_n_0 ;
  wire \total_cnt_reg[20]_i_1_n_1 ;
  wire \total_cnt_reg[20]_i_1_n_2 ;
  wire \total_cnt_reg[20]_i_1_n_3 ;
  wire \total_cnt_reg[20]_i_1_n_4 ;
  wire \total_cnt_reg[20]_i_1_n_5 ;
  wire \total_cnt_reg[20]_i_1_n_6 ;
  wire \total_cnt_reg[20]_i_1_n_7 ;
  wire \total_cnt_reg[24]_i_1_n_0 ;
  wire \total_cnt_reg[24]_i_1_n_1 ;
  wire \total_cnt_reg[24]_i_1_n_2 ;
  wire \total_cnt_reg[24]_i_1_n_3 ;
  wire \total_cnt_reg[24]_i_1_n_4 ;
  wire \total_cnt_reg[24]_i_1_n_5 ;
  wire \total_cnt_reg[24]_i_1_n_6 ;
  wire \total_cnt_reg[24]_i_1_n_7 ;
  wire \total_cnt_reg[28]_i_1_n_1 ;
  wire \total_cnt_reg[28]_i_1_n_2 ;
  wire \total_cnt_reg[28]_i_1_n_3 ;
  wire \total_cnt_reg[28]_i_1_n_4 ;
  wire \total_cnt_reg[28]_i_1_n_5 ;
  wire \total_cnt_reg[28]_i_1_n_6 ;
  wire \total_cnt_reg[28]_i_1_n_7 ;
  wire \total_cnt_reg[4]_i_1_n_0 ;
  wire \total_cnt_reg[4]_i_1_n_1 ;
  wire \total_cnt_reg[4]_i_1_n_2 ;
  wire \total_cnt_reg[4]_i_1_n_3 ;
  wire \total_cnt_reg[4]_i_1_n_4 ;
  wire \total_cnt_reg[4]_i_1_n_5 ;
  wire \total_cnt_reg[4]_i_1_n_6 ;
  wire \total_cnt_reg[4]_i_1_n_7 ;
  wire \total_cnt_reg[8]_i_1_n_0 ;
  wire \total_cnt_reg[8]_i_1_n_1 ;
  wire \total_cnt_reg[8]_i_1_n_2 ;
  wire \total_cnt_reg[8]_i_1_n_3 ;
  wire \total_cnt_reg[8]_i_1_n_4 ;
  wire \total_cnt_reg[8]_i_1_n_5 ;
  wire \total_cnt_reg[8]_i_1_n_6 ;
  wire \total_cnt_reg[8]_i_1_n_7 ;
  wire w_latched_i_1_n_0;
  wire w_latched_reg_n_0;
  wire \wdata_reg_reg_n_0_[0] ;
  wire \wdata_reg_reg_n_0_[1] ;
  wire \wdata_reg_reg_n_0_[3] ;
  wire \wr_ptr[0]_i_2_n_0 ;
  wire [13:0]wr_ptr_reg;
  wire \wr_ptr_reg[0]_i_1_n_0 ;
  wire \wr_ptr_reg[0]_i_1_n_1 ;
  wire \wr_ptr_reg[0]_i_1_n_2 ;
  wire \wr_ptr_reg[0]_i_1_n_3 ;
  wire \wr_ptr_reg[0]_i_1_n_4 ;
  wire \wr_ptr_reg[0]_i_1_n_5 ;
  wire \wr_ptr_reg[0]_i_1_n_6 ;
  wire \wr_ptr_reg[0]_i_1_n_7 ;
  wire \wr_ptr_reg[12]_i_1_n_3 ;
  wire \wr_ptr_reg[12]_i_1_n_6 ;
  wire \wr_ptr_reg[12]_i_1_n_7 ;
  wire \wr_ptr_reg[4]_i_1_n_0 ;
  wire \wr_ptr_reg[4]_i_1_n_1 ;
  wire \wr_ptr_reg[4]_i_1_n_2 ;
  wire \wr_ptr_reg[4]_i_1_n_3 ;
  wire \wr_ptr_reg[4]_i_1_n_4 ;
  wire \wr_ptr_reg[4]_i_1_n_5 ;
  wire \wr_ptr_reg[4]_i_1_n_6 ;
  wire \wr_ptr_reg[4]_i_1_n_7 ;
  wire \wr_ptr_reg[8]_i_1_n_0 ;
  wire \wr_ptr_reg[8]_i_1_n_1 ;
  wire \wr_ptr_reg[8]_i_1_n_2 ;
  wire \wr_ptr_reg[8]_i_1_n_3 ;
  wire \wr_ptr_reg[8]_i_1_n_4 ;
  wire \wr_ptr_reg[8]_i_1_n_5 ;
  wire \wr_ptr_reg[8]_i_1_n_6 ;
  wire \wr_ptr_reg[8]_i_1_n_7 ;
  wire wready_r_i_1_n_0;
  wire ws_reg0_out;
  wire ws_reg_i_1_n_0;
  wire [3:2]\NLW_fifo_count_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_fifo_count_reg[12]_i_1_O_UNCONNECTED ;
  wire NLW_fifo_ram_reg_0_CASCADEOUTA_UNCONNECTED;
  wire NLW_fifo_ram_reg_0_CASCADEOUTB_UNCONNECTED;
  wire NLW_fifo_ram_reg_0_DBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_0_INJECTDBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_0_INJECTSBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_0_SBITERR_UNCONNECTED;
  wire [31:0]NLW_fifo_ram_reg_0_DOADO_UNCONNECTED;
  wire [31:2]NLW_fifo_ram_reg_0_DOBDO_UNCONNECTED;
  wire [3:0]NLW_fifo_ram_reg_0_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_fifo_ram_reg_0_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_fifo_ram_reg_0_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_fifo_ram_reg_0_RDADDRECC_UNCONNECTED;
  wire NLW_fifo_ram_reg_1_CASCADEOUTA_UNCONNECTED;
  wire NLW_fifo_ram_reg_1_CASCADEOUTB_UNCONNECTED;
  wire NLW_fifo_ram_reg_1_DBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_1_INJECTDBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_1_INJECTSBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_1_SBITERR_UNCONNECTED;
  wire [31:0]NLW_fifo_ram_reg_1_DOADO_UNCONNECTED;
  wire [31:2]NLW_fifo_ram_reg_1_DOBDO_UNCONNECTED;
  wire [3:0]NLW_fifo_ram_reg_1_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_fifo_ram_reg_1_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_fifo_ram_reg_1_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_fifo_ram_reg_1_RDADDRECC_UNCONNECTED;
  wire NLW_fifo_ram_reg_2_CASCADEOUTA_UNCONNECTED;
  wire NLW_fifo_ram_reg_2_CASCADEOUTB_UNCONNECTED;
  wire NLW_fifo_ram_reg_2_DBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_2_INJECTDBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_2_INJECTSBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_2_SBITERR_UNCONNECTED;
  wire [31:0]NLW_fifo_ram_reg_2_DOADO_UNCONNECTED;
  wire [31:2]NLW_fifo_ram_reg_2_DOBDO_UNCONNECTED;
  wire [3:0]NLW_fifo_ram_reg_2_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_fifo_ram_reg_2_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_fifo_ram_reg_2_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_fifo_ram_reg_2_RDADDRECC_UNCONNECTED;
  wire NLW_fifo_ram_reg_3_CASCADEOUTA_UNCONNECTED;
  wire NLW_fifo_ram_reg_3_CASCADEOUTB_UNCONNECTED;
  wire NLW_fifo_ram_reg_3_DBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_3_INJECTDBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_3_INJECTSBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_3_SBITERR_UNCONNECTED;
  wire [31:0]NLW_fifo_ram_reg_3_DOADO_UNCONNECTED;
  wire [31:2]NLW_fifo_ram_reg_3_DOBDO_UNCONNECTED;
  wire [3:0]NLW_fifo_ram_reg_3_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_fifo_ram_reg_3_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_fifo_ram_reg_3_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_fifo_ram_reg_3_RDADDRECC_UNCONNECTED;
  wire NLW_fifo_ram_reg_4_CASCADEOUTA_UNCONNECTED;
  wire NLW_fifo_ram_reg_4_CASCADEOUTB_UNCONNECTED;
  wire NLW_fifo_ram_reg_4_DBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_4_INJECTDBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_4_INJECTSBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_4_SBITERR_UNCONNECTED;
  wire [31:0]NLW_fifo_ram_reg_4_DOADO_UNCONNECTED;
  wire [31:2]NLW_fifo_ram_reg_4_DOBDO_UNCONNECTED;
  wire [3:0]NLW_fifo_ram_reg_4_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_fifo_ram_reg_4_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_fifo_ram_reg_4_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_fifo_ram_reg_4_RDADDRECC_UNCONNECTED;
  wire NLW_fifo_ram_reg_5_CASCADEOUTA_UNCONNECTED;
  wire NLW_fifo_ram_reg_5_CASCADEOUTB_UNCONNECTED;
  wire NLW_fifo_ram_reg_5_DBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_5_INJECTDBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_5_INJECTSBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_5_SBITERR_UNCONNECTED;
  wire [31:0]NLW_fifo_ram_reg_5_DOADO_UNCONNECTED;
  wire [31:2]NLW_fifo_ram_reg_5_DOBDO_UNCONNECTED;
  wire [3:0]NLW_fifo_ram_reg_5_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_fifo_ram_reg_5_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_fifo_ram_reg_5_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_fifo_ram_reg_5_RDADDRECC_UNCONNECTED;
  wire NLW_fifo_ram_reg_6_CASCADEOUTA_UNCONNECTED;
  wire NLW_fifo_ram_reg_6_CASCADEOUTB_UNCONNECTED;
  wire NLW_fifo_ram_reg_6_DBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_6_INJECTDBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_6_INJECTSBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_6_SBITERR_UNCONNECTED;
  wire [31:0]NLW_fifo_ram_reg_6_DOADO_UNCONNECTED;
  wire [31:2]NLW_fifo_ram_reg_6_DOBDO_UNCONNECTED;
  wire [3:0]NLW_fifo_ram_reg_6_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_fifo_ram_reg_6_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_fifo_ram_reg_6_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_fifo_ram_reg_6_RDADDRECC_UNCONNECTED;
  wire NLW_fifo_ram_reg_7_CASCADEOUTA_UNCONNECTED;
  wire NLW_fifo_ram_reg_7_CASCADEOUTB_UNCONNECTED;
  wire NLW_fifo_ram_reg_7_DBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_7_INJECTDBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_7_INJECTSBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_7_SBITERR_UNCONNECTED;
  wire [31:0]NLW_fifo_ram_reg_7_DOADO_UNCONNECTED;
  wire [31:2]NLW_fifo_ram_reg_7_DOBDO_UNCONNECTED;
  wire [3:0]NLW_fifo_ram_reg_7_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_fifo_ram_reg_7_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_fifo_ram_reg_7_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_fifo_ram_reg_7_RDADDRECC_UNCONNECTED;
  wire [3:1]\NLW_rd_ptr_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_rd_ptr_reg[12]_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_rd_ptr_reg_rep[13]_i_3_CO_UNCONNECTED ;
  wire [3:1]\NLW_rd_ptr_reg_rep[13]_i_3_O_UNCONNECTED ;
  wire [0:0]\NLW_sample_push1_inferred__0/i__carry_O_UNCONNECTED ;
  wire [3:1]NLW_sck_reg_reg_i_3_CO_UNCONNECTED;
  wire [3:0]NLW_sck_reg_reg_i_3_O_UNCONNECTED;
  wire [3:3]\NLW_total_cnt_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_wr_ptr_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_wr_ptr_reg[12]_i_1_O_UNCONNECTED ;

  LUT5 #(
    .INIT(32'hF0F5E0E0)) 
    \FSM_onehot_rd_state[0]_i_1 
       (.I0(rdata_r),
        .I1(s_axi_rready),
        .I2(\FSM_onehot_rd_state_reg_n_0_[2] ),
        .I3(s_axi_arvalid),
        .I4(\FSM_onehot_rd_state_reg_n_0_[0] ),
        .O(\FSM_onehot_rd_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFEA0000)) 
    \FSM_onehot_rd_state[1]_i_1 
       (.I0(rdata_r),
        .I1(s_axi_rready),
        .I2(\FSM_onehot_rd_state_reg_n_0_[2] ),
        .I3(s_axi_arvalid),
        .I4(\FSM_onehot_rd_state_reg_n_0_[0] ),
        .O(\FSM_onehot_rd_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hAABABABA)) 
    \FSM_onehot_rd_state[2]_i_1 
       (.I0(rdata_r),
        .I1(s_axi_rready),
        .I2(\FSM_onehot_rd_state_reg_n_0_[2] ),
        .I3(s_axi_arvalid),
        .I4(\FSM_onehot_rd_state_reg_n_0_[0] ),
        .O(\FSM_onehot_rd_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "rd_idle:001,rd_bram_wait:010,rd_resp:100," *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_rd_state_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_onehot_rd_state[0]_i_1_n_0 ),
        .Q(\FSM_onehot_rd_state_reg_n_0_[0] ),
        .S(bvalid_r_i_1_n_0));
  (* FSM_ENCODED_STATES = "rd_idle:001,rd_bram_wait:010,rd_resp:100," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_rd_state_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_onehot_rd_state[1]_i_1_n_0 ),
        .Q(rdata_r),
        .R(bvalid_r_i_1_n_0));
  (* FSM_ENCODED_STATES = "rd_idle:001,rd_bram_wait:010,rd_resp:100," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_rd_state_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_onehot_rd_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_rd_state_reg_n_0_[2] ),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \araddr_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(arready_r),
        .D(s_axi_araddr[0]),
        .Q(sel0[0]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \araddr_reg_reg[3] 
       (.C(s_axi_aclk),
        .CE(arready_r),
        .D(s_axi_araddr[1]),
        .Q(sel0[1]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \araddr_reg_reg[4] 
       (.C(s_axi_aclk),
        .CE(arready_r),
        .D(s_axi_araddr[2]),
        .Q(sel0[2]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \araddr_reg_reg[5] 
       (.C(s_axi_aclk),
        .CE(arready_r),
        .D(s_axi_araddr[3]),
        .Q(\araddr_reg_reg_n_0_[5] ),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \araddr_reg_reg[6] 
       (.C(s_axi_aclk),
        .CE(arready_r),
        .D(s_axi_araddr[4]),
        .Q(\araddr_reg_reg_n_0_[6] ),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \araddr_reg_reg[7] 
       (.C(s_axi_aclk),
        .CE(arready_r),
        .D(s_axi_araddr[5]),
        .Q(\araddr_reg_reg_n_0_[7] ),
        .R(bvalid_r_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    arready_r_i_1
       (.I0(\FSM_onehot_rd_state_reg_n_0_[0] ),
        .I1(s_axi_arvalid),
        .O(arready_r));
  FDRE #(
    .INIT(1'b0)) 
    arready_r_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(arready_r),
        .Q(s_axi_arready),
        .R(bvalid_r_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hC0CC0808)) 
    aw_latched_i_1
       (.I0(s_axi_awvalid),
        .I1(s_axi_aresetn),
        .I2(bvalid_r_reg_0),
        .I3(w_latched_reg_n_0),
        .I4(aw_latched_reg_n_0),
        .O(aw_latched_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    aw_latched_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(aw_latched_i_1_n_0),
        .Q(aw_latched_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \awaddr_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(awready_r_i_1_n_0),
        .D(s_axi_awaddr[0]),
        .Q(p_0_in[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \awaddr_reg_reg[3] 
       (.C(s_axi_aclk),
        .CE(awready_r_i_1_n_0),
        .D(s_axi_awaddr[1]),
        .Q(p_0_in[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \awaddr_reg_reg[4] 
       (.C(s_axi_aclk),
        .CE(awready_r_i_1_n_0),
        .D(s_axi_awaddr[2]),
        .Q(p_0_in[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \awaddr_reg_reg[5] 
       (.C(s_axi_aclk),
        .CE(awready_r_i_1_n_0),
        .D(s_axi_awaddr[3]),
        .Q(p_0_in0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \awaddr_reg_reg[6] 
       (.C(s_axi_aclk),
        .CE(awready_r_i_1_n_0),
        .D(s_axi_awaddr[4]),
        .Q(\awaddr_reg_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \awaddr_reg_reg[7] 
       (.C(s_axi_aclk),
        .CE(awready_r_i_1_n_0),
        .D(s_axi_awaddr[5]),
        .Q(\awaddr_reg_reg_n_0_[7] ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0040)) 
    awready_r_i_1
       (.I0(aw_latched_reg_n_0),
        .I1(s_axi_awvalid),
        .I2(s_axi_aresetn),
        .I3(bvalid_r_reg_0),
        .O(awready_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    awready_r_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(awready_r_i_1_n_0),
        .Q(s_axi_awready),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \bit_cnt[0]_i_1 
       (.I0(bit_cnt[0]),
        .O(next_b[0]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \bit_cnt[1]_i_1 
       (.I0(bit_cnt[0]),
        .I1(bit_cnt[1]),
        .O(next_b[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \bit_cnt[2]_i_1 
       (.I0(bit_cnt[1]),
        .I1(bit_cnt[0]),
        .I2(bit_cnt[2]),
        .O(next_b[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \bit_cnt[3]_i_1 
       (.I0(bit_cnt[2]),
        .I1(bit_cnt[0]),
        .I2(bit_cnt[1]),
        .I3(bit_cnt[3]),
        .O(next_b[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \bit_cnt[4]_i_1 
       (.I0(bit_cnt[3]),
        .I1(bit_cnt[1]),
        .I2(bit_cnt[0]),
        .I3(bit_cnt[2]),
        .I4(bit_cnt[4]),
        .O(next_b[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_cnt[5]_i_1 
       (.I0(sck_reg_reg_0),
        .I1(p_1_in_1),
        .O(ws_reg0_out));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \bit_cnt[5]_i_2 
       (.I0(bit_cnt[3]),
        .I1(bit_cnt[4]),
        .I2(bit_cnt[1]),
        .I3(bit_cnt[0]),
        .I4(bit_cnt[2]),
        .I5(bit_cnt[5]),
        .O(next_b[5]));
  FDSE #(
    .INIT(1'b0)) 
    \bit_cnt_reg[0] 
       (.C(s_axi_aclk),
        .CE(ws_reg0_out),
        .D(next_b[0]),
        .Q(bit_cnt[0]),
        .S(sample_push0));
  FDSE #(
    .INIT(1'b0)) 
    \bit_cnt_reg[1] 
       (.C(s_axi_aclk),
        .CE(ws_reg0_out),
        .D(next_b[1]),
        .Q(bit_cnt[1]),
        .S(sample_push0));
  FDSE #(
    .INIT(1'b0)) 
    \bit_cnt_reg[2] 
       (.C(s_axi_aclk),
        .CE(ws_reg0_out),
        .D(next_b[2]),
        .Q(bit_cnt[2]),
        .S(sample_push0));
  FDSE #(
    .INIT(1'b0)) 
    \bit_cnt_reg[3] 
       (.C(s_axi_aclk),
        .CE(ws_reg0_out),
        .D(next_b[3]),
        .Q(bit_cnt[3]),
        .S(sample_push0));
  FDSE #(
    .INIT(1'b0)) 
    \bit_cnt_reg[4] 
       (.C(s_axi_aclk),
        .CE(ws_reg0_out),
        .D(next_b[4]),
        .Q(bit_cnt[4]),
        .S(sample_push0));
  FDSE #(
    .INIT(1'b0)) 
    \bit_cnt_reg[5] 
       (.C(s_axi_aclk),
        .CE(ws_reg0_out),
        .D(next_b[5]),
        .Q(bit_cnt[5]),
        .S(sample_push0));
  LUT1 #(
    .INIT(2'h1)) 
    bvalid_r_i_1
       (.I0(s_axi_aresetn),
        .O(bvalid_r_i_1_n_0));
  LUT4 #(
    .INIT(16'h55C0)) 
    bvalid_r_i_2
       (.I0(s_axi_bready),
        .I1(aw_latched_reg_n_0),
        .I2(w_latched_reg_n_0),
        .I3(bvalid_r_reg_0),
        .O(bvalid_r_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    bvalid_r_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(bvalid_r_i_2_n_0),
        .Q(bvalid_r_reg_0),
        .R(bvalid_r_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000400000000000)) 
    fifo_clr_i_1
       (.I0(bvalid_r_reg_0),
        .I1(w_latched_reg_n_0),
        .I2(aw_latched_reg_n_0),
        .I3(\wdata_reg_reg_n_0_[1] ),
        .I4(p_0_in[0]),
        .I5(fifo_clr_i_2_n_0),
        .O(fifo_clr_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    fifo_clr_i_2
       (.I0(p_0_in0),
        .I1(\awaddr_reg_reg_n_0_[6] ),
        .I2(p_0_in[1]),
        .I3(p_0_in[2]),
        .I4(\awaddr_reg_reg_n_0_[7] ),
        .I5(s_axi_aresetn),
        .O(fifo_clr_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    fifo_clr_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(fifo_clr_i_1_n_0),
        .Q(fifo_clr),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hB5E0)) 
    \fifo_count[0]_i_1 
       (.I0(fifo_count_reg[14]),
        .I1(\fifo_count[0]_i_3_n_0 ),
        .I2(pop_pulse_reg_n_0),
        .I3(sample_push_reg_n_0),
        .O(\fifo_count[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \fifo_count[0]_i_10 
       (.I0(fifo_count_reg[12]),
        .I1(fifo_count_reg[13]),
        .I2(fifo_count_reg[10]),
        .I3(fifo_count_reg[11]),
        .I4(fifo_count_reg[1]),
        .I5(fifo_count_reg[0]),
        .O(\fifo_count[0]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \fifo_count[0]_i_3 
       (.I0(\fifo_count[0]_i_9_n_0 ),
        .I1(fifo_count_reg[3]),
        .I2(fifo_count_reg[2]),
        .I3(fifo_count_reg[5]),
        .I4(fifo_count_reg[4]),
        .I5(\fifo_count[0]_i_10_n_0 ),
        .O(\fifo_count[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFD5)) 
    \fifo_count[0]_i_4 
       (.I0(sample_push_reg_n_0),
        .I1(\fifo_count[0]_i_3_n_0 ),
        .I2(pop_pulse_reg_n_0),
        .I3(fifo_count_reg[14]),
        .O(\fifo_count[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h002AFFD5)) 
    \fifo_count[0]_i_5 
       (.I0(sample_push_reg_n_0),
        .I1(\fifo_count[0]_i_3_n_0 ),
        .I2(pop_pulse_reg_n_0),
        .I3(fifo_count_reg[14]),
        .I4(fifo_count_reg[3]),
        .O(\fifo_count[0]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h002AFFD5)) 
    \fifo_count[0]_i_6 
       (.I0(sample_push_reg_n_0),
        .I1(\fifo_count[0]_i_3_n_0 ),
        .I2(pop_pulse_reg_n_0),
        .I3(fifo_count_reg[14]),
        .I4(fifo_count_reg[2]),
        .O(\fifo_count[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h002AFFD5)) 
    \fifo_count[0]_i_7 
       (.I0(sample_push_reg_n_0),
        .I1(\fifo_count[0]_i_3_n_0 ),
        .I2(pop_pulse_reg_n_0),
        .I3(fifo_count_reg[14]),
        .I4(fifo_count_reg[1]),
        .O(\fifo_count[0]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFD5502AA)) 
    \fifo_count[0]_i_8 
       (.I0(sample_push_reg_n_0),
        .I1(fifo_count_reg[14]),
        .I2(pop_pulse_reg_n_0),
        .I3(rd_ptr1),
        .I4(fifo_count_reg[0]),
        .O(\fifo_count[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \fifo_count[0]_i_9 
       (.I0(fifo_count_reg[7]),
        .I1(fifo_count_reg[6]),
        .I2(fifo_count_reg[9]),
        .I3(fifo_count_reg[8]),
        .O(\fifo_count[0]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'h00D5)) 
    \fifo_count[12]_i_2 
       (.I0(sample_push_reg_n_0),
        .I1(\fifo_count[0]_i_3_n_0 ),
        .I2(pop_pulse_reg_n_0),
        .I3(fifo_count_reg[14]),
        .O(\fifo_count[12]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h002AFFD5)) 
    \fifo_count[12]_i_3 
       (.I0(sample_push_reg_n_0),
        .I1(\fifo_count[0]_i_3_n_0 ),
        .I2(pop_pulse_reg_n_0),
        .I3(fifo_count_reg[14]),
        .I4(fifo_count_reg[13]),
        .O(\fifo_count[12]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h002AFFD5)) 
    \fifo_count[12]_i_4 
       (.I0(sample_push_reg_n_0),
        .I1(\fifo_count[0]_i_3_n_0 ),
        .I2(pop_pulse_reg_n_0),
        .I3(fifo_count_reg[14]),
        .I4(fifo_count_reg[12]),
        .O(\fifo_count[12]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h002AFFD5)) 
    \fifo_count[4]_i_2 
       (.I0(sample_push_reg_n_0),
        .I1(\fifo_count[0]_i_3_n_0 ),
        .I2(pop_pulse_reg_n_0),
        .I3(fifo_count_reg[14]),
        .I4(fifo_count_reg[7]),
        .O(\fifo_count[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h002AFFD5)) 
    \fifo_count[4]_i_3 
       (.I0(sample_push_reg_n_0),
        .I1(\fifo_count[0]_i_3_n_0 ),
        .I2(pop_pulse_reg_n_0),
        .I3(fifo_count_reg[14]),
        .I4(fifo_count_reg[6]),
        .O(\fifo_count[4]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h002AFFD5)) 
    \fifo_count[4]_i_4 
       (.I0(sample_push_reg_n_0),
        .I1(\fifo_count[0]_i_3_n_0 ),
        .I2(pop_pulse_reg_n_0),
        .I3(fifo_count_reg[14]),
        .I4(fifo_count_reg[5]),
        .O(\fifo_count[4]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h002AFFD5)) 
    \fifo_count[4]_i_5 
       (.I0(sample_push_reg_n_0),
        .I1(\fifo_count[0]_i_3_n_0 ),
        .I2(pop_pulse_reg_n_0),
        .I3(fifo_count_reg[14]),
        .I4(fifo_count_reg[4]),
        .O(\fifo_count[4]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h002AFFD5)) 
    \fifo_count[8]_i_2 
       (.I0(sample_push_reg_n_0),
        .I1(\fifo_count[0]_i_3_n_0 ),
        .I2(pop_pulse_reg_n_0),
        .I3(fifo_count_reg[14]),
        .I4(fifo_count_reg[11]),
        .O(\fifo_count[8]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h002AFFD5)) 
    \fifo_count[8]_i_3 
       (.I0(sample_push_reg_n_0),
        .I1(\fifo_count[0]_i_3_n_0 ),
        .I2(pop_pulse_reg_n_0),
        .I3(fifo_count_reg[14]),
        .I4(fifo_count_reg[10]),
        .O(\fifo_count[8]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h002AFFD5)) 
    \fifo_count[8]_i_4 
       (.I0(sample_push_reg_n_0),
        .I1(\fifo_count[0]_i_3_n_0 ),
        .I2(pop_pulse_reg_n_0),
        .I3(fifo_count_reg[14]),
        .I4(fifo_count_reg[9]),
        .O(\fifo_count[8]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h002AFFD5)) 
    \fifo_count[8]_i_5 
       (.I0(sample_push_reg_n_0),
        .I1(\fifo_count[0]_i_3_n_0 ),
        .I2(pop_pulse_reg_n_0),
        .I3(fifo_count_reg[14]),
        .I4(fifo_count_reg[8]),
        .O(\fifo_count[8]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fifo_count_reg[0] 
       (.C(s_axi_aclk),
        .CE(\fifo_count[0]_i_1_n_0 ),
        .D(\fifo_count_reg[0]_i_2_n_7 ),
        .Q(fifo_count_reg[0]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \fifo_count_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\fifo_count_reg[0]_i_2_n_0 ,\fifo_count_reg[0]_i_2_n_1 ,\fifo_count_reg[0]_i_2_n_2 ,\fifo_count_reg[0]_i_2_n_3 }),
        .CYINIT(\fifo_count[0]_i_4_n_0 ),
        .DI(fifo_count_reg[3:0]),
        .O({\fifo_count_reg[0]_i_2_n_4 ,\fifo_count_reg[0]_i_2_n_5 ,\fifo_count_reg[0]_i_2_n_6 ,\fifo_count_reg[0]_i_2_n_7 }),
        .S({\fifo_count[0]_i_5_n_0 ,\fifo_count[0]_i_6_n_0 ,\fifo_count[0]_i_7_n_0 ,\fifo_count[0]_i_8_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \fifo_count_reg[10] 
       (.C(s_axi_aclk),
        .CE(\fifo_count[0]_i_1_n_0 ),
        .D(\fifo_count_reg[8]_i_1_n_5 ),
        .Q(fifo_count_reg[10]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fifo_count_reg[11] 
       (.C(s_axi_aclk),
        .CE(\fifo_count[0]_i_1_n_0 ),
        .D(\fifo_count_reg[8]_i_1_n_4 ),
        .Q(fifo_count_reg[11]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fifo_count_reg[12] 
       (.C(s_axi_aclk),
        .CE(\fifo_count[0]_i_1_n_0 ),
        .D(\fifo_count_reg[12]_i_1_n_7 ),
        .Q(fifo_count_reg[12]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \fifo_count_reg[12]_i_1 
       (.CI(\fifo_count_reg[8]_i_1_n_0 ),
        .CO({\NLW_fifo_count_reg[12]_i_1_CO_UNCONNECTED [3:2],\fifo_count_reg[12]_i_1_n_2 ,\fifo_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,fifo_count_reg[13:12]}),
        .O({\NLW_fifo_count_reg[12]_i_1_O_UNCONNECTED [3],\fifo_count_reg[12]_i_1_n_5 ,\fifo_count_reg[12]_i_1_n_6 ,\fifo_count_reg[12]_i_1_n_7 }),
        .S({1'b0,\fifo_count[12]_i_2_n_0 ,\fifo_count[12]_i_3_n_0 ,\fifo_count[12]_i_4_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \fifo_count_reg[13] 
       (.C(s_axi_aclk),
        .CE(\fifo_count[0]_i_1_n_0 ),
        .D(\fifo_count_reg[12]_i_1_n_6 ),
        .Q(fifo_count_reg[13]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fifo_count_reg[14] 
       (.C(s_axi_aclk),
        .CE(\fifo_count[0]_i_1_n_0 ),
        .D(\fifo_count_reg[12]_i_1_n_5 ),
        .Q(fifo_count_reg[14]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fifo_count_reg[1] 
       (.C(s_axi_aclk),
        .CE(\fifo_count[0]_i_1_n_0 ),
        .D(\fifo_count_reg[0]_i_2_n_6 ),
        .Q(fifo_count_reg[1]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fifo_count_reg[2] 
       (.C(s_axi_aclk),
        .CE(\fifo_count[0]_i_1_n_0 ),
        .D(\fifo_count_reg[0]_i_2_n_5 ),
        .Q(fifo_count_reg[2]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fifo_count_reg[3] 
       (.C(s_axi_aclk),
        .CE(\fifo_count[0]_i_1_n_0 ),
        .D(\fifo_count_reg[0]_i_2_n_4 ),
        .Q(fifo_count_reg[3]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fifo_count_reg[4] 
       (.C(s_axi_aclk),
        .CE(\fifo_count[0]_i_1_n_0 ),
        .D(\fifo_count_reg[4]_i_1_n_7 ),
        .Q(fifo_count_reg[4]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \fifo_count_reg[4]_i_1 
       (.CI(\fifo_count_reg[0]_i_2_n_0 ),
        .CO({\fifo_count_reg[4]_i_1_n_0 ,\fifo_count_reg[4]_i_1_n_1 ,\fifo_count_reg[4]_i_1_n_2 ,\fifo_count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(fifo_count_reg[7:4]),
        .O({\fifo_count_reg[4]_i_1_n_4 ,\fifo_count_reg[4]_i_1_n_5 ,\fifo_count_reg[4]_i_1_n_6 ,\fifo_count_reg[4]_i_1_n_7 }),
        .S({\fifo_count[4]_i_2_n_0 ,\fifo_count[4]_i_3_n_0 ,\fifo_count[4]_i_4_n_0 ,\fifo_count[4]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \fifo_count_reg[5] 
       (.C(s_axi_aclk),
        .CE(\fifo_count[0]_i_1_n_0 ),
        .D(\fifo_count_reg[4]_i_1_n_6 ),
        .Q(fifo_count_reg[5]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fifo_count_reg[6] 
       (.C(s_axi_aclk),
        .CE(\fifo_count[0]_i_1_n_0 ),
        .D(\fifo_count_reg[4]_i_1_n_5 ),
        .Q(fifo_count_reg[6]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fifo_count_reg[7] 
       (.C(s_axi_aclk),
        .CE(\fifo_count[0]_i_1_n_0 ),
        .D(\fifo_count_reg[4]_i_1_n_4 ),
        .Q(fifo_count_reg[7]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fifo_count_reg[8] 
       (.C(s_axi_aclk),
        .CE(\fifo_count[0]_i_1_n_0 ),
        .D(\fifo_count_reg[8]_i_1_n_7 ),
        .Q(fifo_count_reg[8]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \fifo_count_reg[8]_i_1 
       (.CI(\fifo_count_reg[4]_i_1_n_0 ),
        .CO({\fifo_count_reg[8]_i_1_n_0 ,\fifo_count_reg[8]_i_1_n_1 ,\fifo_count_reg[8]_i_1_n_2 ,\fifo_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(fifo_count_reg[11:8]),
        .O({\fifo_count_reg[8]_i_1_n_4 ,\fifo_count_reg[8]_i_1_n_5 ,\fifo_count_reg[8]_i_1_n_6 ,\fifo_count_reg[8]_i_1_n_7 }),
        .S({\fifo_count[8]_i_2_n_0 ,\fifo_count[8]_i_3_n_0 ,\fifo_count[8]_i_4_n_0 ,\fifo_count[8]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \fifo_count_reg[9] 
       (.C(s_axi_aclk),
        .CE(\fifo_count[0]_i_1_n_0 ),
        .D(\fifo_count_reg[8]_i_1_n_6 ),
        .Q(fifo_count_reg[9]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "262144" *) 
  (* RTL_RAM_NAME = "system_axi_i2s_rx_0_0/U0/fifo_ram_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "16383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "1" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(2),
    .READ_WIDTH_B(2),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(2),
    .WRITE_WIDTH_B(2)) 
    fifo_ram_reg_0
       (.ADDRARDADDR({1'b1,wr_ptr_reg,1'b0}),
        .ADDRBWRADDR({1'b1,rd_ptr,1'b0}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_fifo_ram_reg_0_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_fifo_ram_reg_0_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(s_axi_aclk),
        .CLKBWRCLK(s_axi_aclk),
        .DBITERR(NLW_fifo_ram_reg_0_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,sample_data[1:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(NLW_fifo_ram_reg_0_DOADO_UNCONNECTED[31:0]),
        .DOBDO({NLW_fifo_ram_reg_0_DOBDO_UNCONNECTED[31:2],ram_rdata[1:0]}),
        .DOPADOP(NLW_fifo_ram_reg_0_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_fifo_ram_reg_0_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_fifo_ram_reg_0_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(fifo_ram_reg_0_i_1_n_0),
        .ENBWREN(1'b1),
        .INJECTDBITERR(NLW_fifo_ram_reg_0_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_fifo_ram_reg_0_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_fifo_ram_reg_0_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_fifo_ram_reg_0_SBITERR_UNCONNECTED),
        .WEA({fifo_ram_reg_0_i_2_n_0,fifo_ram_reg_0_i_2_n_0,fifo_ram_reg_0_i_2_n_0,fifo_ram_reg_0_i_2_n_0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT2 #(
    .INIT(4'h2)) 
    fifo_ram_reg_0_i_1
       (.I0(sample_push_reg_n_0),
        .I1(fifo_count_reg[14]),
        .O(fifo_ram_reg_0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_ram_reg_0_i_2
       (.I0(fifo_clr),
        .O(fifo_ram_reg_0_i_2_n_0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "262144" *) 
  (* RTL_RAM_NAME = "system_axi_i2s_rx_0_0/U0/fifo_ram_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "16383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "2" *) 
  (* ram_slice_end = "3" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(2),
    .READ_WIDTH_B(2),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(2),
    .WRITE_WIDTH_B(2)) 
    fifo_ram_reg_1
       (.ADDRARDADDR({1'b1,wr_ptr_reg,1'b0}),
        .ADDRBWRADDR({1'b1,rd_ptr,1'b0}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_fifo_ram_reg_1_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_fifo_ram_reg_1_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(s_axi_aclk),
        .CLKBWRCLK(s_axi_aclk),
        .DBITERR(NLW_fifo_ram_reg_1_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,sample_data[3:2]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(NLW_fifo_ram_reg_1_DOADO_UNCONNECTED[31:0]),
        .DOBDO({NLW_fifo_ram_reg_1_DOBDO_UNCONNECTED[31:2],ram_rdata[3:2]}),
        .DOPADOP(NLW_fifo_ram_reg_1_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_fifo_ram_reg_1_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_fifo_ram_reg_1_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(fifo_ram_reg_0_i_1_n_0),
        .ENBWREN(1'b1),
        .INJECTDBITERR(NLW_fifo_ram_reg_1_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_fifo_ram_reg_1_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_fifo_ram_reg_1_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_fifo_ram_reg_1_SBITERR_UNCONNECTED),
        .WEA({fifo_ram_reg_0_i_2_n_0,fifo_ram_reg_0_i_2_n_0,fifo_ram_reg_0_i_2_n_0,fifo_ram_reg_0_i_2_n_0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "262144" *) 
  (* RTL_RAM_NAME = "system_axi_i2s_rx_0_0/U0/fifo_ram_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "16383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "4" *) 
  (* ram_slice_end = "5" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(2),
    .READ_WIDTH_B(2),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(2),
    .WRITE_WIDTH_B(2)) 
    fifo_ram_reg_2
       (.ADDRARDADDR({1'b1,wr_ptr_reg,1'b0}),
        .ADDRBWRADDR({1'b1,rd_ptr,1'b0}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_fifo_ram_reg_2_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_fifo_ram_reg_2_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(s_axi_aclk),
        .CLKBWRCLK(s_axi_aclk),
        .DBITERR(NLW_fifo_ram_reg_2_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,sample_data[5:4]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(NLW_fifo_ram_reg_2_DOADO_UNCONNECTED[31:0]),
        .DOBDO({NLW_fifo_ram_reg_2_DOBDO_UNCONNECTED[31:2],ram_rdata[5:4]}),
        .DOPADOP(NLW_fifo_ram_reg_2_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_fifo_ram_reg_2_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_fifo_ram_reg_2_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(fifo_ram_reg_0_i_1_n_0),
        .ENBWREN(1'b1),
        .INJECTDBITERR(NLW_fifo_ram_reg_2_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_fifo_ram_reg_2_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_fifo_ram_reg_2_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_fifo_ram_reg_2_SBITERR_UNCONNECTED),
        .WEA({fifo_ram_reg_2_i_1_n_0,fifo_ram_reg_2_i_1_n_0,fifo_ram_reg_0_i_2_n_0,fifo_ram_reg_0_i_2_n_0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_ram_reg_2_i_1
       (.I0(fifo_clr),
        .O(fifo_ram_reg_2_i_1_n_0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "262144" *) 
  (* RTL_RAM_NAME = "system_axi_i2s_rx_0_0/U0/fifo_ram_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "16383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "7" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(2),
    .READ_WIDTH_B(2),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(2),
    .WRITE_WIDTH_B(2)) 
    fifo_ram_reg_3
       (.ADDRARDADDR({1'b1,wr_ptr_reg,1'b0}),
        .ADDRBWRADDR({1'b1,rd_ptr,1'b0}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_fifo_ram_reg_3_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_fifo_ram_reg_3_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(s_axi_aclk),
        .CLKBWRCLK(s_axi_aclk),
        .DBITERR(NLW_fifo_ram_reg_3_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,sample_data[7:6]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(NLW_fifo_ram_reg_3_DOADO_UNCONNECTED[31:0]),
        .DOBDO({NLW_fifo_ram_reg_3_DOBDO_UNCONNECTED[31:2],ram_rdata[7:6]}),
        .DOPADOP(NLW_fifo_ram_reg_3_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_fifo_ram_reg_3_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_fifo_ram_reg_3_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(fifo_ram_reg_0_i_1_n_0),
        .ENBWREN(1'b1),
        .INJECTDBITERR(NLW_fifo_ram_reg_3_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_fifo_ram_reg_3_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_fifo_ram_reg_3_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_fifo_ram_reg_3_SBITERR_UNCONNECTED),
        .WEA({fifo_ram_reg_2_i_1_n_0,fifo_ram_reg_2_i_1_n_0,fifo_ram_reg_2_i_1_n_0,fifo_ram_reg_2_i_1_n_0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "262144" *) 
  (* RTL_RAM_NAME = "system_axi_i2s_rx_0_0/U0/fifo_ram_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "16383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "8" *) 
  (* ram_slice_end = "9" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(2),
    .READ_WIDTH_B(2),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(2),
    .WRITE_WIDTH_B(2)) 
    fifo_ram_reg_4
       (.ADDRARDADDR({1'b1,wr_ptr_reg,1'b0}),
        .ADDRBWRADDR({1'b1,rd_ptr,1'b0}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_fifo_ram_reg_4_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_fifo_ram_reg_4_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(s_axi_aclk),
        .CLKBWRCLK(s_axi_aclk),
        .DBITERR(NLW_fifo_ram_reg_4_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,sample_data[9:8]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(NLW_fifo_ram_reg_4_DOADO_UNCONNECTED[31:0]),
        .DOBDO({NLW_fifo_ram_reg_4_DOBDO_UNCONNECTED[31:2],ram_rdata[9:8]}),
        .DOPADOP(NLW_fifo_ram_reg_4_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_fifo_ram_reg_4_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_fifo_ram_reg_4_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(fifo_ram_reg_0_i_1_n_0),
        .ENBWREN(1'b1),
        .INJECTDBITERR(NLW_fifo_ram_reg_4_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_fifo_ram_reg_4_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_fifo_ram_reg_4_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_fifo_ram_reg_4_SBITERR_UNCONNECTED),
        .WEA({fifo_ram_reg_2_i_1_n_0,fifo_ram_reg_2_i_1_n_0,fifo_ram_reg_2_i_1_n_0,fifo_ram_reg_2_i_1_n_0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "262144" *) 
  (* RTL_RAM_NAME = "system_axi_i2s_rx_0_0/U0/fifo_ram_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "16383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "10" *) 
  (* ram_slice_end = "11" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(2),
    .READ_WIDTH_B(2),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(2),
    .WRITE_WIDTH_B(2)) 
    fifo_ram_reg_5
       (.ADDRARDADDR({1'b1,wr_ptr_reg,1'b0}),
        .ADDRBWRADDR({1'b1,rd_ptr,1'b0}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_fifo_ram_reg_5_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_fifo_ram_reg_5_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(s_axi_aclk),
        .CLKBWRCLK(s_axi_aclk),
        .DBITERR(NLW_fifo_ram_reg_5_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,sample_data[11:10]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(NLW_fifo_ram_reg_5_DOADO_UNCONNECTED[31:0]),
        .DOBDO({NLW_fifo_ram_reg_5_DOBDO_UNCONNECTED[31:2],ram_rdata[11:10]}),
        .DOPADOP(NLW_fifo_ram_reg_5_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_fifo_ram_reg_5_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_fifo_ram_reg_5_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(fifo_ram_reg_0_i_1_n_0),
        .ENBWREN(1'b1),
        .INJECTDBITERR(NLW_fifo_ram_reg_5_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_fifo_ram_reg_5_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_fifo_ram_reg_5_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_fifo_ram_reg_5_SBITERR_UNCONNECTED),
        .WEA({fifo_ram_reg_5_i_1_n_0,fifo_ram_reg_5_i_1_n_0,fifo_ram_reg_5_i_1_n_0,fifo_ram_reg_5_i_1_n_0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_ram_reg_5_i_1
       (.I0(fifo_clr),
        .O(fifo_ram_reg_5_i_1_n_0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "262144" *) 
  (* RTL_RAM_NAME = "system_axi_i2s_rx_0_0/U0/fifo_ram_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "16383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "13" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(2),
    .READ_WIDTH_B(2),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(2),
    .WRITE_WIDTH_B(2)) 
    fifo_ram_reg_6
       (.ADDRARDADDR({1'b1,wr_ptr_reg,1'b0}),
        .ADDRBWRADDR({1'b1,rd_ptr,1'b0}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_fifo_ram_reg_6_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_fifo_ram_reg_6_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(s_axi_aclk),
        .CLKBWRCLK(s_axi_aclk),
        .DBITERR(NLW_fifo_ram_reg_6_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,sample_data[13:12]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(NLW_fifo_ram_reg_6_DOADO_UNCONNECTED[31:0]),
        .DOBDO({NLW_fifo_ram_reg_6_DOBDO_UNCONNECTED[31:2],ram_rdata[13:12]}),
        .DOPADOP(NLW_fifo_ram_reg_6_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_fifo_ram_reg_6_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_fifo_ram_reg_6_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(fifo_ram_reg_0_i_1_n_0),
        .ENBWREN(1'b1),
        .INJECTDBITERR(NLW_fifo_ram_reg_6_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_fifo_ram_reg_6_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_fifo_ram_reg_6_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_fifo_ram_reg_6_SBITERR_UNCONNECTED),
        .WEA({fifo_ram_reg_5_i_1_n_0,fifo_ram_reg_5_i_1_n_0,fifo_ram_reg_5_i_1_n_0,fifo_ram_reg_5_i_1_n_0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "262144" *) 
  (* RTL_RAM_NAME = "system_axi_i2s_rx_0_0/U0/fifo_ram_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "16383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "14" *) 
  (* ram_slice_end = "15" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(2),
    .READ_WIDTH_B(2),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(2),
    .WRITE_WIDTH_B(2)) 
    fifo_ram_reg_7
       (.ADDRARDADDR({1'b1,wr_ptr_reg,1'b0}),
        .ADDRBWRADDR({1'b1,rd_ptr,1'b0}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_fifo_ram_reg_7_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_fifo_ram_reg_7_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(s_axi_aclk),
        .CLKBWRCLK(s_axi_aclk),
        .DBITERR(NLW_fifo_ram_reg_7_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,sample_data[15:14]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(NLW_fifo_ram_reg_7_DOADO_UNCONNECTED[31:0]),
        .DOBDO({NLW_fifo_ram_reg_7_DOBDO_UNCONNECTED[31:2],ram_rdata[15:14]}),
        .DOPADOP(NLW_fifo_ram_reg_7_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_fifo_ram_reg_7_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_fifo_ram_reg_7_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(fifo_ram_reg_0_i_1_n_0),
        .ENBWREN(1'b1),
        .INJECTDBITERR(NLW_fifo_ram_reg_7_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_fifo_ram_reg_7_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_fifo_ram_reg_7_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_fifo_ram_reg_7_SBITERR_UNCONNECTED),
        .WEA({fifo_ram_reg_7_i_1_n_0,fifo_ram_reg_7_i_1_n_0,fifo_ram_reg_5_i_1_n_0,fifo_ram_reg_5_i_1_n_0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_ram_reg_7_i_1
       (.I0(fifo_clr),
        .O(fifo_ram_reg_7_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i2s_en_i_1
       (.I0(\wdata_reg_reg_n_0_[0] ),
        .I1(i2s_en),
        .I2(p_2_in),
        .O(i2s_en_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    i2s_en_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i2s_en_i_1_n_0),
        .Q(p_2_in),
        .R(bvalid_r_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_1
       (.I0(nco_acc[6]),
        .O(i__carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_2
       (.I0(nco_acc[5]),
        .O(i__carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_1
       (.I0(nco_acc[11]),
        .O(i__carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_2
       (.I0(nco_acc[10]),
        .O(i__carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_3
       (.I0(nco_acc[8]),
        .O(i__carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_1
       (.I0(nco_acc[13]),
        .O(i__carry__2_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__3_i_1
       (.I0(nco_acc[19]),
        .O(i__carry__3_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__3_i_2
       (.I0(nco_acc[18]),
        .O(i__carry__3_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__3_i_3
       (.I0(nco_acc[17]),
        .O(i__carry__3_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__4_i_1
       (.I0(nco_acc[21]),
        .O(i__carry__4_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__4_i_2
       (.I0(nco_acc[20]),
        .O(i__carry__4_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__5_i_1
       (.I0(nco_acc[26]),
        .O(i__carry__5_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__5_i_2
       (.I0(nco_acc[24]),
        .O(i__carry__5_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_1
       (.I0(nco_acc[1]),
        .O(i__carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    \leds_reg[3]_i_1 
       (.I0(\leds_reg[3]_i_2_n_0 ),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in0),
        .I4(p_0_in[2]),
        .I5(fifo_clr1),
        .O(leds_reg));
  LUT2 #(
    .INIT(4'h1)) 
    \leds_reg[3]_i_2 
       (.I0(\awaddr_reg_reg_n_0_[6] ),
        .I1(\awaddr_reg_reg_n_0_[7] ),
        .O(\leds_reg[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \leds_reg[3]_i_3 
       (.I0(bvalid_r_reg_0),
        .I1(w_latched_reg_n_0),
        .I2(aw_latched_reg_n_0),
        .O(fifo_clr1));
  FDRE #(
    .INIT(1'b0)) 
    \leds_reg_reg[0] 
       (.C(s_axi_aclk),
        .CE(leds_reg),
        .D(\wdata_reg_reg_n_0_[0] ),
        .Q(leds_o[0]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \leds_reg_reg[1] 
       (.C(s_axi_aclk),
        .CE(leds_reg),
        .D(\wdata_reg_reg_n_0_[1] ),
        .Q(leds_o[1]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \leds_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(leds_reg),
        .D(p_1_in),
        .Q(leds_o[2]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \leds_reg_reg[3] 
       (.C(s_axi_aclk),
        .CE(leds_reg),
        .D(\wdata_reg_reg_n_0_[3] ),
        .Q(leds_o[3]),
        .R(bvalid_r_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    lora_trig_r_i_1
       (.I0(p_1_in),
        .I1(i2s_en),
        .I2(lora_trig_o),
        .O(lora_trig_r_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    lora_trig_r_i_2
       (.I0(\leds_reg[3]_i_2_n_0 ),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in0),
        .I4(p_0_in[2]),
        .I5(fifo_clr1),
        .O(i2s_en));
  FDRE #(
    .INIT(1'b0)) 
    lora_trig_r_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(lora_trig_r_i_1_n_0),
        .Q(lora_trig_o),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__1_n_5 ),
        .Q(nco_acc[10]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__1_n_4 ),
        .Q(nco_acc[11]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__2_n_7 ),
        .Q(nco_acc[12]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__2_n_6 ),
        .Q(nco_acc[13]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__2_n_5 ),
        .Q(nco_acc[14]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__2_n_4 ),
        .Q(nco_acc[15]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[16] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__3_n_7 ),
        .Q(nco_acc[16]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[17] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__3_n_6 ),
        .Q(nco_acc[17]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[18] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__3_n_5 ),
        .Q(nco_acc[18]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[19] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__3_n_4 ),
        .Q(nco_acc[19]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry_n_6 ),
        .Q(nco_acc[1]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[20] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__4_n_7 ),
        .Q(nco_acc[20]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[21] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__4_n_6 ),
        .Q(nco_acc[21]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[22] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__4_n_5 ),
        .Q(nco_acc[22]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[23] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__4_n_4 ),
        .Q(nco_acc[23]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[24] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__5_n_7 ),
        .Q(nco_acc[24]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[25] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__5_n_6 ),
        .Q(nco_acc[25]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[26] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__5_n_5 ),
        .Q(nco_acc[26]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[27] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__5_n_4 ),
        .Q(nco_acc[27]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[28] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__6_n_7 ),
        .Q(nco_acc[28]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[29] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__6_n_6 ),
        .Q(nco_acc[29]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry_n_5 ),
        .Q(nco_acc[2]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[30] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__6_n_5 ),
        .Q(nco_acc[30]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[31] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__6_n_4 ),
        .Q(nco_acc[31]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry_n_4 ),
        .Q(nco_acc[3]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__0_n_7 ),
        .Q(nco_acc[4]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__0_n_6 ),
        .Q(nco_acc[5]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__0_n_5 ),
        .Q(nco_acc[6]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__0_n_4 ),
        .Q(nco_acc[7]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__1_n_7 ),
        .Q(nco_acc[8]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \nco_acc_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\sample_push1_inferred__0/i__carry__1_n_6 ),
        .Q(nco_acc[9]),
        .R(sample_push0));
  LUT6 #(
    .INIT(64'h00000000AAEA0000)) 
    overrun_reg_i_1
       (.I0(overrun_reg),
        .I1(fifo_count_reg[14]),
        .I2(sample_push_reg_n_0),
        .I3(\fifo_count[0]_i_3_n_0 ),
        .I4(s_axi_aresetn),
        .I5(fifo_clr),
        .O(overrun_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    overrun_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(overrun_reg_i_1_n_0),
        .Q(overrun_reg),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFF7F8000)) 
    pop_nonempty_i_1
       (.I0(pop_pulse_i_2_n_0),
        .I1(s_axi_arvalid),
        .I2(\FSM_onehot_rd_state_reg_n_0_[0] ),
        .I3(rd_ptr1),
        .I4(pop_nonempty),
        .O(pop_nonempty_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    pop_nonempty_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(pop_nonempty_i_1_n_0),
        .Q(pop_nonempty),
        .R(bvalid_r_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    pop_pulse_i_1
       (.I0(pop_pulse_i_2_n_0),
        .I1(s_axi_arvalid),
        .I2(\FSM_onehot_rd_state_reg_n_0_[0] ),
        .I3(rd_ptr1),
        .O(pop_pulse_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000001000)) 
    pop_pulse_i_2
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(s_axi_araddr[5]),
        .I5(s_axi_araddr[4]),
        .O(pop_pulse_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    pop_pulse_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(pop_pulse_i_1_n_0),
        .Q(pop_pulse_reg_n_0),
        .R(bvalid_r_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \rd_ptr[0]_i_2 
       (.I0(rd_ptr_reg[0]),
        .O(\rd_ptr[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[0] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg[0]_i_1_n_7 ),
        .Q(rd_ptr_reg[0]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rd_ptr_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\rd_ptr_reg[0]_i_1_n_0 ,\rd_ptr_reg[0]_i_1_n_1 ,\rd_ptr_reg[0]_i_1_n_2 ,\rd_ptr_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\rd_ptr_reg[0]_i_1_n_4 ,\rd_ptr_reg[0]_i_1_n_5 ,\rd_ptr_reg[0]_i_1_n_6 ,\rd_ptr_reg[0]_i_1_n_7 }),
        .S({rd_ptr_reg[3:1],\rd_ptr[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[10] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg[8]_i_1_n_5 ),
        .Q(rd_ptr_reg[10]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[11] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg[8]_i_1_n_4 ),
        .Q(rd_ptr_reg[11]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[12] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg[12]_i_1_n_7 ),
        .Q(rd_ptr_reg[12]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rd_ptr_reg[12]_i_1 
       (.CI(\rd_ptr_reg[8]_i_1_n_0 ),
        .CO({\NLW_rd_ptr_reg[12]_i_1_CO_UNCONNECTED [3:1],\rd_ptr_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_rd_ptr_reg[12]_i_1_O_UNCONNECTED [3:2],\rd_ptr_reg[12]_i_1_n_6 ,\rd_ptr_reg[12]_i_1_n_7 }),
        .S({1'b0,1'b0,rd_ptr_reg[13:12]}));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[13] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg[12]_i_1_n_6 ),
        .Q(rd_ptr_reg[13]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[1] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg[0]_i_1_n_6 ),
        .Q(rd_ptr_reg[1]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[2] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg[0]_i_1_n_5 ),
        .Q(rd_ptr_reg[2]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[3] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg[0]_i_1_n_4 ),
        .Q(rd_ptr_reg[3]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[4] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg[4]_i_1_n_7 ),
        .Q(rd_ptr_reg[4]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rd_ptr_reg[4]_i_1 
       (.CI(\rd_ptr_reg[0]_i_1_n_0 ),
        .CO({\rd_ptr_reg[4]_i_1_n_0 ,\rd_ptr_reg[4]_i_1_n_1 ,\rd_ptr_reg[4]_i_1_n_2 ,\rd_ptr_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rd_ptr_reg[4]_i_1_n_4 ,\rd_ptr_reg[4]_i_1_n_5 ,\rd_ptr_reg[4]_i_1_n_6 ,\rd_ptr_reg[4]_i_1_n_7 }),
        .S(rd_ptr_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[5] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg[4]_i_1_n_6 ),
        .Q(rd_ptr_reg[5]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[6] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg[4]_i_1_n_5 ),
        .Q(rd_ptr_reg[6]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[7] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg[4]_i_1_n_4 ),
        .Q(rd_ptr_reg[7]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[8] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg[8]_i_1_n_7 ),
        .Q(rd_ptr_reg[8]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rd_ptr_reg[8]_i_1 
       (.CI(\rd_ptr_reg[4]_i_1_n_0 ),
        .CO({\rd_ptr_reg[8]_i_1_n_0 ,\rd_ptr_reg[8]_i_1_n_1 ,\rd_ptr_reg[8]_i_1_n_2 ,\rd_ptr_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rd_ptr_reg[8]_i_1_n_4 ,\rd_ptr_reg[8]_i_1_n_5 ,\rd_ptr_reg[8]_i_1_n_6 ,\rd_ptr_reg[8]_i_1_n_7 }),
        .S(rd_ptr_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[9] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg[8]_i_1_n_6 ),
        .Q(rd_ptr_reg[9]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[0] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_rep[0]_i_1_n_0 ),
        .Q(rd_ptr[0]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[10] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg_rep[12]_i_1_n_6 ),
        .Q(rd_ptr[10]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[11] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg_rep[12]_i_1_n_5 ),
        .Q(rd_ptr[11]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[12] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg_rep[12]_i_1_n_4 ),
        .Q(rd_ptr[12]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rd_ptr_reg_rep[12]_i_1 
       (.CI(\rd_ptr_reg_rep[8]_i_1_n_0 ),
        .CO({\rd_ptr_reg_rep[12]_i_1_n_0 ,\rd_ptr_reg_rep[12]_i_1_n_1 ,\rd_ptr_reg_rep[12]_i_1_n_2 ,\rd_ptr_reg_rep[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rd_ptr_reg_rep[12]_i_1_n_4 ,\rd_ptr_reg_rep[12]_i_1_n_5 ,\rd_ptr_reg_rep[12]_i_1_n_6 ,\rd_ptr_reg_rep[12]_i_1_n_7 }),
        .S(rd_ptr_reg[12:9]));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[13] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg_rep[13]_i_3_n_7 ),
        .Q(rd_ptr[13]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rd_ptr_reg_rep[13]_i_3 
       (.CI(\rd_ptr_reg_rep[12]_i_1_n_0 ),
        .CO(\NLW_rd_ptr_reg_rep[13]_i_3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_rd_ptr_reg_rep[13]_i_3_O_UNCONNECTED [3:1],\rd_ptr_reg_rep[13]_i_3_n_7 }),
        .S({1'b0,1'b0,1'b0,rd_ptr_reg[13]}));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[1] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg_rep[4]_i_1_n_7 ),
        .Q(rd_ptr[1]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[2] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg_rep[4]_i_1_n_6 ),
        .Q(rd_ptr[2]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[3] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg_rep[4]_i_1_n_5 ),
        .Q(rd_ptr[3]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[4] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg_rep[4]_i_1_n_4 ),
        .Q(rd_ptr[4]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rd_ptr_reg_rep[4]_i_1 
       (.CI(1'b0),
        .CO({\rd_ptr_reg_rep[4]_i_1_n_0 ,\rd_ptr_reg_rep[4]_i_1_n_1 ,\rd_ptr_reg_rep[4]_i_1_n_2 ,\rd_ptr_reg_rep[4]_i_1_n_3 }),
        .CYINIT(rd_ptr_reg[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rd_ptr_reg_rep[4]_i_1_n_4 ,\rd_ptr_reg_rep[4]_i_1_n_5 ,\rd_ptr_reg_rep[4]_i_1_n_6 ,\rd_ptr_reg_rep[4]_i_1_n_7 }),
        .S(rd_ptr_reg[4:1]));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[5] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg_rep[8]_i_1_n_7 ),
        .Q(rd_ptr[5]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[6] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg_rep[8]_i_1_n_6 ),
        .Q(rd_ptr[6]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[7] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg_rep[8]_i_1_n_5 ),
        .Q(rd_ptr[7]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[8] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg_rep[8]_i_1_n_4 ),
        .Q(rd_ptr[8]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rd_ptr_reg_rep[8]_i_1 
       (.CI(\rd_ptr_reg_rep[4]_i_1_n_0 ),
        .CO({\rd_ptr_reg_rep[8]_i_1_n_0 ,\rd_ptr_reg_rep[8]_i_1_n_1 ,\rd_ptr_reg_rep[8]_i_1_n_2 ,\rd_ptr_reg_rep[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rd_ptr_reg_rep[8]_i_1_n_4 ,\rd_ptr_reg_rep[8]_i_1_n_5 ,\rd_ptr_reg_rep[8]_i_1_n_6 ,\rd_ptr_reg_rep[8]_i_1_n_7 }),
        .S(rd_ptr_reg[8:5]));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[9] 
       (.C(s_axi_aclk),
        .CE(p_19_in),
        .D(\rd_ptr_reg_rep[12]_i_1_n_7 ),
        .Q(rd_ptr[9]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rd_ptr_rep[0]_i_1 
       (.I0(rd_ptr_reg[0]),
        .O(\rd_ptr_rep[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \rd_ptr_rep[13]_i_1 
       (.I0(fifo_clr),
        .I1(s_axi_aresetn),
        .O(\rd_ptr_rep[13]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_ptr_rep[13]_i_2 
       (.I0(rd_ptr1),
        .I1(pop_pulse_reg_n_0),
        .O(p_19_in));
  LUT6 #(
    .INIT(64'hFFFFFEEEFEEEFEEE)) 
    \rdata_r[0]_i_1 
       (.I0(\rdata_r[0]_i_2_n_0 ),
        .I1(\rdata_r[0]_i_3_n_0 ),
        .I2(\rdata_r[31]_i_2_n_0 ),
        .I3(total_cnt_reg[0]),
        .I4(ram_rdata[0]),
        .I5(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEEFC0000EE300000)) 
    \rdata_r[0]_i_2 
       (.I0(overrun_reg),
        .I1(sel0[2]),
        .I2(p_2_in),
        .I3(sel0[0]),
        .I4(\rdata_r[1]_i_3_n_0 ),
        .I5(leds_o[0]),
        .O(\rdata_r[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rdata_r[0]_i_3 
       (.I0(\rdata_r[14]_i_2_n_0 ),
        .I1(fifo_count_reg[0]),
        .O(\rdata_r[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata_r[10]_i_1 
       (.I0(\rdata_r[14]_i_2_n_0 ),
        .I1(fifo_count_reg[10]),
        .I2(\rdata_r[31]_i_2_n_0 ),
        .I3(total_cnt_reg[10]),
        .I4(ram_rdata[10]),
        .I5(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata_r[11]_i_1 
       (.I0(\rdata_r[14]_i_2_n_0 ),
        .I1(fifo_count_reg[11]),
        .I2(\rdata_r[31]_i_2_n_0 ),
        .I3(total_cnt_reg[11]),
        .I4(ram_rdata[11]),
        .I5(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata_r[12]_i_1 
       (.I0(\rdata_r[14]_i_2_n_0 ),
        .I1(fifo_count_reg[12]),
        .I2(\rdata_r[31]_i_2_n_0 ),
        .I3(total_cnt_reg[12]),
        .I4(ram_rdata[12]),
        .I5(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata_r[13]_i_1 
       (.I0(\rdata_r[14]_i_2_n_0 ),
        .I1(fifo_count_reg[13]),
        .I2(\rdata_r[31]_i_2_n_0 ),
        .I3(total_cnt_reg[13]),
        .I4(ram_rdata[13]),
        .I5(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata_r[14]_i_1 
       (.I0(\rdata_r[14]_i_2_n_0 ),
        .I1(fifo_count_reg[14]),
        .I2(\rdata_r[31]_i_2_n_0 ),
        .I3(total_cnt_reg[14]),
        .I4(ram_rdata[14]),
        .I5(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata_r[14]_i_2 
       (.I0(sel0[0]),
        .I1(\araddr_reg_reg_n_0_[7] ),
        .I2(\araddr_reg_reg_n_0_[5] ),
        .I3(\araddr_reg_reg_n_0_[6] ),
        .I4(sel0[1]),
        .I5(sel0[2]),
        .O(\rdata_r[14]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \rdata_r[15]_i_1 
       (.I0(total_cnt_reg[15]),
        .I1(\rdata_r[31]_i_2_n_0 ),
        .I2(ram_rdata[15]),
        .I3(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \rdata_r[16]_i_1 
       (.I0(total_cnt_reg[16]),
        .I1(\rdata_r[31]_i_2_n_0 ),
        .I2(\rdata_r[28]_i_2_n_0 ),
        .O(\rdata_r[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \rdata_r[17]_i_1 
       (.I0(total_cnt_reg[17]),
        .I1(\rdata_r[31]_i_2_n_0 ),
        .I2(ram_rdata[15]),
        .I3(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \rdata_r[18]_i_1 
       (.I0(total_cnt_reg[18]),
        .I1(\rdata_r[31]_i_2_n_0 ),
        .I2(\rdata_r[28]_i_2_n_0 ),
        .O(\rdata_r[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \rdata_r[19]_i_1 
       (.I0(total_cnt_reg[19]),
        .I1(\rdata_r[31]_i_2_n_0 ),
        .I2(ram_rdata[15]),
        .I3(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAEAAAAABBEAAAAA)) 
    \rdata_r[1]_i_1 
       (.I0(\rdata_r[1]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(leds_o[1]),
        .I3(sel0[0]),
        .I4(\rdata_r[1]_i_3_n_0 ),
        .I5(rd_ptr1),
        .O(\rdata_r[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata_r[1]_i_2 
       (.I0(\rdata_r[14]_i_2_n_0 ),
        .I1(fifo_count_reg[1]),
        .I2(\rdata_r[31]_i_2_n_0 ),
        .I3(total_cnt_reg[1]),
        .I4(ram_rdata[1]),
        .I5(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \rdata_r[1]_i_3 
       (.I0(\araddr_reg_reg_n_0_[7] ),
        .I1(\araddr_reg_reg_n_0_[5] ),
        .I2(\araddr_reg_reg_n_0_[6] ),
        .I3(sel0[1]),
        .O(\rdata_r[1]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \rdata_r[1]_i_4 
       (.I0(\fifo_count[0]_i_3_n_0 ),
        .I1(fifo_count_reg[14]),
        .O(rd_ptr1));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \rdata_r[20]_i_1 
       (.I0(total_cnt_reg[20]),
        .I1(\rdata_r[31]_i_2_n_0 ),
        .I2(ram_rdata[15]),
        .I3(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \rdata_r[21]_i_1 
       (.I0(total_cnt_reg[21]),
        .I1(\rdata_r[31]_i_2_n_0 ),
        .I2(\rdata_r[28]_i_2_n_0 ),
        .O(\rdata_r[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \rdata_r[22]_i_1 
       (.I0(total_cnt_reg[22]),
        .I1(\rdata_r[31]_i_2_n_0 ),
        .I2(ram_rdata[15]),
        .I3(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \rdata_r[23]_i_1 
       (.I0(total_cnt_reg[23]),
        .I1(\rdata_r[31]_i_2_n_0 ),
        .I2(ram_rdata[15]),
        .I3(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \rdata_r[24]_i_1 
       (.I0(total_cnt_reg[24]),
        .I1(\rdata_r[31]_i_2_n_0 ),
        .I2(ram_rdata[15]),
        .I3(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \rdata_r[25]_i_1 
       (.I0(total_cnt_reg[25]),
        .I1(\rdata_r[31]_i_2_n_0 ),
        .I2(\rdata_r[28]_i_2_n_0 ),
        .O(\rdata_r[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \rdata_r[26]_i_1 
       (.I0(total_cnt_reg[26]),
        .I1(\rdata_r[31]_i_2_n_0 ),
        .I2(ram_rdata[15]),
        .I3(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \rdata_r[27]_i_1 
       (.I0(total_cnt_reg[27]),
        .I1(\rdata_r[31]_i_2_n_0 ),
        .I2(ram_rdata[15]),
        .I3(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[27]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hF8)) 
    \rdata_r[28]_i_1 
       (.I0(total_cnt_reg[28]),
        .I1(\rdata_r[31]_i_2_n_0 ),
        .I2(\rdata_r[28]_i_2_n_0 ),
        .O(\rdata_r[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0080F00000000000)) 
    \rdata_r[28]_i_2 
       (.I0(ram_rdata[15]),
        .I1(pop_nonempty),
        .I2(sel0[0]),
        .I3(sel0[2]),
        .I4(sel0[1]),
        .I5(\rdata_r[31]_i_4_n_0 ),
        .O(\rdata_r[28]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \rdata_r[29]_i_1 
       (.I0(total_cnt_reg[29]),
        .I1(\rdata_r[31]_i_2_n_0 ),
        .I2(ram_rdata[15]),
        .I3(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEFEFE)) 
    \rdata_r[2]_i_1 
       (.I0(\rdata_r[2]_i_2_n_0 ),
        .I1(\rdata_r[2]_i_3_n_0 ),
        .I2(\rdata_r[2]_i_4_n_0 ),
        .I3(\rdata_r[31]_i_2_n_0 ),
        .I4(total_cnt_reg[2]),
        .I5(\rdata_r[2]_i_5_n_0 ),
        .O(\rdata_r[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000020F02000)) 
    \rdata_r[2]_i_2 
       (.I0(fifo_count_reg[14]),
        .I1(\fifo_count[0]_i_3_n_0 ),
        .I2(\rdata_r[1]_i_3_n_0 ),
        .I3(sel0[0]),
        .I4(lora_trig_o),
        .I5(sel0[2]),
        .O(\rdata_r[2]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \rdata_r[2]_i_3 
       (.I0(sel0[2]),
        .I1(leds_o[2]),
        .I2(\rdata_r[3]_i_3_n_0 ),
        .O(\rdata_r[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rdata_r[2]_i_4 
       (.I0(\rdata_r[14]_i_2_n_0 ),
        .I1(fifo_count_reg[2]),
        .O(\rdata_r[2]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rdata_r[2]_i_5 
       (.I0(\rdata_r[31]_i_3_n_0 ),
        .I1(ram_rdata[2]),
        .O(\rdata_r[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \rdata_r[30]_i_1 
       (.I0(total_cnt_reg[30]),
        .I1(\rdata_r[31]_i_2_n_0 ),
        .I2(ram_rdata[15]),
        .I3(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \rdata_r[31]_i_1 
       (.I0(total_cnt_reg[31]),
        .I1(\rdata_r[31]_i_2_n_0 ),
        .I2(ram_rdata[15]),
        .I3(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    \rdata_r[31]_i_2 
       (.I0(sel0[0]),
        .I1(\araddr_reg_reg_n_0_[7] ),
        .I2(\araddr_reg_reg_n_0_[5] ),
        .I3(\araddr_reg_reg_n_0_[6] ),
        .I4(sel0[1]),
        .I5(sel0[2]),
        .O(\rdata_r[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h08000000)) 
    \rdata_r[31]_i_3 
       (.I0(pop_nonempty),
        .I1(sel0[0]),
        .I2(sel0[2]),
        .I3(sel0[1]),
        .I4(\rdata_r[31]_i_4_n_0 ),
        .O(\rdata_r[31]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \rdata_r[31]_i_4 
       (.I0(\araddr_reg_reg_n_0_[6] ),
        .I1(\araddr_reg_reg_n_0_[5] ),
        .I2(\araddr_reg_reg_n_0_[7] ),
        .O(\rdata_r[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \rdata_r[3]_i_1 
       (.I0(\rdata_r[3]_i_2_n_0 ),
        .I1(\rdata_r[31]_i_2_n_0 ),
        .I2(total_cnt_reg[3]),
        .I3(ram_rdata[3]),
        .I4(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF8888888)) 
    \rdata_r[3]_i_2 
       (.I0(fifo_count_reg[3]),
        .I1(\rdata_r[14]_i_2_n_0 ),
        .I2(\rdata_r[3]_i_3_n_0 ),
        .I3(leds_o[3]),
        .I4(sel0[2]),
        .O(\rdata_r[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \rdata_r[3]_i_3 
       (.I0(sel0[1]),
        .I1(\araddr_reg_reg_n_0_[6] ),
        .I2(\araddr_reg_reg_n_0_[5] ),
        .I3(\araddr_reg_reg_n_0_[7] ),
        .I4(sel0[0]),
        .O(\rdata_r[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \rdata_r[4]_i_1 
       (.I0(ram_rdata[4]),
        .I1(\rdata_r[31]_i_3_n_0 ),
        .I2(\rdata_r[4]_i_2_n_0 ),
        .O(\rdata_r[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata_r[4]_i_2 
       (.I0(\rdata_r[14]_i_2_n_0 ),
        .I1(fifo_count_reg[4]),
        .I2(\rdata_r[31]_i_2_n_0 ),
        .I3(total_cnt_reg[4]),
        .I4(sw_sync2[0]),
        .I5(\rdata_r[5]_i_3_n_0 ),
        .O(\rdata_r[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \rdata_r[5]_i_1 
       (.I0(ram_rdata[5]),
        .I1(\rdata_r[31]_i_3_n_0 ),
        .I2(\rdata_r[5]_i_2_n_0 ),
        .O(\rdata_r[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata_r[5]_i_2 
       (.I0(\rdata_r[14]_i_2_n_0 ),
        .I1(fifo_count_reg[5]),
        .I2(\rdata_r[31]_i_2_n_0 ),
        .I3(total_cnt_reg[5]),
        .I4(sw_sync2[1]),
        .I5(\rdata_r[5]_i_3_n_0 ),
        .O(\rdata_r[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \rdata_r[5]_i_3 
       (.I0(sel0[1]),
        .I1(\araddr_reg_reg_n_0_[6] ),
        .I2(\araddr_reg_reg_n_0_[5] ),
        .I3(\araddr_reg_reg_n_0_[7] ),
        .I4(sel0[2]),
        .I5(sel0[0]),
        .O(\rdata_r[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata_r[6]_i_1 
       (.I0(\rdata_r[14]_i_2_n_0 ),
        .I1(fifo_count_reg[6]),
        .I2(\rdata_r[31]_i_2_n_0 ),
        .I3(total_cnt_reg[6]),
        .I4(ram_rdata[6]),
        .I5(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata_r[7]_i_1 
       (.I0(\rdata_r[14]_i_2_n_0 ),
        .I1(fifo_count_reg[7]),
        .I2(\rdata_r[31]_i_2_n_0 ),
        .I3(total_cnt_reg[7]),
        .I4(ram_rdata[7]),
        .I5(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata_r[8]_i_1 
       (.I0(\rdata_r[14]_i_2_n_0 ),
        .I1(fifo_count_reg[8]),
        .I2(\rdata_r[31]_i_2_n_0 ),
        .I3(total_cnt_reg[8]),
        .I4(ram_rdata[8]),
        .I5(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata_r[9]_i_1 
       (.I0(\rdata_r[14]_i_2_n_0 ),
        .I1(fifo_count_reg[9]),
        .I2(\rdata_r[31]_i_2_n_0 ),
        .I3(total_cnt_reg[9]),
        .I4(ram_rdata[9]),
        .I5(\rdata_r[31]_i_3_n_0 ),
        .O(\rdata_r[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[0] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[0]_i_1_n_0 ),
        .Q(s_axi_rdata[0]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[10] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[10]_i_1_n_0 ),
        .Q(s_axi_rdata[10]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[11] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[11]_i_1_n_0 ),
        .Q(s_axi_rdata[11]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[12] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[12]_i_1_n_0 ),
        .Q(s_axi_rdata[12]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[13] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[13]_i_1_n_0 ),
        .Q(s_axi_rdata[13]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[14] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[14]_i_1_n_0 ),
        .Q(s_axi_rdata[14]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[15] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[15]_i_1_n_0 ),
        .Q(s_axi_rdata[15]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[16] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[16]_i_1_n_0 ),
        .Q(s_axi_rdata[16]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[17] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[17]_i_1_n_0 ),
        .Q(s_axi_rdata[17]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[18] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[18]_i_1_n_0 ),
        .Q(s_axi_rdata[18]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[19] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[19]_i_1_n_0 ),
        .Q(s_axi_rdata[19]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[1] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[1]_i_1_n_0 ),
        .Q(s_axi_rdata[1]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[20] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[20]_i_1_n_0 ),
        .Q(s_axi_rdata[20]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[21] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[21]_i_1_n_0 ),
        .Q(s_axi_rdata[21]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[22] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[22]_i_1_n_0 ),
        .Q(s_axi_rdata[22]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[23] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[23]_i_1_n_0 ),
        .Q(s_axi_rdata[23]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[24] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[24]_i_1_n_0 ),
        .Q(s_axi_rdata[24]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[25] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[25]_i_1_n_0 ),
        .Q(s_axi_rdata[25]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[26] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[26]_i_1_n_0 ),
        .Q(s_axi_rdata[26]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[27] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[27]_i_1_n_0 ),
        .Q(s_axi_rdata[27]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[28] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[28]_i_1_n_0 ),
        .Q(s_axi_rdata[28]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[29] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[29]_i_1_n_0 ),
        .Q(s_axi_rdata[29]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[2] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[2]_i_1_n_0 ),
        .Q(s_axi_rdata[2]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[30] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[30]_i_1_n_0 ),
        .Q(s_axi_rdata[30]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[31] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[31]_i_1_n_0 ),
        .Q(s_axi_rdata[31]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[3] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[3]_i_1_n_0 ),
        .Q(s_axi_rdata[3]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[4] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[4]_i_1_n_0 ),
        .Q(s_axi_rdata[4]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[5] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[5]_i_1_n_0 ),
        .Q(s_axi_rdata[5]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[6] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[6]_i_1_n_0 ),
        .Q(s_axi_rdata[6]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[7] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[7]_i_1_n_0 ),
        .Q(s_axi_rdata[7]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[8] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[8]_i_1_n_0 ),
        .Q(s_axi_rdata[8]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rdata_r_reg[9] 
       (.C(s_axi_aclk),
        .CE(rdata_r),
        .D(\rdata_r[9]_i_1_n_0 ),
        .Q(s_axi_rdata[9]),
        .R(bvalid_r_i_1_n_0));
  LUT4 #(
    .INIT(16'hF7F0)) 
    rvalid_r_i_1
       (.I0(\FSM_onehot_rd_state_reg_n_0_[2] ),
        .I1(s_axi_rready),
        .I2(rdata_r),
        .I3(s_axi_rvalid),
        .O(rvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rvalid_r_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rvalid_r_i_1_n_0),
        .Q(s_axi_rvalid),
        .R(bvalid_r_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \sample_data[15]_i_1 
       (.I0(sck_reg_reg_0),
        .I1(p_1_in_1),
        .I2(bit_cnt[5]),
        .I3(\sample_data[15]_i_2_n_0 ),
        .I4(sample_push0),
        .I5(\sample_data[15]_i_3_n_0 ),
        .O(\sample_data[15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \sample_data[15]_i_2 
       (.I0(bit_cnt[3]),
        .I1(bit_cnt[4]),
        .O(\sample_data[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \sample_data[15]_i_3 
       (.I0(bit_cnt[2]),
        .I1(bit_cnt[1]),
        .I2(bit_cnt[0]),
        .O(\sample_data[15]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_data_reg[0] 
       (.C(s_axi_aclk),
        .CE(\sample_data[15]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[7] ),
        .Q(sample_data[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_data_reg[10] 
       (.C(s_axi_aclk),
        .CE(\sample_data[15]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[17] ),
        .Q(sample_data[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_data_reg[11] 
       (.C(s_axi_aclk),
        .CE(\sample_data[15]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[18] ),
        .Q(sample_data[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_data_reg[12] 
       (.C(s_axi_aclk),
        .CE(\sample_data[15]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[19] ),
        .Q(sample_data[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_data_reg[13] 
       (.C(s_axi_aclk),
        .CE(\sample_data[15]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[20] ),
        .Q(sample_data[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_data_reg[14] 
       (.C(s_axi_aclk),
        .CE(\sample_data[15]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[21] ),
        .Q(sample_data[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_data_reg[15] 
       (.C(s_axi_aclk),
        .CE(\sample_data[15]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[22] ),
        .Q(sample_data[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_data_reg[1] 
       (.C(s_axi_aclk),
        .CE(\sample_data[15]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[8] ),
        .Q(sample_data[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_data_reg[2] 
       (.C(s_axi_aclk),
        .CE(\sample_data[15]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[9] ),
        .Q(sample_data[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_data_reg[3] 
       (.C(s_axi_aclk),
        .CE(\sample_data[15]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[10] ),
        .Q(sample_data[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_data_reg[4] 
       (.C(s_axi_aclk),
        .CE(\sample_data[15]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[11] ),
        .Q(sample_data[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_data_reg[5] 
       (.C(s_axi_aclk),
        .CE(\sample_data[15]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[12] ),
        .Q(sample_data[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_data_reg[6] 
       (.C(s_axi_aclk),
        .CE(\sample_data[15]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[13] ),
        .Q(sample_data[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_data_reg[7] 
       (.C(s_axi_aclk),
        .CE(\sample_data[15]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[14] ),
        .Q(sample_data[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_data_reg[8] 
       (.C(s_axi_aclk),
        .CE(\sample_data[15]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[15] ),
        .Q(sample_data[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_data_reg[9] 
       (.C(s_axi_aclk),
        .CE(\sample_data[15]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[16] ),
        .Q(sample_data[9]),
        .R(1'b0));
  CARRY4 \sample_push1_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\sample_push1_inferred__0/i__carry_n_0 ,\sample_push1_inferred__0/i__carry_n_1 ,\sample_push1_inferred__0/i__carry_n_2 ,\sample_push1_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,nco_acc[1],1'b0}),
        .O({\sample_push1_inferred__0/i__carry_n_4 ,\sample_push1_inferred__0/i__carry_n_5 ,\sample_push1_inferred__0/i__carry_n_6 ,\NLW_sample_push1_inferred__0/i__carry_O_UNCONNECTED [0]}),
        .S({nco_acc[3:2],i__carry_i_1_n_0,1'b0}));
  CARRY4 \sample_push1_inferred__0/i__carry__0 
       (.CI(\sample_push1_inferred__0/i__carry_n_0 ),
        .CO({\sample_push1_inferred__0/i__carry__0_n_0 ,\sample_push1_inferred__0/i__carry__0_n_1 ,\sample_push1_inferred__0/i__carry__0_n_2 ,\sample_push1_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,nco_acc[6:5],1'b0}),
        .O({\sample_push1_inferred__0/i__carry__0_n_4 ,\sample_push1_inferred__0/i__carry__0_n_5 ,\sample_push1_inferred__0/i__carry__0_n_6 ,\sample_push1_inferred__0/i__carry__0_n_7 }),
        .S({nco_acc[7],i__carry__0_i_1_n_0,i__carry__0_i_2_n_0,nco_acc[4]}));
  CARRY4 \sample_push1_inferred__0/i__carry__1 
       (.CI(\sample_push1_inferred__0/i__carry__0_n_0 ),
        .CO({\sample_push1_inferred__0/i__carry__1_n_0 ,\sample_push1_inferred__0/i__carry__1_n_1 ,\sample_push1_inferred__0/i__carry__1_n_2 ,\sample_push1_inferred__0/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({nco_acc[11:10],1'b0,nco_acc[8]}),
        .O({\sample_push1_inferred__0/i__carry__1_n_4 ,\sample_push1_inferred__0/i__carry__1_n_5 ,\sample_push1_inferred__0/i__carry__1_n_6 ,\sample_push1_inferred__0/i__carry__1_n_7 }),
        .S({i__carry__1_i_1_n_0,i__carry__1_i_2_n_0,nco_acc[9],i__carry__1_i_3_n_0}));
  CARRY4 \sample_push1_inferred__0/i__carry__2 
       (.CI(\sample_push1_inferred__0/i__carry__1_n_0 ),
        .CO({\sample_push1_inferred__0/i__carry__2_n_0 ,\sample_push1_inferred__0/i__carry__2_n_1 ,\sample_push1_inferred__0/i__carry__2_n_2 ,\sample_push1_inferred__0/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,nco_acc[13],1'b0}),
        .O({\sample_push1_inferred__0/i__carry__2_n_4 ,\sample_push1_inferred__0/i__carry__2_n_5 ,\sample_push1_inferred__0/i__carry__2_n_6 ,\sample_push1_inferred__0/i__carry__2_n_7 }),
        .S({nco_acc[15:14],i__carry__2_i_1_n_0,nco_acc[12]}));
  CARRY4 \sample_push1_inferred__0/i__carry__3 
       (.CI(\sample_push1_inferred__0/i__carry__2_n_0 ),
        .CO({\sample_push1_inferred__0/i__carry__3_n_0 ,\sample_push1_inferred__0/i__carry__3_n_1 ,\sample_push1_inferred__0/i__carry__3_n_2 ,\sample_push1_inferred__0/i__carry__3_n_3 }),
        .CYINIT(1'b0),
        .DI({nco_acc[19:17],1'b0}),
        .O({\sample_push1_inferred__0/i__carry__3_n_4 ,\sample_push1_inferred__0/i__carry__3_n_5 ,\sample_push1_inferred__0/i__carry__3_n_6 ,\sample_push1_inferred__0/i__carry__3_n_7 }),
        .S({i__carry__3_i_1_n_0,i__carry__3_i_2_n_0,i__carry__3_i_3_n_0,nco_acc[16]}));
  CARRY4 \sample_push1_inferred__0/i__carry__4 
       (.CI(\sample_push1_inferred__0/i__carry__3_n_0 ),
        .CO({\sample_push1_inferred__0/i__carry__4_n_0 ,\sample_push1_inferred__0/i__carry__4_n_1 ,\sample_push1_inferred__0/i__carry__4_n_2 ,\sample_push1_inferred__0/i__carry__4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,nco_acc[21:20]}),
        .O({\sample_push1_inferred__0/i__carry__4_n_4 ,\sample_push1_inferred__0/i__carry__4_n_5 ,\sample_push1_inferred__0/i__carry__4_n_6 ,\sample_push1_inferred__0/i__carry__4_n_7 }),
        .S({nco_acc[23:22],i__carry__4_i_1_n_0,i__carry__4_i_2_n_0}));
  CARRY4 \sample_push1_inferred__0/i__carry__5 
       (.CI(\sample_push1_inferred__0/i__carry__4_n_0 ),
        .CO({\sample_push1_inferred__0/i__carry__5_n_0 ,\sample_push1_inferred__0/i__carry__5_n_1 ,\sample_push1_inferred__0/i__carry__5_n_2 ,\sample_push1_inferred__0/i__carry__5_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,nco_acc[26],1'b0,nco_acc[24]}),
        .O({\sample_push1_inferred__0/i__carry__5_n_4 ,\sample_push1_inferred__0/i__carry__5_n_5 ,\sample_push1_inferred__0/i__carry__5_n_6 ,\sample_push1_inferred__0/i__carry__5_n_7 }),
        .S({nco_acc[27],i__carry__5_i_1_n_0,nco_acc[25],i__carry__5_i_2_n_0}));
  CARRY4 \sample_push1_inferred__0/i__carry__6 
       (.CI(\sample_push1_inferred__0/i__carry__5_n_0 ),
        .CO({\sample_push1_inferred__0/i__carry__6_n_0 ,\sample_push1_inferred__0/i__carry__6_n_1 ,\sample_push1_inferred__0/i__carry__6_n_2 ,\sample_push1_inferred__0/i__carry__6_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\sample_push1_inferred__0/i__carry__6_n_4 ,\sample_push1_inferred__0/i__carry__6_n_5 ,\sample_push1_inferred__0/i__carry__6_n_6 ,\sample_push1_inferred__0/i__carry__6_n_7 }),
        .S(nco_acc[31:28]));
  LUT6 #(
    .INIT(64'h0000000000000800)) 
    sample_push_i_1
       (.I0(bit_cnt[3]),
        .I1(bit_cnt[4]),
        .I2(sck_reg_reg_0),
        .I3(p_1_in_1),
        .I4(bit_cnt[5]),
        .I5(\sample_data[15]_i_3_n_0 ),
        .O(sample_push));
  FDRE #(
    .INIT(1'b0)) 
    sample_push_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(sample_push),
        .Q(sample_push_reg_n_0),
        .R(sample_push0));
  LUT2 #(
    .INIT(4'h7)) 
    sck_reg_i_1
       (.I0(s_axi_aresetn),
        .I1(p_2_in),
        .O(sample_push0));
  LUT2 #(
    .INIT(4'h6)) 
    sck_reg_i_2
       (.I0(p_1_in_1),
        .I1(sck_reg_reg_0),
        .O(sck_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sck_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(sck_reg_i_2_n_0),
        .Q(sck_reg_reg_0),
        .R(sample_push0));
  CARRY4 sck_reg_reg_i_3
       (.CI(\sample_push1_inferred__0/i__carry__6_n_0 ),
        .CO({NLW_sck_reg_reg_i_3_CO_UNCONNECTED[3:1],p_1_in_1}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_sck_reg_reg_i_3_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  FDRE #(
    .INIT(1'b0)) 
    sd_sync1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i2s_sd),
        .Q(sd_sync1),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sd_sync2_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(sd_sync1),
        .Q(sd_sync2),
        .R(bvalid_r_i_1_n_0));
  LUT6 #(
    .INIT(64'h0004040404040400)) 
    \shift_reg[22]_i_1 
       (.I0(bit_cnt[5]),
        .I1(p_1_in_1),
        .I2(sck_reg_reg_0),
        .I3(bit_cnt[4]),
        .I4(bit_cnt[3]),
        .I5(\sample_data[15]_i_3_n_0 ),
        .O(shift_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[0] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(sd_sync2),
        .Q(shift_reg[0]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[10] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(\shift_reg_reg_n_0_[9] ),
        .Q(\shift_reg_reg_n_0_[10] ),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[11] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(\shift_reg_reg_n_0_[10] ),
        .Q(\shift_reg_reg_n_0_[11] ),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[12] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(\shift_reg_reg_n_0_[11] ),
        .Q(\shift_reg_reg_n_0_[12] ),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[13] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(\shift_reg_reg_n_0_[12] ),
        .Q(\shift_reg_reg_n_0_[13] ),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[14] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(\shift_reg_reg_n_0_[13] ),
        .Q(\shift_reg_reg_n_0_[14] ),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[15] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(\shift_reg_reg_n_0_[14] ),
        .Q(\shift_reg_reg_n_0_[15] ),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[16] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(\shift_reg_reg_n_0_[15] ),
        .Q(\shift_reg_reg_n_0_[16] ),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[17] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(\shift_reg_reg_n_0_[16] ),
        .Q(\shift_reg_reg_n_0_[17] ),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[18] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(\shift_reg_reg_n_0_[17] ),
        .Q(\shift_reg_reg_n_0_[18] ),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[19] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(\shift_reg_reg_n_0_[18] ),
        .Q(\shift_reg_reg_n_0_[19] ),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[1] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(shift_reg[0]),
        .Q(shift_reg[1]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[20] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(\shift_reg_reg_n_0_[19] ),
        .Q(\shift_reg_reg_n_0_[20] ),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[21] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(\shift_reg_reg_n_0_[20] ),
        .Q(\shift_reg_reg_n_0_[21] ),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[22] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(\shift_reg_reg_n_0_[21] ),
        .Q(\shift_reg_reg_n_0_[22] ),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(shift_reg[1]),
        .Q(shift_reg[2]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[3] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(shift_reg[2]),
        .Q(shift_reg[3]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[4] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(shift_reg[3]),
        .Q(shift_reg[4]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[5] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(shift_reg[4]),
        .Q(shift_reg[5]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[6] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(shift_reg[5]),
        .Q(shift_reg[6]),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[7] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(shift_reg[6]),
        .Q(\shift_reg_reg_n_0_[7] ),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[8] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(\shift_reg_reg_n_0_[7] ),
        .Q(\shift_reg_reg_n_0_[8] ),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[9] 
       (.C(s_axi_aclk),
        .CE(shift_reg_0),
        .D(\shift_reg_reg_n_0_[8] ),
        .Q(\shift_reg_reg_n_0_[9] ),
        .R(sample_push0));
  FDRE #(
    .INIT(1'b0)) 
    \sw_sync1_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(switches_i[0]),
        .Q(sw_sync1[0]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sw_sync1_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(switches_i[1]),
        .Q(sw_sync1[1]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sw_sync2_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(sw_sync1[0]),
        .Q(sw_sync2[0]),
        .R(bvalid_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sw_sync2_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(sw_sync1[1]),
        .Q(sw_sync2[1]),
        .R(bvalid_r_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \total_cnt[0]_i_2 
       (.I0(total_cnt_reg[0]),
        .O(\total_cnt[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[0] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[0]_i_1_n_7 ),
        .Q(total_cnt_reg[0]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \total_cnt_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\total_cnt_reg[0]_i_1_n_0 ,\total_cnt_reg[0]_i_1_n_1 ,\total_cnt_reg[0]_i_1_n_2 ,\total_cnt_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\total_cnt_reg[0]_i_1_n_4 ,\total_cnt_reg[0]_i_1_n_5 ,\total_cnt_reg[0]_i_1_n_6 ,\total_cnt_reg[0]_i_1_n_7 }),
        .S({total_cnt_reg[3:1],\total_cnt[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[10] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[8]_i_1_n_5 ),
        .Q(total_cnt_reg[10]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[11] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[8]_i_1_n_4 ),
        .Q(total_cnt_reg[11]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[12] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[12]_i_1_n_7 ),
        .Q(total_cnt_reg[12]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \total_cnt_reg[12]_i_1 
       (.CI(\total_cnt_reg[8]_i_1_n_0 ),
        .CO({\total_cnt_reg[12]_i_1_n_0 ,\total_cnt_reg[12]_i_1_n_1 ,\total_cnt_reg[12]_i_1_n_2 ,\total_cnt_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\total_cnt_reg[12]_i_1_n_4 ,\total_cnt_reg[12]_i_1_n_5 ,\total_cnt_reg[12]_i_1_n_6 ,\total_cnt_reg[12]_i_1_n_7 }),
        .S(total_cnt_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[13] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[12]_i_1_n_6 ),
        .Q(total_cnt_reg[13]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[14] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[12]_i_1_n_5 ),
        .Q(total_cnt_reg[14]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[15] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[12]_i_1_n_4 ),
        .Q(total_cnt_reg[15]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[16] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[16]_i_1_n_7 ),
        .Q(total_cnt_reg[16]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \total_cnt_reg[16]_i_1 
       (.CI(\total_cnt_reg[12]_i_1_n_0 ),
        .CO({\total_cnt_reg[16]_i_1_n_0 ,\total_cnt_reg[16]_i_1_n_1 ,\total_cnt_reg[16]_i_1_n_2 ,\total_cnt_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\total_cnt_reg[16]_i_1_n_4 ,\total_cnt_reg[16]_i_1_n_5 ,\total_cnt_reg[16]_i_1_n_6 ,\total_cnt_reg[16]_i_1_n_7 }),
        .S(total_cnt_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[17] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[16]_i_1_n_6 ),
        .Q(total_cnt_reg[17]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[18] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[16]_i_1_n_5 ),
        .Q(total_cnt_reg[18]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[19] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[16]_i_1_n_4 ),
        .Q(total_cnt_reg[19]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[1] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[0]_i_1_n_6 ),
        .Q(total_cnt_reg[1]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[20] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[20]_i_1_n_7 ),
        .Q(total_cnt_reg[20]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \total_cnt_reg[20]_i_1 
       (.CI(\total_cnt_reg[16]_i_1_n_0 ),
        .CO({\total_cnt_reg[20]_i_1_n_0 ,\total_cnt_reg[20]_i_1_n_1 ,\total_cnt_reg[20]_i_1_n_2 ,\total_cnt_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\total_cnt_reg[20]_i_1_n_4 ,\total_cnt_reg[20]_i_1_n_5 ,\total_cnt_reg[20]_i_1_n_6 ,\total_cnt_reg[20]_i_1_n_7 }),
        .S(total_cnt_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[21] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[20]_i_1_n_6 ),
        .Q(total_cnt_reg[21]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[22] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[20]_i_1_n_5 ),
        .Q(total_cnt_reg[22]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[23] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[20]_i_1_n_4 ),
        .Q(total_cnt_reg[23]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[24] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[24]_i_1_n_7 ),
        .Q(total_cnt_reg[24]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \total_cnt_reg[24]_i_1 
       (.CI(\total_cnt_reg[20]_i_1_n_0 ),
        .CO({\total_cnt_reg[24]_i_1_n_0 ,\total_cnt_reg[24]_i_1_n_1 ,\total_cnt_reg[24]_i_1_n_2 ,\total_cnt_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\total_cnt_reg[24]_i_1_n_4 ,\total_cnt_reg[24]_i_1_n_5 ,\total_cnt_reg[24]_i_1_n_6 ,\total_cnt_reg[24]_i_1_n_7 }),
        .S(total_cnt_reg[27:24]));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[25] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[24]_i_1_n_6 ),
        .Q(total_cnt_reg[25]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[26] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[24]_i_1_n_5 ),
        .Q(total_cnt_reg[26]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[27] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[24]_i_1_n_4 ),
        .Q(total_cnt_reg[27]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[28] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[28]_i_1_n_7 ),
        .Q(total_cnt_reg[28]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \total_cnt_reg[28]_i_1 
       (.CI(\total_cnt_reg[24]_i_1_n_0 ),
        .CO({\NLW_total_cnt_reg[28]_i_1_CO_UNCONNECTED [3],\total_cnt_reg[28]_i_1_n_1 ,\total_cnt_reg[28]_i_1_n_2 ,\total_cnt_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\total_cnt_reg[28]_i_1_n_4 ,\total_cnt_reg[28]_i_1_n_5 ,\total_cnt_reg[28]_i_1_n_6 ,\total_cnt_reg[28]_i_1_n_7 }),
        .S(total_cnt_reg[31:28]));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[29] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[28]_i_1_n_6 ),
        .Q(total_cnt_reg[29]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[2] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[0]_i_1_n_5 ),
        .Q(total_cnt_reg[2]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[30] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[28]_i_1_n_5 ),
        .Q(total_cnt_reg[30]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[31] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[28]_i_1_n_4 ),
        .Q(total_cnt_reg[31]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[3] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[0]_i_1_n_4 ),
        .Q(total_cnt_reg[3]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[4] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[4]_i_1_n_7 ),
        .Q(total_cnt_reg[4]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \total_cnt_reg[4]_i_1 
       (.CI(\total_cnt_reg[0]_i_1_n_0 ),
        .CO({\total_cnt_reg[4]_i_1_n_0 ,\total_cnt_reg[4]_i_1_n_1 ,\total_cnt_reg[4]_i_1_n_2 ,\total_cnt_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\total_cnt_reg[4]_i_1_n_4 ,\total_cnt_reg[4]_i_1_n_5 ,\total_cnt_reg[4]_i_1_n_6 ,\total_cnt_reg[4]_i_1_n_7 }),
        .S(total_cnt_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[5] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[4]_i_1_n_6 ),
        .Q(total_cnt_reg[5]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[6] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[4]_i_1_n_5 ),
        .Q(total_cnt_reg[6]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[7] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[4]_i_1_n_4 ),
        .Q(total_cnt_reg[7]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[8] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[8]_i_1_n_7 ),
        .Q(total_cnt_reg[8]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \total_cnt_reg[8]_i_1 
       (.CI(\total_cnt_reg[4]_i_1_n_0 ),
        .CO({\total_cnt_reg[8]_i_1_n_0 ,\total_cnt_reg[8]_i_1_n_1 ,\total_cnt_reg[8]_i_1_n_2 ,\total_cnt_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\total_cnt_reg[8]_i_1_n_4 ,\total_cnt_reg[8]_i_1_n_5 ,\total_cnt_reg[8]_i_1_n_6 ,\total_cnt_reg[8]_i_1_n_7 }),
        .S(total_cnt_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \total_cnt_reg[9] 
       (.C(s_axi_aclk),
        .CE(sample_push_reg_n_0),
        .D(\total_cnt_reg[8]_i_1_n_6 ),
        .Q(total_cnt_reg[9]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hC008CC08)) 
    w_latched_i_1
       (.I0(s_axi_wvalid),
        .I1(s_axi_aresetn),
        .I2(bvalid_r_reg_0),
        .I3(w_latched_reg_n_0),
        .I4(aw_latched_reg_n_0),
        .O(w_latched_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    w_latched_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(w_latched_i_1_n_0),
        .Q(w_latched_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wdata_reg_reg[0] 
       (.C(s_axi_aclk),
        .CE(wready_r_i_1_n_0),
        .D(s_axi_wdata[0]),
        .Q(\wdata_reg_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wdata_reg_reg[1] 
       (.C(s_axi_aclk),
        .CE(wready_r_i_1_n_0),
        .D(s_axi_wdata[1]),
        .Q(\wdata_reg_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wdata_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(wready_r_i_1_n_0),
        .D(s_axi_wdata[2]),
        .Q(p_1_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wdata_reg_reg[3] 
       (.C(s_axi_aclk),
        .CE(wready_r_i_1_n_0),
        .D(s_axi_wdata[3]),
        .Q(\wdata_reg_reg_n_0_[3] ),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \wr_ptr[0]_i_2 
       (.I0(wr_ptr_reg[0]),
        .O(\wr_ptr[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[0] 
       (.C(s_axi_aclk),
        .CE(fifo_ram_reg_0_i_1_n_0),
        .D(\wr_ptr_reg[0]_i_1_n_7 ),
        .Q(wr_ptr_reg[0]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \wr_ptr_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\wr_ptr_reg[0]_i_1_n_0 ,\wr_ptr_reg[0]_i_1_n_1 ,\wr_ptr_reg[0]_i_1_n_2 ,\wr_ptr_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\wr_ptr_reg[0]_i_1_n_4 ,\wr_ptr_reg[0]_i_1_n_5 ,\wr_ptr_reg[0]_i_1_n_6 ,\wr_ptr_reg[0]_i_1_n_7 }),
        .S({wr_ptr_reg[3:1],\wr_ptr[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[10] 
       (.C(s_axi_aclk),
        .CE(fifo_ram_reg_0_i_1_n_0),
        .D(\wr_ptr_reg[8]_i_1_n_5 ),
        .Q(wr_ptr_reg[10]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[11] 
       (.C(s_axi_aclk),
        .CE(fifo_ram_reg_0_i_1_n_0),
        .D(\wr_ptr_reg[8]_i_1_n_4 ),
        .Q(wr_ptr_reg[11]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[12] 
       (.C(s_axi_aclk),
        .CE(fifo_ram_reg_0_i_1_n_0),
        .D(\wr_ptr_reg[12]_i_1_n_7 ),
        .Q(wr_ptr_reg[12]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \wr_ptr_reg[12]_i_1 
       (.CI(\wr_ptr_reg[8]_i_1_n_0 ),
        .CO({\NLW_wr_ptr_reg[12]_i_1_CO_UNCONNECTED [3:1],\wr_ptr_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_wr_ptr_reg[12]_i_1_O_UNCONNECTED [3:2],\wr_ptr_reg[12]_i_1_n_6 ,\wr_ptr_reg[12]_i_1_n_7 }),
        .S({1'b0,1'b0,wr_ptr_reg[13:12]}));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[13] 
       (.C(s_axi_aclk),
        .CE(fifo_ram_reg_0_i_1_n_0),
        .D(\wr_ptr_reg[12]_i_1_n_6 ),
        .Q(wr_ptr_reg[13]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[1] 
       (.C(s_axi_aclk),
        .CE(fifo_ram_reg_0_i_1_n_0),
        .D(\wr_ptr_reg[0]_i_1_n_6 ),
        .Q(wr_ptr_reg[1]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[2] 
       (.C(s_axi_aclk),
        .CE(fifo_ram_reg_0_i_1_n_0),
        .D(\wr_ptr_reg[0]_i_1_n_5 ),
        .Q(wr_ptr_reg[2]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[3] 
       (.C(s_axi_aclk),
        .CE(fifo_ram_reg_0_i_1_n_0),
        .D(\wr_ptr_reg[0]_i_1_n_4 ),
        .Q(wr_ptr_reg[3]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[4] 
       (.C(s_axi_aclk),
        .CE(fifo_ram_reg_0_i_1_n_0),
        .D(\wr_ptr_reg[4]_i_1_n_7 ),
        .Q(wr_ptr_reg[4]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \wr_ptr_reg[4]_i_1 
       (.CI(\wr_ptr_reg[0]_i_1_n_0 ),
        .CO({\wr_ptr_reg[4]_i_1_n_0 ,\wr_ptr_reg[4]_i_1_n_1 ,\wr_ptr_reg[4]_i_1_n_2 ,\wr_ptr_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\wr_ptr_reg[4]_i_1_n_4 ,\wr_ptr_reg[4]_i_1_n_5 ,\wr_ptr_reg[4]_i_1_n_6 ,\wr_ptr_reg[4]_i_1_n_7 }),
        .S(wr_ptr_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[5] 
       (.C(s_axi_aclk),
        .CE(fifo_ram_reg_0_i_1_n_0),
        .D(\wr_ptr_reg[4]_i_1_n_6 ),
        .Q(wr_ptr_reg[5]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[6] 
       (.C(s_axi_aclk),
        .CE(fifo_ram_reg_0_i_1_n_0),
        .D(\wr_ptr_reg[4]_i_1_n_5 ),
        .Q(wr_ptr_reg[6]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[7] 
       (.C(s_axi_aclk),
        .CE(fifo_ram_reg_0_i_1_n_0),
        .D(\wr_ptr_reg[4]_i_1_n_4 ),
        .Q(wr_ptr_reg[7]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[8] 
       (.C(s_axi_aclk),
        .CE(fifo_ram_reg_0_i_1_n_0),
        .D(\wr_ptr_reg[8]_i_1_n_7 ),
        .Q(wr_ptr_reg[8]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \wr_ptr_reg[8]_i_1 
       (.CI(\wr_ptr_reg[4]_i_1_n_0 ),
        .CO({\wr_ptr_reg[8]_i_1_n_0 ,\wr_ptr_reg[8]_i_1_n_1 ,\wr_ptr_reg[8]_i_1_n_2 ,\wr_ptr_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\wr_ptr_reg[8]_i_1_n_4 ,\wr_ptr_reg[8]_i_1_n_5 ,\wr_ptr_reg[8]_i_1_n_6 ,\wr_ptr_reg[8]_i_1_n_7 }),
        .S(wr_ptr_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[9] 
       (.C(s_axi_aclk),
        .CE(fifo_ram_reg_0_i_1_n_0),
        .D(\wr_ptr_reg[8]_i_1_n_6 ),
        .Q(wr_ptr_reg[9]),
        .R(\rd_ptr_rep[13]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0040)) 
    wready_r_i_1
       (.I0(w_latched_reg_n_0),
        .I1(s_axi_wvalid),
        .I2(s_axi_aresetn),
        .I3(bvalid_r_reg_0),
        .O(wready_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    wready_r_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(wready_r_i_1_n_0),
        .Q(s_axi_wready),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8800808080808080)) 
    ws_reg_i_1
       (.I0(s_axi_aresetn),
        .I1(p_2_in),
        .I2(i2s_ws),
        .I3(next_b[5]),
        .I4(p_1_in_1),
        .I5(sck_reg_reg_0),
        .O(ws_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ws_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ws_reg_i_1_n_0),
        .Q(i2s_ws),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
