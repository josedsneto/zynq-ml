// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (lin64) Build 6511674 Tue Jun 16 11:01:26 MDT 2026
// Date        : Wed Nov  4 20:37:05 2026
// Host        : pop-os running 64-bit Pop!_OS 24.04 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/nectx/Dev/zynq_ml/zynq_ml.gen/sources_1/bd/system/ip/system_axi_uart_0_0/system_axi_uart_0_0_sim_netlist.v
// Design      : system_axi_uart_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_axi_uart_0_0,axi_uart,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "axi_uart,Vivado 2026.1" *) 
(* NotValidForBitStream *)
module system_axi_uart_0_0
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
    uart_rxd,
    uart_txd);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 s_axi_aclk CLK" *) (* x_interface_mode = "slave s_axi_aclk" *) (* x_interface_parameter = "XIL_INTERFACENAME s_axi_aclk, ASSOCIATED_BUSIF s_axi, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input s_axi_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 s_axi_aresetn RST" *) (* x_interface_mode = "slave s_axi_aresetn" *) (* x_interface_parameter = "XIL_INTERFACENAME s_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_axi_aresetn;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi AWADDR" *) (* x_interface_mode = "slave s_axi" *) (* x_interface_parameter = "XIL_INTERFACENAME s_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [3:0]s_axi_awaddr;
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
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi ARADDR" *) input [3:0]s_axi_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi ARPROT" *) input [2:0]s_axi_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi ARVALID" *) input s_axi_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi ARREADY" *) output s_axi_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi RDATA" *) output [31:0]s_axi_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi RRESP" *) output [1:0]s_axi_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi RVALID" *) output s_axi_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi RREADY" *) input s_axi_rready;
  input uart_rxd;
  output uart_txd;

  wire \<const0> ;
  wire s_axi_aclk;
  wire [3:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [3:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wvalid;
  wire uart_rxd;
  wire uart_txd;

  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_wready = s_axi_awready;
  GND GND
       (.G(\<const0> ));
  system_axi_uart_0_0_axi_uart U0
       (.s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr[3:2]),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr[3:2]),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wvalid(s_axi_wvalid),
        .uart_rxd(uart_rxd),
        .uart_txd(uart_txd));
endmodule

(* ORIG_REF_NAME = "axi_uart" *) 
module system_axi_uart_0_0_axi_uart
   (s_axi_awready,
    s_axi_arready,
    s_axi_rdata,
    uart_txd,
    s_axi_bvalid,
    s_axi_rvalid,
    s_axi_aclk,
    s_axi_wdata,
    s_axi_arvalid,
    s_axi_wvalid,
    s_axi_awvalid,
    s_axi_awaddr,
    s_axi_aresetn,
    s_axi_araddr,
    uart_rxd,
    s_axi_bready,
    s_axi_rready);
  output s_axi_awready;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output uart_txd;
  output s_axi_bvalid;
  output s_axi_rvalid;
  input s_axi_aclk;
  input [31:0]s_axi_wdata;
  input s_axi_arvalid;
  input s_axi_wvalid;
  input s_axi_awvalid;
  input [1:0]s_axi_awaddr;
  input s_axi_aresetn;
  input [1:0]s_axi_araddr;
  input uart_rxd;
  input s_axi_bready;
  input s_axi_rready;

  wire aw_en_i_1_n_0;
  wire aw_en_reg_n_0;
  wire axi_arready0;
  wire axi_awready0;
  wire axi_bvalid_i_1_n_0;
  wire axi_rvalid_i_1_n_0;
  wire baud_cnt160;
  wire baud_cnt160_carry__0_i_1_n_0;
  wire baud_cnt160_carry__0_i_2_n_0;
  wire baud_cnt160_carry__0_i_3_n_0;
  wire baud_cnt160_carry__0_i_4_n_0;
  wire baud_cnt160_carry__0_i_5_n_0;
  wire baud_cnt160_carry__0_i_6_n_0;
  wire baud_cnt160_carry__0_i_7_n_0;
  wire baud_cnt160_carry__0_i_8_n_0;
  wire baud_cnt160_carry__0_n_1;
  wire baud_cnt160_carry__0_n_2;
  wire baud_cnt160_carry__0_n_3;
  wire baud_cnt160_carry_i_1_n_0;
  wire baud_cnt160_carry_i_2_n_0;
  wire baud_cnt160_carry_i_3_n_0;
  wire baud_cnt160_carry_i_4_n_0;
  wire baud_cnt160_carry_i_5_n_0;
  wire baud_cnt160_carry_i_6_n_0;
  wire baud_cnt160_carry_i_7_n_0;
  wire baud_cnt160_carry_i_8_n_0;
  wire baud_cnt160_carry_n_0;
  wire baud_cnt160_carry_n_1;
  wire baud_cnt160_carry_n_2;
  wire baud_cnt160_carry_n_3;
  wire \baud_cnt16[0]_i_1_n_0 ;
  wire \baud_cnt16[0]_i_3_n_0 ;
  wire [15:0]baud_cnt16_reg;
  wire \baud_cnt16_reg[0]_i_2_n_0 ;
  wire \baud_cnt16_reg[0]_i_2_n_1 ;
  wire \baud_cnt16_reg[0]_i_2_n_2 ;
  wire \baud_cnt16_reg[0]_i_2_n_3 ;
  wire \baud_cnt16_reg[0]_i_2_n_4 ;
  wire \baud_cnt16_reg[0]_i_2_n_5 ;
  wire \baud_cnt16_reg[0]_i_2_n_6 ;
  wire \baud_cnt16_reg[0]_i_2_n_7 ;
  wire \baud_cnt16_reg[12]_i_1_n_1 ;
  wire \baud_cnt16_reg[12]_i_1_n_2 ;
  wire \baud_cnt16_reg[12]_i_1_n_3 ;
  wire \baud_cnt16_reg[12]_i_1_n_4 ;
  wire \baud_cnt16_reg[12]_i_1_n_5 ;
  wire \baud_cnt16_reg[12]_i_1_n_6 ;
  wire \baud_cnt16_reg[12]_i_1_n_7 ;
  wire \baud_cnt16_reg[4]_i_1_n_0 ;
  wire \baud_cnt16_reg[4]_i_1_n_1 ;
  wire \baud_cnt16_reg[4]_i_1_n_2 ;
  wire \baud_cnt16_reg[4]_i_1_n_3 ;
  wire \baud_cnt16_reg[4]_i_1_n_4 ;
  wire \baud_cnt16_reg[4]_i_1_n_5 ;
  wire \baud_cnt16_reg[4]_i_1_n_6 ;
  wire \baud_cnt16_reg[4]_i_1_n_7 ;
  wire \baud_cnt16_reg[8]_i_1_n_0 ;
  wire \baud_cnt16_reg[8]_i_1_n_1 ;
  wire \baud_cnt16_reg[8]_i_1_n_2 ;
  wire \baud_cnt16_reg[8]_i_1_n_3 ;
  wire \baud_cnt16_reg[8]_i_1_n_4 ;
  wire \baud_cnt16_reg[8]_i_1_n_5 ;
  wire \baud_cnt16_reg[8]_i_1_n_6 ;
  wire \baud_cnt16_reg[8]_i_1_n_7 ;
  wire baud_tick_16;
  wire baud_tick_1x0_out;
  wire baud_tick_1x_reg_n_0;
  wire error_reg;
  wire inst_uart_rx_n_1;
  wire inst_uart_rx_n_3;
  wire inst_uart_tx_n_2;
  wire [15:1]minusOp;
  wire minusOp_carry__0_i_1_n_0;
  wire minusOp_carry__0_i_2_n_0;
  wire minusOp_carry__0_i_3_n_0;
  wire minusOp_carry__0_i_4_n_0;
  wire minusOp_carry__0_n_0;
  wire minusOp_carry__0_n_1;
  wire minusOp_carry__0_n_2;
  wire minusOp_carry__0_n_3;
  wire minusOp_carry__1_i_1_n_0;
  wire minusOp_carry__1_i_2_n_0;
  wire minusOp_carry__1_i_3_n_0;
  wire minusOp_carry__1_i_4_n_0;
  wire minusOp_carry__1_n_0;
  wire minusOp_carry__1_n_1;
  wire minusOp_carry__1_n_2;
  wire minusOp_carry__1_n_3;
  wire minusOp_carry__2_i_1_n_0;
  wire minusOp_carry__2_i_2_n_0;
  wire minusOp_carry__2_i_3_n_0;
  wire minusOp_carry__2_n_2;
  wire minusOp_carry__2_n_3;
  wire minusOp_carry_i_1_n_0;
  wire minusOp_carry_i_2_n_0;
  wire minusOp_carry_i_3_n_0;
  wire minusOp_carry_i_4_n_0;
  wire minusOp_carry_n_0;
  wire minusOp_carry_n_1;
  wire minusOp_carry_n_2;
  wire minusOp_carry_n_3;
  wire p_0_in;
  wire [31:0]p_1_in;
  wire raw_rxd;
  wire [15:0]reg_baud_div;
  wire \reg_baud_div[15]_i_2_n_0 ;
  wire \reg_baud_div[15]_i_3_n_0 ;
  wire \reg_baud_div[15]_i_4_n_0 ;
  wire \reg_baud_div[15]_i_5_n_0 ;
  wire [0:0]reg_baud_div_0;
  wire [31:2]reg_ctrl;
  wire [0:0]reg_ctrl_1;
  wire \reg_ctrl_reg_n_0_[0] ;
  wire [7:0]rx_data;
  wire rx_data_avail;
  wire rx_data_avail_i_2_n_0;
  wire [7:0]rx_data_latched;
  wire rx_error_reg;
  wire rx_error_reg_i_1_n_0;
  wire rx_valid_pulse;
  wire s_axi_aclk;
  wire [1:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [1:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wvalid;
  wire [7:0]tx_data;
  wire [0:0]tx_data_2;
  wire \tx_div_cnt[0]_i_1_n_0 ;
  wire \tx_div_cnt[1]_i_1_n_0 ;
  wire \tx_div_cnt[2]_i_1_n_0 ;
  wire \tx_div_cnt[3]_i_1_n_0 ;
  wire \tx_div_cnt_reg_n_0_[0] ;
  wire \tx_div_cnt_reg_n_0_[1] ;
  wire \tx_div_cnt_reg_n_0_[2] ;
  wire \tx_div_cnt_reg_n_0_[3] ;
  wire tx_start;
  wire uart_rxd;
  wire uart_txd;
  wire [3:0]NLW_baud_cnt160_carry_O_UNCONNECTED;
  wire [3:0]NLW_baud_cnt160_carry__0_O_UNCONNECTED;
  wire [3:3]\NLW_baud_cnt16_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:2]NLW_minusOp_carry__2_CO_UNCONNECTED;
  wire [3:3]NLW_minusOp_carry__2_O_UNCONNECTED;

  LUT5 #(
    .INIT(32'hD5FFD5D5)) 
    aw_en_i_1
       (.I0(s_axi_aresetn),
        .I1(s_axi_bready),
        .I2(s_axi_bvalid),
        .I3(axi_awready0),
        .I4(aw_en_reg_n_0),
        .O(aw_en_i_1_n_0));
  FDRE #(
    .INIT(1'b1)) 
    aw_en_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(aw_en_i_1_n_0),
        .Q(aw_en_reg_n_0),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s_axi_arvalid),
        .I1(s_axi_arready),
        .O(axi_arready0));
  FDRE #(
    .INIT(1'b0)) 
    axi_arready_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(s_axi_arready),
        .R(inst_uart_rx_n_1));
  LUT3 #(
    .INIT(8'h80)) 
    axi_awready_i_2
       (.I0(s_axi_wvalid),
        .I1(aw_en_reg_n_0),
        .I2(s_axi_awvalid),
        .O(axi_awready0));
  FDRE #(
    .INIT(1'b0)) 
    axi_awready_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(s_axi_awready),
        .R(inst_uart_rx_n_1));
  LUT3 #(
    .INIT(8'h74)) 
    axi_bvalid_i_1
       (.I0(s_axi_bready),
        .I1(s_axi_bvalid),
        .I2(s_axi_awready),
        .O(axi_bvalid_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_bvalid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s_axi_bvalid),
        .R(inst_uart_rx_n_1));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hA0C0)) 
    \axi_rdata[10]_i_1 
       (.I0(reg_baud_div[10]),
        .I1(reg_ctrl[10]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[0]),
        .O(p_1_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hA0C0)) 
    \axi_rdata[11]_i_1 
       (.I0(reg_baud_div[11]),
        .I1(reg_ctrl[11]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[0]),
        .O(p_1_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hA0C0)) 
    \axi_rdata[12]_i_1 
       (.I0(reg_baud_div[12]),
        .I1(reg_ctrl[12]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[0]),
        .O(p_1_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hA0C0)) 
    \axi_rdata[13]_i_1 
       (.I0(reg_baud_div[13]),
        .I1(reg_ctrl[13]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[0]),
        .O(p_1_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hA0C0)) 
    \axi_rdata[14]_i_1 
       (.I0(reg_baud_div[14]),
        .I1(reg_ctrl[14]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[0]),
        .O(p_1_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hA0C0)) 
    \axi_rdata[15]_i_1 
       (.I0(reg_baud_div[15]),
        .I1(reg_ctrl[15]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[0]),
        .O(p_1_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \axi_rdata[16]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(reg_ctrl[16]),
        .O(p_1_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \axi_rdata[17]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(reg_ctrl[17]),
        .O(p_1_in[17]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \axi_rdata[18]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(reg_ctrl[18]),
        .O(p_1_in[18]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \axi_rdata[19]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(reg_ctrl[19]),
        .O(p_1_in[19]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \axi_rdata[1]_i_1 
       (.I0(p_0_in),
        .I1(reg_baud_div[1]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[0]),
        .I4(rx_data_latched[1]),
        .I5(rx_data_avail),
        .O(p_1_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \axi_rdata[20]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(reg_ctrl[20]),
        .O(p_1_in[20]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \axi_rdata[21]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(reg_ctrl[21]),
        .O(p_1_in[21]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \axi_rdata[22]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(reg_ctrl[22]),
        .O(p_1_in[22]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \axi_rdata[23]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(reg_ctrl[23]),
        .O(p_1_in[23]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \axi_rdata[24]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(reg_ctrl[24]),
        .O(p_1_in[24]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \axi_rdata[25]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(reg_ctrl[25]),
        .O(p_1_in[25]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \axi_rdata[26]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(reg_ctrl[26]),
        .O(p_1_in[26]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \axi_rdata[27]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(reg_ctrl[27]),
        .O(p_1_in[27]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \axi_rdata[28]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(reg_ctrl[28]),
        .O(p_1_in[28]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \axi_rdata[29]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(reg_ctrl[29]),
        .O(p_1_in[29]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \axi_rdata[2]_i_1 
       (.I0(reg_ctrl[2]),
        .I1(reg_baud_div[2]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[0]),
        .I4(rx_data_latched[2]),
        .I5(rx_error_reg),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \axi_rdata[30]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(reg_ctrl[30]),
        .O(p_1_in[30]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \axi_rdata[31]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(reg_ctrl[31]),
        .O(p_1_in[31]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hF0CC00AA)) 
    \axi_rdata[4]_i_1 
       (.I0(rx_data_latched[4]),
        .I1(reg_ctrl[4]),
        .I2(reg_baud_div[4]),
        .I3(s_axi_araddr[0]),
        .I4(s_axi_araddr[1]),
        .O(p_1_in[4]));
  LUT5 #(
    .INIT(32'hF0CC00AA)) 
    \axi_rdata[5]_i_1 
       (.I0(rx_data_latched[5]),
        .I1(reg_ctrl[5]),
        .I2(reg_baud_div[5]),
        .I3(s_axi_araddr[0]),
        .I4(s_axi_araddr[1]),
        .O(p_1_in[5]));
  LUT5 #(
    .INIT(32'hF0CC00AA)) 
    \axi_rdata[6]_i_1 
       (.I0(rx_data_latched[6]),
        .I1(reg_ctrl[6]),
        .I2(reg_baud_div[6]),
        .I3(s_axi_araddr[0]),
        .I4(s_axi_araddr[1]),
        .O(p_1_in[6]));
  LUT5 #(
    .INIT(32'hF0CC00AA)) 
    \axi_rdata[7]_i_1 
       (.I0(rx_data_latched[7]),
        .I1(reg_ctrl[7]),
        .I2(reg_baud_div[7]),
        .I3(s_axi_araddr[0]),
        .I4(s_axi_araddr[1]),
        .O(p_1_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hA0C0)) 
    \axi_rdata[8]_i_1 
       (.I0(reg_baud_div[8]),
        .I1(reg_ctrl[8]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[0]),
        .O(p_1_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hA0C0)) 
    \axi_rdata[9]_i_1 
       (.I0(reg_baud_div[9]),
        .I1(reg_ctrl[9]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[0]),
        .O(p_1_in[9]));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[0] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[0]),
        .Q(s_axi_rdata[0]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[10] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[10]),
        .Q(s_axi_rdata[10]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[11] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[11]),
        .Q(s_axi_rdata[11]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[12] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[12]),
        .Q(s_axi_rdata[12]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[13] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[13]),
        .Q(s_axi_rdata[13]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[14] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[14]),
        .Q(s_axi_rdata[14]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[15] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[15]),
        .Q(s_axi_rdata[15]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[16] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[16]),
        .Q(s_axi_rdata[16]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[17] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[17]),
        .Q(s_axi_rdata[17]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[18] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[18]),
        .Q(s_axi_rdata[18]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[19] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[19]),
        .Q(s_axi_rdata[19]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[1] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[1]),
        .Q(s_axi_rdata[1]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[20] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[20]),
        .Q(s_axi_rdata[20]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[21] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[21]),
        .Q(s_axi_rdata[21]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[22] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[22]),
        .Q(s_axi_rdata[22]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[23] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[23]),
        .Q(s_axi_rdata[23]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[24] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[24]),
        .Q(s_axi_rdata[24]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[25] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[25]),
        .Q(s_axi_rdata[25]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[26] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[26]),
        .Q(s_axi_rdata[26]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[27] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[27]),
        .Q(s_axi_rdata[27]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[28] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[28]),
        .Q(s_axi_rdata[28]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[29] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[29]),
        .Q(s_axi_rdata[29]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[2] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[2]),
        .Q(s_axi_rdata[2]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[30] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[30]),
        .Q(s_axi_rdata[30]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[31] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[31]),
        .Q(s_axi_rdata[31]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[3] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[3]),
        .Q(s_axi_rdata[3]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[4] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[4]),
        .Q(s_axi_rdata[4]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[5] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[5]),
        .Q(s_axi_rdata[5]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[6] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[6]),
        .Q(s_axi_rdata[6]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[7] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[7]),
        .Q(s_axi_rdata[7]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[8] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[8]),
        .Q(s_axi_rdata[8]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[9] 
       (.C(s_axi_aclk),
        .CE(axi_arready0),
        .D(p_1_in[9]),
        .Q(s_axi_rdata[9]),
        .R(inst_uart_rx_n_1));
  LUT4 #(
    .INIT(16'h7444)) 
    axi_rvalid_i_1
       (.I0(s_axi_rready),
        .I1(s_axi_rvalid),
        .I2(s_axi_arvalid),
        .I3(s_axi_arready),
        .O(axi_rvalid_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_rvalid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(s_axi_rvalid),
        .R(inst_uart_rx_n_1));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 baud_cnt160_carry
       (.CI(1'b0),
        .CO({baud_cnt160_carry_n_0,baud_cnt160_carry_n_1,baud_cnt160_carry_n_2,baud_cnt160_carry_n_3}),
        .CYINIT(1'b1),
        .DI({baud_cnt160_carry_i_1_n_0,baud_cnt160_carry_i_2_n_0,baud_cnt160_carry_i_3_n_0,baud_cnt160_carry_i_4_n_0}),
        .O(NLW_baud_cnt160_carry_O_UNCONNECTED[3:0]),
        .S({baud_cnt160_carry_i_5_n_0,baud_cnt160_carry_i_6_n_0,baud_cnt160_carry_i_7_n_0,baud_cnt160_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 baud_cnt160_carry__0
       (.CI(baud_cnt160_carry_n_0),
        .CO({baud_cnt160,baud_cnt160_carry__0_n_1,baud_cnt160_carry__0_n_2,baud_cnt160_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({baud_cnt160_carry__0_i_1_n_0,baud_cnt160_carry__0_i_2_n_0,baud_cnt160_carry__0_i_3_n_0,baud_cnt160_carry__0_i_4_n_0}),
        .O(NLW_baud_cnt160_carry__0_O_UNCONNECTED[3:0]),
        .S({baud_cnt160_carry__0_i_5_n_0,baud_cnt160_carry__0_i_6_n_0,baud_cnt160_carry__0_i_7_n_0,baud_cnt160_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    baud_cnt160_carry__0_i_1
       (.I0(baud_cnt16_reg[14]),
        .I1(minusOp[14]),
        .I2(minusOp[15]),
        .I3(baud_cnt16_reg[15]),
        .O(baud_cnt160_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    baud_cnt160_carry__0_i_2
       (.I0(baud_cnt16_reg[12]),
        .I1(minusOp[12]),
        .I2(minusOp[13]),
        .I3(baud_cnt16_reg[13]),
        .O(baud_cnt160_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    baud_cnt160_carry__0_i_3
       (.I0(baud_cnt16_reg[10]),
        .I1(minusOp[10]),
        .I2(minusOp[11]),
        .I3(baud_cnt16_reg[11]),
        .O(baud_cnt160_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    baud_cnt160_carry__0_i_4
       (.I0(baud_cnt16_reg[8]),
        .I1(minusOp[8]),
        .I2(minusOp[9]),
        .I3(baud_cnt16_reg[9]),
        .O(baud_cnt160_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    baud_cnt160_carry__0_i_5
       (.I0(minusOp[15]),
        .I1(baud_cnt16_reg[15]),
        .I2(minusOp[14]),
        .I3(baud_cnt16_reg[14]),
        .O(baud_cnt160_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    baud_cnt160_carry__0_i_6
       (.I0(minusOp[13]),
        .I1(baud_cnt16_reg[13]),
        .I2(minusOp[12]),
        .I3(baud_cnt16_reg[12]),
        .O(baud_cnt160_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    baud_cnt160_carry__0_i_7
       (.I0(minusOp[11]),
        .I1(baud_cnt16_reg[11]),
        .I2(minusOp[10]),
        .I3(baud_cnt16_reg[10]),
        .O(baud_cnt160_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    baud_cnt160_carry__0_i_8
       (.I0(minusOp[9]),
        .I1(baud_cnt16_reg[9]),
        .I2(minusOp[8]),
        .I3(baud_cnt16_reg[8]),
        .O(baud_cnt160_carry__0_i_8_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    baud_cnt160_carry_i_1
       (.I0(baud_cnt16_reg[6]),
        .I1(minusOp[6]),
        .I2(minusOp[7]),
        .I3(baud_cnt16_reg[7]),
        .O(baud_cnt160_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    baud_cnt160_carry_i_2
       (.I0(baud_cnt16_reg[4]),
        .I1(minusOp[4]),
        .I2(minusOp[5]),
        .I3(baud_cnt16_reg[5]),
        .O(baud_cnt160_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    baud_cnt160_carry_i_3
       (.I0(baud_cnt16_reg[2]),
        .I1(minusOp[2]),
        .I2(minusOp[3]),
        .I3(baud_cnt16_reg[3]),
        .O(baud_cnt160_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h8F08)) 
    baud_cnt160_carry_i_4
       (.I0(baud_cnt16_reg[0]),
        .I1(reg_baud_div[0]),
        .I2(minusOp[1]),
        .I3(baud_cnt16_reg[1]),
        .O(baud_cnt160_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    baud_cnt160_carry_i_5
       (.I0(minusOp[7]),
        .I1(baud_cnt16_reg[7]),
        .I2(minusOp[6]),
        .I3(baud_cnt16_reg[6]),
        .O(baud_cnt160_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    baud_cnt160_carry_i_6
       (.I0(minusOp[5]),
        .I1(baud_cnt16_reg[5]),
        .I2(minusOp[4]),
        .I3(baud_cnt16_reg[4]),
        .O(baud_cnt160_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    baud_cnt160_carry_i_7
       (.I0(minusOp[3]),
        .I1(baud_cnt16_reg[3]),
        .I2(minusOp[2]),
        .I3(baud_cnt16_reg[2]),
        .O(baud_cnt160_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h0990)) 
    baud_cnt160_carry_i_8
       (.I0(minusOp[1]),
        .I1(baud_cnt16_reg[1]),
        .I2(baud_cnt16_reg[0]),
        .I3(reg_baud_div[0]),
        .O(baud_cnt160_carry_i_8_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    \baud_cnt16[0]_i_1 
       (.I0(baud_cnt160),
        .I1(s_axi_aresetn),
        .O(\baud_cnt16[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \baud_cnt16[0]_i_3 
       (.I0(baud_cnt16_reg[0]),
        .O(\baud_cnt16[0]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_cnt16_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\baud_cnt16_reg[0]_i_2_n_7 ),
        .Q(baud_cnt16_reg[0]),
        .R(\baud_cnt16[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \baud_cnt16_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\baud_cnt16_reg[0]_i_2_n_0 ,\baud_cnt16_reg[0]_i_2_n_1 ,\baud_cnt16_reg[0]_i_2_n_2 ,\baud_cnt16_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\baud_cnt16_reg[0]_i_2_n_4 ,\baud_cnt16_reg[0]_i_2_n_5 ,\baud_cnt16_reg[0]_i_2_n_6 ,\baud_cnt16_reg[0]_i_2_n_7 }),
        .S({baud_cnt16_reg[3:1],\baud_cnt16[0]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \baud_cnt16_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\baud_cnt16_reg[8]_i_1_n_5 ),
        .Q(baud_cnt16_reg[10]),
        .R(\baud_cnt16[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_cnt16_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\baud_cnt16_reg[8]_i_1_n_4 ),
        .Q(baud_cnt16_reg[11]),
        .R(\baud_cnt16[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_cnt16_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\baud_cnt16_reg[12]_i_1_n_7 ),
        .Q(baud_cnt16_reg[12]),
        .R(\baud_cnt16[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \baud_cnt16_reg[12]_i_1 
       (.CI(\baud_cnt16_reg[8]_i_1_n_0 ),
        .CO({\NLW_baud_cnt16_reg[12]_i_1_CO_UNCONNECTED [3],\baud_cnt16_reg[12]_i_1_n_1 ,\baud_cnt16_reg[12]_i_1_n_2 ,\baud_cnt16_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\baud_cnt16_reg[12]_i_1_n_4 ,\baud_cnt16_reg[12]_i_1_n_5 ,\baud_cnt16_reg[12]_i_1_n_6 ,\baud_cnt16_reg[12]_i_1_n_7 }),
        .S(baud_cnt16_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \baud_cnt16_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\baud_cnt16_reg[12]_i_1_n_6 ),
        .Q(baud_cnt16_reg[13]),
        .R(\baud_cnt16[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_cnt16_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\baud_cnt16_reg[12]_i_1_n_5 ),
        .Q(baud_cnt16_reg[14]),
        .R(\baud_cnt16[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_cnt16_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\baud_cnt16_reg[12]_i_1_n_4 ),
        .Q(baud_cnt16_reg[15]),
        .R(\baud_cnt16[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_cnt16_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\baud_cnt16_reg[0]_i_2_n_6 ),
        .Q(baud_cnt16_reg[1]),
        .R(\baud_cnt16[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_cnt16_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\baud_cnt16_reg[0]_i_2_n_5 ),
        .Q(baud_cnt16_reg[2]),
        .R(\baud_cnt16[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_cnt16_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\baud_cnt16_reg[0]_i_2_n_4 ),
        .Q(baud_cnt16_reg[3]),
        .R(\baud_cnt16[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_cnt16_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\baud_cnt16_reg[4]_i_1_n_7 ),
        .Q(baud_cnt16_reg[4]),
        .R(\baud_cnt16[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \baud_cnt16_reg[4]_i_1 
       (.CI(\baud_cnt16_reg[0]_i_2_n_0 ),
        .CO({\baud_cnt16_reg[4]_i_1_n_0 ,\baud_cnt16_reg[4]_i_1_n_1 ,\baud_cnt16_reg[4]_i_1_n_2 ,\baud_cnt16_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\baud_cnt16_reg[4]_i_1_n_4 ,\baud_cnt16_reg[4]_i_1_n_5 ,\baud_cnt16_reg[4]_i_1_n_6 ,\baud_cnt16_reg[4]_i_1_n_7 }),
        .S(baud_cnt16_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \baud_cnt16_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\baud_cnt16_reg[4]_i_1_n_6 ),
        .Q(baud_cnt16_reg[5]),
        .R(\baud_cnt16[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_cnt16_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\baud_cnt16_reg[4]_i_1_n_5 ),
        .Q(baud_cnt16_reg[6]),
        .R(\baud_cnt16[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_cnt16_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\baud_cnt16_reg[4]_i_1_n_4 ),
        .Q(baud_cnt16_reg[7]),
        .R(\baud_cnt16[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_cnt16_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\baud_cnt16_reg[8]_i_1_n_7 ),
        .Q(baud_cnt16_reg[8]),
        .R(\baud_cnt16[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \baud_cnt16_reg[8]_i_1 
       (.CI(\baud_cnt16_reg[4]_i_1_n_0 ),
        .CO({\baud_cnt16_reg[8]_i_1_n_0 ,\baud_cnt16_reg[8]_i_1_n_1 ,\baud_cnt16_reg[8]_i_1_n_2 ,\baud_cnt16_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\baud_cnt16_reg[8]_i_1_n_4 ,\baud_cnt16_reg[8]_i_1_n_5 ,\baud_cnt16_reg[8]_i_1_n_6 ,\baud_cnt16_reg[8]_i_1_n_7 }),
        .S(baud_cnt16_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \baud_cnt16_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\baud_cnt16_reg[8]_i_1_n_6 ),
        .Q(baud_cnt16_reg[9]),
        .R(\baud_cnt16[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    baud_tick_16_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(baud_cnt160),
        .Q(baud_tick_16),
        .R(inst_uart_rx_n_1));
  LUT5 #(
    .INIT(32'h80000000)) 
    baud_tick_1x_i_1
       (.I0(\tx_div_cnt_reg_n_0_[2] ),
        .I1(\tx_div_cnt_reg_n_0_[3] ),
        .I2(baud_cnt160),
        .I3(\tx_div_cnt_reg_n_0_[1] ),
        .I4(\tx_div_cnt_reg_n_0_[0] ),
        .O(baud_tick_1x0_out));
  FDRE #(
    .INIT(1'b0)) 
    baud_tick_1x_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(baud_tick_1x0_out),
        .Q(baud_tick_1x_reg_n_0),
        .R(inst_uart_rx_n_1));
  system_axi_uart_0_0_uart_rx inst_uart_rx
       (.E(rx_valid_pulse),
        .Q(rx_data),
        .SR(inst_uart_rx_n_1),
        .baud_tick_16(baud_tick_16),
        .error_reg(error_reg),
        .raw_rxd(raw_rxd),
        .rx_data_avail(rx_data_avail),
        .rx_data_avail_reg(inst_uart_rx_n_3),
        .rx_data_avail_reg_0(s_axi_arready),
        .rx_data_avail_reg_1(rx_data_avail_i_2_n_0),
        .rx_data_avail_reg_2(rx_error_reg_i_1_n_0),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arvalid(s_axi_arvalid));
  system_axi_uart_0_0_uart_tx inst_uart_tx
       (.D({p_1_in[3],p_1_in[0]}),
        .E(tx_data_2),
        .\FSM_sequential_state_reg[0]_0 (baud_tick_1x_reg_n_0),
        .Q({reg_ctrl[3],p_0_in,\reg_ctrl_reg_n_0_[0] }),
        .SR(inst_uart_rx_n_1),
        .axi_awready0(axi_awready0),
        .\axi_rdata_reg[3] ({reg_baud_div[3],reg_baud_div[0]}),
        .\axi_rdata_reg[3]_0 ({rx_data_latched[3],rx_data_latched[0]}),
        .raw_rxd(raw_rxd),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_aresetn_0(inst_uart_tx_n_2),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_wvalid(s_axi_wvalid),
        .\shreg_reg[7]_0 (tx_data),
        .\tx_data_reg[0] (aw_en_reg_n_0),
        .tx_start(tx_start),
        .uart_rxd(uart_rxd),
        .uart_txd(uart_txd));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 minusOp_carry
       (.CI(1'b0),
        .CO({minusOp_carry_n_0,minusOp_carry_n_1,minusOp_carry_n_2,minusOp_carry_n_3}),
        .CYINIT(reg_baud_div[0]),
        .DI(reg_baud_div[4:1]),
        .O(minusOp[4:1]),
        .S({minusOp_carry_i_1_n_0,minusOp_carry_i_2_n_0,minusOp_carry_i_3_n_0,minusOp_carry_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 minusOp_carry__0
       (.CI(minusOp_carry_n_0),
        .CO({minusOp_carry__0_n_0,minusOp_carry__0_n_1,minusOp_carry__0_n_2,minusOp_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(reg_baud_div[8:5]),
        .O(minusOp[8:5]),
        .S({minusOp_carry__0_i_1_n_0,minusOp_carry__0_i_2_n_0,minusOp_carry__0_i_3_n_0,minusOp_carry__0_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__0_i_1
       (.I0(reg_baud_div[8]),
        .O(minusOp_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__0_i_2
       (.I0(reg_baud_div[7]),
        .O(minusOp_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__0_i_3
       (.I0(reg_baud_div[6]),
        .O(minusOp_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__0_i_4
       (.I0(reg_baud_div[5]),
        .O(minusOp_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 minusOp_carry__1
       (.CI(minusOp_carry__0_n_0),
        .CO({minusOp_carry__1_n_0,minusOp_carry__1_n_1,minusOp_carry__1_n_2,minusOp_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(reg_baud_div[12:9]),
        .O(minusOp[12:9]),
        .S({minusOp_carry__1_i_1_n_0,minusOp_carry__1_i_2_n_0,minusOp_carry__1_i_3_n_0,minusOp_carry__1_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__1_i_1
       (.I0(reg_baud_div[12]),
        .O(minusOp_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__1_i_2
       (.I0(reg_baud_div[11]),
        .O(minusOp_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__1_i_3
       (.I0(reg_baud_div[10]),
        .O(minusOp_carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__1_i_4
       (.I0(reg_baud_div[9]),
        .O(minusOp_carry__1_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 minusOp_carry__2
       (.CI(minusOp_carry__1_n_0),
        .CO({NLW_minusOp_carry__2_CO_UNCONNECTED[3:2],minusOp_carry__2_n_2,minusOp_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,reg_baud_div[14:13]}),
        .O({NLW_minusOp_carry__2_O_UNCONNECTED[3],minusOp[15:13]}),
        .S({1'b0,minusOp_carry__2_i_1_n_0,minusOp_carry__2_i_2_n_0,minusOp_carry__2_i_3_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__2_i_1
       (.I0(reg_baud_div[15]),
        .O(minusOp_carry__2_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__2_i_2
       (.I0(reg_baud_div[14]),
        .O(minusOp_carry__2_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__2_i_3
       (.I0(reg_baud_div[13]),
        .O(minusOp_carry__2_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry_i_1
       (.I0(reg_baud_div[4]),
        .O(minusOp_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry_i_2
       (.I0(reg_baud_div[3]),
        .O(minusOp_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry_i_3
       (.I0(reg_baud_div[2]),
        .O(minusOp_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry_i_4
       (.I0(reg_baud_div[1]),
        .O(minusOp_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \reg_baud_div[15]_i_1 
       (.I0(s_axi_wvalid),
        .I1(aw_en_reg_n_0),
        .I2(s_axi_awvalid),
        .I3(s_axi_awaddr[0]),
        .I4(s_axi_awaddr[1]),
        .I5(\reg_baud_div[15]_i_2_n_0 ),
        .O(reg_baud_div_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \reg_baud_div[15]_i_2 
       (.I0(\reg_baud_div[15]_i_3_n_0 ),
        .I1(\reg_baud_div[15]_i_4_n_0 ),
        .I2(s_axi_wdata[3]),
        .I3(s_axi_wdata[2]),
        .I4(s_axi_wdata[14]),
        .I5(\reg_baud_div[15]_i_5_n_0 ),
        .O(\reg_baud_div[15]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \reg_baud_div[15]_i_3 
       (.I0(s_axi_wdata[8]),
        .I1(s_axi_wdata[11]),
        .I2(s_axi_wdata[6]),
        .I3(s_axi_wdata[9]),
        .O(\reg_baud_div[15]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \reg_baud_div[15]_i_4 
       (.I0(s_axi_wdata[12]),
        .I1(s_axi_wdata[15]),
        .I2(s_axi_wdata[10]),
        .I3(s_axi_wdata[13]),
        .O(\reg_baud_div[15]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \reg_baud_div[15]_i_5 
       (.I0(s_axi_wdata[4]),
        .I1(s_axi_wdata[7]),
        .I2(s_axi_wdata[1]),
        .I3(s_axi_wdata[5]),
        .O(\reg_baud_div[15]_i_5_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \reg_baud_div_reg[0] 
       (.C(s_axi_aclk),
        .CE(reg_baud_div_0),
        .D(s_axi_wdata[0]),
        .Q(reg_baud_div[0]),
        .S(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_baud_div_reg[10] 
       (.C(s_axi_aclk),
        .CE(reg_baud_div_0),
        .D(s_axi_wdata[10]),
        .Q(reg_baud_div[10]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_baud_div_reg[11] 
       (.C(s_axi_aclk),
        .CE(reg_baud_div_0),
        .D(s_axi_wdata[11]),
        .Q(reg_baud_div[11]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_baud_div_reg[12] 
       (.C(s_axi_aclk),
        .CE(reg_baud_div_0),
        .D(s_axi_wdata[12]),
        .Q(reg_baud_div[12]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_baud_div_reg[13] 
       (.C(s_axi_aclk),
        .CE(reg_baud_div_0),
        .D(s_axi_wdata[13]),
        .Q(reg_baud_div[13]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_baud_div_reg[14] 
       (.C(s_axi_aclk),
        .CE(reg_baud_div_0),
        .D(s_axi_wdata[14]),
        .Q(reg_baud_div[14]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_baud_div_reg[15] 
       (.C(s_axi_aclk),
        .CE(reg_baud_div_0),
        .D(s_axi_wdata[15]),
        .Q(reg_baud_div[15]),
        .R(inst_uart_rx_n_1));
  FDSE #(
    .INIT(1'b1)) 
    \reg_baud_div_reg[1] 
       (.C(s_axi_aclk),
        .CE(reg_baud_div_0),
        .D(s_axi_wdata[1]),
        .Q(reg_baud_div[1]),
        .S(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_baud_div_reg[2] 
       (.C(s_axi_aclk),
        .CE(reg_baud_div_0),
        .D(s_axi_wdata[2]),
        .Q(reg_baud_div[2]),
        .R(inst_uart_rx_n_1));
  FDSE #(
    .INIT(1'b1)) 
    \reg_baud_div_reg[3] 
       (.C(s_axi_aclk),
        .CE(reg_baud_div_0),
        .D(s_axi_wdata[3]),
        .Q(reg_baud_div[3]),
        .S(inst_uart_rx_n_1));
  FDSE #(
    .INIT(1'b1)) 
    \reg_baud_div_reg[4] 
       (.C(s_axi_aclk),
        .CE(reg_baud_div_0),
        .D(s_axi_wdata[4]),
        .Q(reg_baud_div[4]),
        .S(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_baud_div_reg[5] 
       (.C(s_axi_aclk),
        .CE(reg_baud_div_0),
        .D(s_axi_wdata[5]),
        .Q(reg_baud_div[5]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_baud_div_reg[6] 
       (.C(s_axi_aclk),
        .CE(reg_baud_div_0),
        .D(s_axi_wdata[6]),
        .Q(reg_baud_div[6]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_baud_div_reg[7] 
       (.C(s_axi_aclk),
        .CE(reg_baud_div_0),
        .D(s_axi_wdata[7]),
        .Q(reg_baud_div[7]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_baud_div_reg[8] 
       (.C(s_axi_aclk),
        .CE(reg_baud_div_0),
        .D(s_axi_wdata[8]),
        .Q(reg_baud_div[8]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_baud_div_reg[9] 
       (.C(s_axi_aclk),
        .CE(reg_baud_div_0),
        .D(s_axi_wdata[9]),
        .Q(reg_baud_div[9]),
        .R(inst_uart_rx_n_1));
  LUT5 #(
    .INIT(32'h40000000)) 
    \reg_ctrl[31]_i_1 
       (.I0(s_axi_awaddr[0]),
        .I1(s_axi_awaddr[1]),
        .I2(s_axi_awvalid),
        .I3(aw_en_reg_n_0),
        .I4(s_axi_wvalid),
        .O(reg_ctrl_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[0] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[0]),
        .Q(\reg_ctrl_reg_n_0_[0] ),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[10] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[10]),
        .Q(reg_ctrl[10]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[11] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[11]),
        .Q(reg_ctrl[11]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[12] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[12]),
        .Q(reg_ctrl[12]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[13] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[13]),
        .Q(reg_ctrl[13]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[14] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[14]),
        .Q(reg_ctrl[14]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[15] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[15]),
        .Q(reg_ctrl[15]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[16] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[16]),
        .Q(reg_ctrl[16]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[17] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[17]),
        .Q(reg_ctrl[17]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[18] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[18]),
        .Q(reg_ctrl[18]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[19] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[19]),
        .Q(reg_ctrl[19]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[1] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[1]),
        .Q(p_0_in),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[20] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[20]),
        .Q(reg_ctrl[20]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[21] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[21]),
        .Q(reg_ctrl[21]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[22] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[22]),
        .Q(reg_ctrl[22]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[23] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[23]),
        .Q(reg_ctrl[23]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[24] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[24]),
        .Q(reg_ctrl[24]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[25] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[25]),
        .Q(reg_ctrl[25]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[26] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[26]),
        .Q(reg_ctrl[26]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[27] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[27]),
        .Q(reg_ctrl[27]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[28] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[28]),
        .Q(reg_ctrl[28]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[29] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[29]),
        .Q(reg_ctrl[29]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[2] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[2]),
        .Q(reg_ctrl[2]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[30] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[30]),
        .Q(reg_ctrl[30]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[31] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[31]),
        .Q(reg_ctrl[31]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[3] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[3]),
        .Q(reg_ctrl[3]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[4] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[4]),
        .Q(reg_ctrl[4]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[5] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[5]),
        .Q(reg_ctrl[5]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[6] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[6]),
        .Q(reg_ctrl[6]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[7] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[7]),
        .Q(reg_ctrl[7]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[8] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[8]),
        .Q(reg_ctrl[8]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \reg_ctrl_reg[9] 
       (.C(s_axi_aclk),
        .CE(reg_ctrl_1),
        .D(s_axi_wdata[9]),
        .Q(reg_ctrl[9]),
        .R(inst_uart_rx_n_1));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h1)) 
    rx_data_avail_i_2
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .O(rx_data_avail_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rx_data_avail_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(inst_uart_rx_n_3),
        .Q(rx_data_avail),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_latched_reg[0] 
       (.C(s_axi_aclk),
        .CE(rx_valid_pulse),
        .D(rx_data[0]),
        .Q(rx_data_latched[0]),
        .R(rx_error_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_latched_reg[1] 
       (.C(s_axi_aclk),
        .CE(rx_valid_pulse),
        .D(rx_data[1]),
        .Q(rx_data_latched[1]),
        .R(rx_error_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_latched_reg[2] 
       (.C(s_axi_aclk),
        .CE(rx_valid_pulse),
        .D(rx_data[2]),
        .Q(rx_data_latched[2]),
        .R(rx_error_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_latched_reg[3] 
       (.C(s_axi_aclk),
        .CE(rx_valid_pulse),
        .D(rx_data[3]),
        .Q(rx_data_latched[3]),
        .R(rx_error_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_latched_reg[4] 
       (.C(s_axi_aclk),
        .CE(rx_valid_pulse),
        .D(rx_data[4]),
        .Q(rx_data_latched[4]),
        .R(rx_error_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_latched_reg[5] 
       (.C(s_axi_aclk),
        .CE(rx_valid_pulse),
        .D(rx_data[5]),
        .Q(rx_data_latched[5]),
        .R(rx_error_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_latched_reg[6] 
       (.C(s_axi_aclk),
        .CE(rx_valid_pulse),
        .D(rx_data[6]),
        .Q(rx_data_latched[6]),
        .R(rx_error_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_latched_reg[7] 
       (.C(s_axi_aclk),
        .CE(rx_valid_pulse),
        .D(rx_data[7]),
        .Q(rx_data_latched[7]),
        .R(rx_error_reg_i_1_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    rx_error_reg_i_1
       (.I0(\reg_ctrl_reg_n_0_[0] ),
        .I1(s_axi_aresetn),
        .O(rx_error_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rx_error_reg_reg
       (.C(s_axi_aclk),
        .CE(rx_valid_pulse),
        .D(error_reg),
        .Q(rx_error_reg),
        .R(rx_error_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_reg[0] 
       (.C(s_axi_aclk),
        .CE(tx_data_2),
        .D(s_axi_wdata[0]),
        .Q(tx_data[0]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_reg[1] 
       (.C(s_axi_aclk),
        .CE(tx_data_2),
        .D(s_axi_wdata[1]),
        .Q(tx_data[1]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_reg[2] 
       (.C(s_axi_aclk),
        .CE(tx_data_2),
        .D(s_axi_wdata[2]),
        .Q(tx_data[2]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_reg[3] 
       (.C(s_axi_aclk),
        .CE(tx_data_2),
        .D(s_axi_wdata[3]),
        .Q(tx_data[3]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_reg[4] 
       (.C(s_axi_aclk),
        .CE(tx_data_2),
        .D(s_axi_wdata[4]),
        .Q(tx_data[4]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_reg[5] 
       (.C(s_axi_aclk),
        .CE(tx_data_2),
        .D(s_axi_wdata[5]),
        .Q(tx_data[5]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_reg[6] 
       (.C(s_axi_aclk),
        .CE(tx_data_2),
        .D(s_axi_wdata[6]),
        .Q(tx_data[6]),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_reg[7] 
       (.C(s_axi_aclk),
        .CE(tx_data_2),
        .D(s_axi_wdata[7]),
        .Q(tx_data[7]),
        .R(inst_uart_rx_n_1));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \tx_div_cnt[0]_i_1 
       (.I0(\tx_div_cnt_reg_n_0_[0] ),
        .O(\tx_div_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \tx_div_cnt[1]_i_1 
       (.I0(\tx_div_cnt_reg_n_0_[1] ),
        .I1(\tx_div_cnt_reg_n_0_[0] ),
        .O(\tx_div_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \tx_div_cnt[2]_i_1 
       (.I0(\tx_div_cnt_reg_n_0_[0] ),
        .I1(\tx_div_cnt_reg_n_0_[1] ),
        .I2(\tx_div_cnt_reg_n_0_[2] ),
        .O(\tx_div_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \tx_div_cnt[3]_i_1 
       (.I0(\tx_div_cnt_reg_n_0_[1] ),
        .I1(\tx_div_cnt_reg_n_0_[0] ),
        .I2(\tx_div_cnt_reg_n_0_[2] ),
        .I3(\tx_div_cnt_reg_n_0_[3] ),
        .O(\tx_div_cnt[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tx_div_cnt_reg[0] 
       (.C(s_axi_aclk),
        .CE(baud_cnt160),
        .D(\tx_div_cnt[0]_i_1_n_0 ),
        .Q(\tx_div_cnt_reg_n_0_[0] ),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \tx_div_cnt_reg[1] 
       (.C(s_axi_aclk),
        .CE(baud_cnt160),
        .D(\tx_div_cnt[1]_i_1_n_0 ),
        .Q(\tx_div_cnt_reg_n_0_[1] ),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \tx_div_cnt_reg[2] 
       (.C(s_axi_aclk),
        .CE(baud_cnt160),
        .D(\tx_div_cnt[2]_i_1_n_0 ),
        .Q(\tx_div_cnt_reg_n_0_[2] ),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \tx_div_cnt_reg[3] 
       (.C(s_axi_aclk),
        .CE(baud_cnt160),
        .D(\tx_div_cnt[3]_i_1_n_0 ),
        .Q(\tx_div_cnt_reg_n_0_[3] ),
        .R(inst_uart_rx_n_1));
  FDRE #(
    .INIT(1'b0)) 
    tx_start_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(inst_uart_tx_n_2),
        .Q(tx_start),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "uart_rx" *) 
module system_axi_uart_0_0_uart_rx
   (E,
    SR,
    error_reg,
    rx_data_avail_reg,
    Q,
    raw_rxd,
    s_axi_aclk,
    baud_tick_16,
    s_axi_aresetn,
    rx_data_avail,
    rx_data_avail_reg_0,
    s_axi_arvalid,
    rx_data_avail_reg_1,
    rx_data_avail_reg_2);
  output [0:0]E;
  output [0:0]SR;
  output error_reg;
  output rx_data_avail_reg;
  output [7:0]Q;
  input raw_rxd;
  input s_axi_aclk;
  input baud_tick_16;
  input s_axi_aresetn;
  input rx_data_avail;
  input rx_data_avail_reg_0;
  input s_axi_arvalid;
  input rx_data_avail_reg_1;
  input [0:0]rx_data_avail_reg_2;

  wire [0:0]E;
  wire \FSM_sequential_state[0]_i_1__0_n_0 ;
  wire \FSM_sequential_state[0]_i_2__0_n_0 ;
  wire \FSM_sequential_state[1]_i_1__0_n_0 ;
  wire \FSM_sequential_state[1]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_3_n_0 ;
  wire [7:0]Q;
  wire [0:0]SR;
  wire baud_tick_16;
  wire [0:0]bit_idx;
  wire \bit_idx[0]_i_1_n_0 ;
  wire \bit_idx[1]_i_1_n_0 ;
  wire \bit_idx[2]_i_1_n_0 ;
  wire \bit_idx[2]_i_2_n_0 ;
  wire \bit_idx_reg_n_0_[0] ;
  wire \bit_idx_reg_n_0_[1] ;
  wire \bit_idx_reg_n_0_[2] ;
  wire error_reg;
  wire error_reg_i_1_n_0;
  wire raw_rxd;
  wire rx_data_avail;
  wire rx_data_avail_reg;
  wire rx_data_avail_reg_0;
  wire rx_data_avail_reg_1;
  wire [0:0]rx_data_avail_reg_2;
  wire [7:0]rx_shreg;
  wire [0:0]rx_shreg_0;
  wire rxd_reg;
  wire rxd_sync2_reg_srl2_n_0;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire s_axi_arvalid;
  wire [0:0]sample_cnt;
  wire \sample_cnt[0]_i_1_n_0 ;
  wire \sample_cnt[1]_i_1_n_0 ;
  wire \sample_cnt[2]_i_1_n_0 ;
  wire \sample_cnt[2]_i_2_n_0 ;
  wire \sample_cnt[3]_i_2_n_0 ;
  wire \sample_cnt[3]_i_3_n_0 ;
  wire \sample_cnt_reg_n_0_[0] ;
  wire \sample_cnt_reg_n_0_[1] ;
  wire \sample_cnt_reg_n_0_[2] ;
  wire \sample_cnt_reg_n_0_[3] ;
  wire [1:0]state;
  wire valid_reg_i_1_n_0;

  LUT6 #(
    .INIT(64'h3300550F33CC550F)) 
    \FSM_sequential_state[0]_i_1__0 
       (.I0(\FSM_sequential_state[1]_i_2_n_0 ),
        .I1(\FSM_sequential_state[1]_i_3_n_0 ),
        .I2(rxd_reg),
        .I3(state[0]),
        .I4(state[1]),
        .I5(\FSM_sequential_state[0]_i_2__0_n_0 ),
        .O(\FSM_sequential_state[0]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \FSM_sequential_state[0]_i_2__0 
       (.I0(\bit_idx_reg_n_0_[1] ),
        .I1(\bit_idx_reg_n_0_[0] ),
        .I2(\bit_idx_reg_n_0_[2] ),
        .O(\FSM_sequential_state[0]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h33FF0A00)) 
    \FSM_sequential_state[1]_i_1__0 
       (.I0(\FSM_sequential_state[1]_i_2_n_0 ),
        .I1(\FSM_sequential_state[1]_i_3_n_0 ),
        .I2(rxd_reg),
        .I3(state[0]),
        .I4(state[1]),
        .O(\FSM_sequential_state[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00008000)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(baud_tick_16),
        .I1(\sample_cnt_reg_n_0_[2] ),
        .I2(\sample_cnt_reg_n_0_[1] ),
        .I3(\sample_cnt_reg_n_0_[0] ),
        .I4(\sample_cnt_reg_n_0_[3] ),
        .O(\FSM_sequential_state[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \FSM_sequential_state[1]_i_3 
       (.I0(\sample_cnt_reg_n_0_[0] ),
        .I1(\sample_cnt_reg_n_0_[1] ),
        .I2(\sample_cnt_reg_n_0_[2] ),
        .I3(\sample_cnt_reg_n_0_[3] ),
        .I4(baud_tick_16),
        .O(\FSM_sequential_state[1]_i_3_n_0 ));
  (* FSM_ENCODED_STATES = "start_bit:01,idle:00,data_bits:10,stop_bit:11" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state[0]_i_1__0_n_0 ),
        .Q(state[0]),
        .R(SR));
  (* FSM_ENCODED_STATES = "start_bit:01,idle:00,data_bits:10,stop_bit:11" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state[1]_i_1__0_n_0 ),
        .Q(state[1]),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s_axi_aresetn),
        .O(SR));
  LUT5 #(
    .INIT(32'h88FFF800)) 
    \bit_idx[0]_i_1 
       (.I0(state[0]),
        .I1(rxd_reg),
        .I2(state[1]),
        .I3(bit_idx),
        .I4(\bit_idx_reg_n_0_[0] ),
        .O(\bit_idx[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88F8FFFFF8880000)) 
    \bit_idx[1]_i_1 
       (.I0(state[0]),
        .I1(rxd_reg),
        .I2(state[1]),
        .I3(\bit_idx_reg_n_0_[0] ),
        .I4(bit_idx),
        .I5(\bit_idx_reg_n_0_[1] ),
        .O(\bit_idx[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBFAAFFFFEAAA0000)) 
    \bit_idx[2]_i_1 
       (.I0(\bit_idx[2]_i_2_n_0 ),
        .I1(\bit_idx_reg_n_0_[1] ),
        .I2(\bit_idx_reg_n_0_[0] ),
        .I3(state[1]),
        .I4(bit_idx),
        .I5(\bit_idx_reg_n_0_[2] ),
        .O(\bit_idx[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bit_idx[2]_i_2 
       (.I0(rxd_reg),
        .I1(state[0]),
        .O(\bit_idx[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000F0004444FFFF)) 
    \bit_idx[2]_i_3 
       (.I0(rxd_reg),
        .I1(\FSM_sequential_state[1]_i_2_n_0 ),
        .I2(\FSM_sequential_state[1]_i_3_n_0 ),
        .I3(\FSM_sequential_state[0]_i_2__0_n_0 ),
        .I4(state[0]),
        .I5(state[1]),
        .O(bit_idx));
  FDRE #(
    .INIT(1'b0)) 
    \bit_idx_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\bit_idx[0]_i_1_n_0 ),
        .Q(\bit_idx_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \bit_idx_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\bit_idx[1]_i_1_n_0 ),
        .Q(\bit_idx_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \bit_idx_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\bit_idx[2]_i_1_n_0 ),
        .Q(\bit_idx_reg_n_0_[2] ),
        .R(SR));
  LUT5 #(
    .INIT(32'h7FFF4000)) 
    error_reg_i_1
       (.I0(rxd_reg),
        .I1(\FSM_sequential_state[1]_i_3_n_0 ),
        .I2(state[1]),
        .I3(state[0]),
        .I4(error_reg),
        .O(error_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    error_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(error_reg_i_1_n_0),
        .Q(error_reg),
        .R(SR));
  LUT6 #(
    .INIT(64'h00000000CEEEEEEE)) 
    rx_data_avail_i_1
       (.I0(rx_data_avail),
        .I1(E),
        .I2(rx_data_avail_reg_0),
        .I3(s_axi_arvalid),
        .I4(rx_data_avail_reg_1),
        .I5(rx_data_avail_reg_2),
        .O(rx_data_avail_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg_reg[0] 
       (.C(s_axi_aclk),
        .CE(valid_reg_i_1_n_0),
        .D(rx_shreg[0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg_reg[1] 
       (.C(s_axi_aclk),
        .CE(valid_reg_i_1_n_0),
        .D(rx_shreg[1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(valid_reg_i_1_n_0),
        .D(rx_shreg[2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg_reg[3] 
       (.C(s_axi_aclk),
        .CE(valid_reg_i_1_n_0),
        .D(rx_shreg[3]),
        .Q(Q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg_reg[4] 
       (.C(s_axi_aclk),
        .CE(valid_reg_i_1_n_0),
        .D(rx_shreg[4]),
        .Q(Q[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg_reg[5] 
       (.C(s_axi_aclk),
        .CE(valid_reg_i_1_n_0),
        .D(rx_shreg[5]),
        .Q(Q[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg_reg[6] 
       (.C(s_axi_aclk),
        .CE(valid_reg_i_1_n_0),
        .D(rx_shreg[6]),
        .Q(Q[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg_reg[7] 
       (.C(s_axi_aclk),
        .CE(valid_reg_i_1_n_0),
        .D(rx_shreg[7]),
        .Q(Q[7]),
        .R(SR));
  LUT5 #(
    .INIT(32'h00008000)) 
    \rx_shreg[7]_i_1 
       (.I0(baud_tick_16),
        .I1(\sample_cnt_reg_n_0_[3] ),
        .I2(\sample_cnt[3]_i_3_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .O(rx_shreg_0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_shreg_reg[0] 
       (.C(s_axi_aclk),
        .CE(rx_shreg_0),
        .D(rx_shreg[1]),
        .Q(rx_shreg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_shreg_reg[1] 
       (.C(s_axi_aclk),
        .CE(rx_shreg_0),
        .D(rx_shreg[2]),
        .Q(rx_shreg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_shreg_reg[2] 
       (.C(s_axi_aclk),
        .CE(rx_shreg_0),
        .D(rx_shreg[3]),
        .Q(rx_shreg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_shreg_reg[3] 
       (.C(s_axi_aclk),
        .CE(rx_shreg_0),
        .D(rx_shreg[4]),
        .Q(rx_shreg[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_shreg_reg[4] 
       (.C(s_axi_aclk),
        .CE(rx_shreg_0),
        .D(rx_shreg[5]),
        .Q(rx_shreg[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_shreg_reg[5] 
       (.C(s_axi_aclk),
        .CE(rx_shreg_0),
        .D(rx_shreg[6]),
        .Q(rx_shreg[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_shreg_reg[6] 
       (.C(s_axi_aclk),
        .CE(rx_shreg_0),
        .D(rx_shreg[7]),
        .Q(rx_shreg[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_shreg_reg[7] 
       (.C(s_axi_aclk),
        .CE(rx_shreg_0),
        .D(rxd_reg),
        .Q(rx_shreg[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b1)) 
    rxd_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rxd_sync2_reg_srl2_n_0),
        .Q(rxd_reg),
        .R(1'b0));
  (* srl_name = "\\U0/inst_uart_rx/rxd_sync2_reg_srl2 " *) 
  SRL16E #(
    .INIT(16'h0003)) 
    rxd_sync2_reg_srl2
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(s_axi_aclk),
        .D(raw_rxd),
        .Q(rxd_sync2_reg_srl2_n_0));
  LUT6 #(
    .INIT(64'h00200000EEEEEEEE)) 
    \sample_cnt[0]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(rxd_reg),
        .I3(\sample_cnt_reg_n_0_[3] ),
        .I4(\sample_cnt[3]_i_3_n_0 ),
        .I5(\sample_cnt_reg_n_0_[0] ),
        .O(\sample_cnt[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEEEE0EE0)) 
    \sample_cnt[1]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(\sample_cnt_reg_n_0_[0] ),
        .I3(\sample_cnt_reg_n_0_[1] ),
        .I4(\sample_cnt[2]_i_2_n_0 ),
        .O(\sample_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEEEE0EE0E0E0)) 
    \sample_cnt[2]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(\sample_cnt_reg_n_0_[2] ),
        .I3(\sample_cnt_reg_n_0_[1] ),
        .I4(\sample_cnt_reg_n_0_[0] ),
        .I5(\sample_cnt[2]_i_2_n_0 ),
        .O(\sample_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0400000000000000)) 
    \sample_cnt[2]_i_2 
       (.I0(state[1]),
        .I1(rxd_reg),
        .I2(\sample_cnt_reg_n_0_[3] ),
        .I3(\sample_cnt_reg_n_0_[0] ),
        .I4(\sample_cnt_reg_n_0_[1] ),
        .I5(\sample_cnt_reg_n_0_[2] ),
        .O(\sample_cnt[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFDFFFFF11111111)) 
    \sample_cnt[3]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(rxd_reg),
        .I3(\sample_cnt_reg_n_0_[3] ),
        .I4(\sample_cnt[3]_i_3_n_0 ),
        .I5(baud_tick_16),
        .O(sample_cnt));
  LUT5 #(
    .INIT(32'h00EAEE00)) 
    \sample_cnt[3]_i_2 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(rxd_reg),
        .I3(\sample_cnt_reg_n_0_[3] ),
        .I4(\sample_cnt[3]_i_3_n_0 ),
        .O(\sample_cnt[3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \sample_cnt[3]_i_3 
       (.I0(\sample_cnt_reg_n_0_[2] ),
        .I1(\sample_cnt_reg_n_0_[1] ),
        .I2(\sample_cnt_reg_n_0_[0] ),
        .O(\sample_cnt[3]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_cnt_reg[0] 
       (.C(s_axi_aclk),
        .CE(sample_cnt),
        .D(\sample_cnt[0]_i_1_n_0 ),
        .Q(\sample_cnt_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sample_cnt_reg[1] 
       (.C(s_axi_aclk),
        .CE(sample_cnt),
        .D(\sample_cnt[1]_i_1_n_0 ),
        .Q(\sample_cnt_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sample_cnt_reg[2] 
       (.C(s_axi_aclk),
        .CE(sample_cnt),
        .D(\sample_cnt[2]_i_1_n_0 ),
        .Q(\sample_cnt_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sample_cnt_reg[3] 
       (.C(s_axi_aclk),
        .CE(sample_cnt),
        .D(\sample_cnt[3]_i_2_n_0 ),
        .Q(\sample_cnt_reg_n_0_[3] ),
        .R(SR));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    valid_reg_i_1
       (.I0(state[0]),
        .I1(state[1]),
        .I2(\sample_cnt[3]_i_3_n_0 ),
        .I3(\sample_cnt_reg_n_0_[3] ),
        .I4(baud_tick_16),
        .I5(rxd_reg),
        .O(valid_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    valid_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(valid_reg_i_1_n_0),
        .Q(E),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "uart_tx" *) 
module system_axi_uart_0_0_uart_tx
   (uart_txd,
    E,
    s_axi_aresetn_0,
    D,
    raw_rxd,
    SR,
    s_axi_aclk,
    tx_start,
    \FSM_sequential_state_reg[0]_0 ,
    s_axi_awaddr,
    s_axi_awvalid,
    \tx_data_reg[0] ,
    s_axi_wvalid,
    s_axi_aresetn,
    axi_awready0,
    Q,
    \axi_rdata_reg[3] ,
    s_axi_araddr,
    \axi_rdata_reg[3]_0 ,
    uart_rxd,
    \shreg_reg[7]_0 );
  output uart_txd;
  output [0:0]E;
  output s_axi_aresetn_0;
  output [1:0]D;
  output raw_rxd;
  input [0:0]SR;
  input s_axi_aclk;
  input tx_start;
  input \FSM_sequential_state_reg[0]_0 ;
  input [1:0]s_axi_awaddr;
  input s_axi_awvalid;
  input \tx_data_reg[0] ;
  input s_axi_wvalid;
  input s_axi_aresetn;
  input axi_awready0;
  input [2:0]Q;
  input [1:0]\axi_rdata_reg[3] ;
  input [1:0]s_axi_araddr;
  input [1:0]\axi_rdata_reg[3]_0 ;
  input uart_rxd;
  input [7:0]\shreg_reg[7]_0 ;

  wire [1:0]D;
  wire [0:0]E;
  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[0]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state_reg[0]_0 ;
  wire [2:0]Q;
  wire [0:0]SR;
  wire axi_awready0;
  wire [1:0]\axi_rdata_reg[3] ;
  wire [1:0]\axi_rdata_reg[3]_0 ;
  wire \bit_idx[0]_i_1_n_0 ;
  wire \bit_idx[1]_i_1_n_0 ;
  wire \bit_idx[2]_i_1_n_0 ;
  wire \bit_idx_reg_n_0_[0] ;
  wire \bit_idx_reg_n_0_[1] ;
  wire \bit_idx_reg_n_0_[2] ;
  wire busy_reg;
  wire busy_reg_0;
  wire raw_rxd;
  wire s_axi_aclk;
  wire [1:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_aresetn_0;
  wire [1:0]s_axi_awaddr;
  wire s_axi_awvalid;
  wire s_axi_wvalid;
  wire [7:0]shreg;
  wire \shreg[7]_i_1_n_0 ;
  wire [7:0]\shreg_reg[7]_0 ;
  wire \shreg_reg_n_0_[0] ;
  wire \shreg_reg_n_0_[1] ;
  wire \shreg_reg_n_0_[2] ;
  wire \shreg_reg_n_0_[3] ;
  wire \shreg_reg_n_0_[4] ;
  wire \shreg_reg_n_0_[5] ;
  wire \shreg_reg_n_0_[6] ;
  wire \shreg_reg_n_0_[7] ;
  wire [1:0]state;
  wire \tx_data_reg[0] ;
  wire tx_start;
  wire txd_reg_i_1_n_0;
  wire uart_rxd;
  wire uart_txd;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h0F0FB380)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(\FSM_sequential_state[0]_i_2_n_0 ),
        .I1(state[1]),
        .I2(\FSM_sequential_state_reg[0]_0 ),
        .I3(tx_start),
        .I4(state[0]),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \FSM_sequential_state[0]_i_2 
       (.I0(\bit_idx_reg_n_0_[1] ),
        .I1(\bit_idx_reg_n_0_[2] ),
        .I2(\bit_idx_reg_n_0_[0] ),
        .O(\FSM_sequential_state[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h6C)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_0 ),
        .I1(state[1]),
        .I2(state[0]),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "idle:00,start_bit:01,data_bits:10,stop_bit:11" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]),
        .R(SR));
  (* FSM_ENCODED_STATES = "idle:00,start_bit:01,data_bits:10,stop_bit:11" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state[1]),
        .R(SR));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \axi_rdata[0]_i_1 
       (.I0(Q[0]),
        .I1(\axi_rdata_reg[3] [0]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[0]),
        .I4(\axi_rdata_reg[3]_0 [0]),
        .I5(busy_reg),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hC0AFC0A0CFAFCFA0)) 
    \axi_rdata[3]_i_1 
       (.I0(Q[2]),
        .I1(\axi_rdata_reg[3] [1]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[0]),
        .I4(\axi_rdata_reg[3]_0 [1]),
        .I5(busy_reg),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h8888CCCCA2228888)) 
    \bit_idx[0]_i_1 
       (.I0(state[1]),
        .I1(\bit_idx_reg_n_0_[0] ),
        .I2(\bit_idx_reg_n_0_[2] ),
        .I3(\bit_idx_reg_n_0_[1] ),
        .I4(\FSM_sequential_state_reg[0]_0 ),
        .I5(state[0]),
        .O(\bit_idx[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAA00FF00A288AA00)) 
    \bit_idx[1]_i_1 
       (.I0(state[1]),
        .I1(\bit_idx_reg_n_0_[0] ),
        .I2(\bit_idx_reg_n_0_[2] ),
        .I3(\bit_idx_reg_n_0_[1] ),
        .I4(\FSM_sequential_state_reg[0]_0 ),
        .I5(state[0]),
        .O(\bit_idx[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA0A0F0F0A8A0A0A0)) 
    \bit_idx[2]_i_1 
       (.I0(state[1]),
        .I1(\bit_idx_reg_n_0_[0] ),
        .I2(\bit_idx_reg_n_0_[2] ),
        .I3(\bit_idx_reg_n_0_[1] ),
        .I4(\FSM_sequential_state_reg[0]_0 ),
        .I5(state[0]),
        .O(\bit_idx[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bit_idx_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\bit_idx[0]_i_1_n_0 ),
        .Q(\bit_idx_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \bit_idx_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\bit_idx[1]_i_1_n_0 ),
        .Q(\bit_idx_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \bit_idx_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\bit_idx[2]_i_1_n_0 ),
        .Q(\bit_idx_reg_n_0_[2] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h5EFE)) 
    busy_reg_i_1
       (.I0(state[0]),
        .I1(tx_start),
        .I2(state[1]),
        .I3(\FSM_sequential_state_reg[0]_0 ),
        .O(busy_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    busy_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(busy_reg_0),
        .Q(busy_reg),
        .R(SR));
  LUT3 #(
    .INIT(8'hB8)) 
    rxd_sync2_reg_srl2_i_1
       (.I0(uart_txd),
        .I1(Q[1]),
        .I2(uart_rxd),
        .O(raw_rxd));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shreg[0]_i_1 
       (.I0(\shreg_reg_n_0_[1] ),
        .I1(state[1]),
        .I2(\shreg_reg[7]_0 [0]),
        .O(shreg[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shreg[1]_i_1 
       (.I0(\shreg_reg_n_0_[2] ),
        .I1(state[1]),
        .I2(\shreg_reg[7]_0 [1]),
        .O(shreg[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shreg[2]_i_1 
       (.I0(\shreg_reg_n_0_[3] ),
        .I1(state[1]),
        .I2(\shreg_reg[7]_0 [2]),
        .O(shreg[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shreg[3]_i_1 
       (.I0(\shreg_reg_n_0_[4] ),
        .I1(state[1]),
        .I2(\shreg_reg[7]_0 [3]),
        .O(shreg[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shreg[4]_i_1 
       (.I0(\shreg_reg_n_0_[5] ),
        .I1(state[1]),
        .I2(\shreg_reg[7]_0 [4]),
        .O(shreg[4]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shreg[5]_i_1 
       (.I0(\shreg_reg_n_0_[6] ),
        .I1(state[1]),
        .I2(\shreg_reg[7]_0 [5]),
        .O(shreg[5]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shreg[6]_i_1 
       (.I0(\shreg_reg_n_0_[7] ),
        .I1(state[1]),
        .I2(\shreg_reg[7]_0 [6]),
        .O(shreg[6]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \shreg[7]_i_1 
       (.I0(tx_start),
        .I1(state[1]),
        .I2(\FSM_sequential_state_reg[0]_0 ),
        .I3(state[0]),
        .O(\shreg[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \shreg[7]_i_2 
       (.I0(\shreg_reg[7]_0 [7]),
        .I1(state[1]),
        .O(shreg[7]));
  FDRE #(
    .INIT(1'b0)) 
    \shreg_reg[0] 
       (.C(s_axi_aclk),
        .CE(\shreg[7]_i_1_n_0 ),
        .D(shreg[0]),
        .Q(\shreg_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \shreg_reg[1] 
       (.C(s_axi_aclk),
        .CE(\shreg[7]_i_1_n_0 ),
        .D(shreg[1]),
        .Q(\shreg_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \shreg_reg[2] 
       (.C(s_axi_aclk),
        .CE(\shreg[7]_i_1_n_0 ),
        .D(shreg[2]),
        .Q(\shreg_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \shreg_reg[3] 
       (.C(s_axi_aclk),
        .CE(\shreg[7]_i_1_n_0 ),
        .D(shreg[3]),
        .Q(\shreg_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \shreg_reg[4] 
       (.C(s_axi_aclk),
        .CE(\shreg[7]_i_1_n_0 ),
        .D(shreg[4]),
        .Q(\shreg_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \shreg_reg[5] 
       (.C(s_axi_aclk),
        .CE(\shreg[7]_i_1_n_0 ),
        .D(shreg[5]),
        .Q(\shreg_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \shreg_reg[6] 
       (.C(s_axi_aclk),
        .CE(\shreg[7]_i_1_n_0 ),
        .D(shreg[6]),
        .Q(\shreg_reg_n_0_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \shreg_reg[7] 
       (.C(s_axi_aclk),
        .CE(\shreg[7]_i_1_n_0 ),
        .D(shreg[7]),
        .Q(\shreg_reg_n_0_[7] ),
        .R(SR));
  LUT6 #(
    .INIT(64'h0100000000000000)) 
    \tx_data[7]_i_1 
       (.I0(s_axi_awaddr[0]),
        .I1(s_axi_awaddr[1]),
        .I2(busy_reg),
        .I3(s_axi_awvalid),
        .I4(\tx_data_reg[0] ),
        .I5(s_axi_wvalid),
        .O(E));
  LUT5 #(
    .INIT(32'h00020000)) 
    tx_start_i_1
       (.I0(s_axi_aresetn),
        .I1(busy_reg),
        .I2(s_axi_awaddr[0]),
        .I3(s_axi_awaddr[1]),
        .I4(axi_awready0),
        .O(s_axi_aresetn_0));
  LUT5 #(
    .INIT(32'hF3BFC08F)) 
    txd_reg_i_1
       (.I0(\shreg_reg_n_0_[0] ),
        .I1(\FSM_sequential_state_reg[0]_0 ),
        .I2(state[1]),
        .I3(state[0]),
        .I4(uart_txd),
        .O(txd_reg_i_1_n_0));
  FDSE #(
    .INIT(1'b1)) 
    txd_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(txd_reg_i_1_n_0),
        .Q(uart_txd),
        .S(SR));
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
