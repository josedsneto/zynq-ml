--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2026.1 (lin64) Build 6511674 Tue Jun 16 11:01:26 MDT 2026
--Date        : Wed Nov  4 20:36:17 2026
--Host        : pop-os running 64-bit Pop!_OS 24.04 LTS
--Command     : generate_target system.bd
--Design      : system
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    i2s_lr_sel : out STD_LOGIC;
    i2s_sck : out STD_LOGIC;
    i2s_sd : in STD_LOGIC;
    i2s_ws : out STD_LOGIC;
    leds_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    lora_trig_o : out STD_LOGIC;
    lora_uart_rxd : in STD_LOGIC;
    lora_uart_txd : out STD_LOGIC;
    switches_i : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of system : entity is "system,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=system,x_ipVersion=1.00.a,x_ipLanguage=VHDL}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of system : entity is "system.hwdef";
end system;

architecture STRUCTURE of system is
  component system_processing_system7_0_0 is
  port (
    M_AXI_GP0_ARVALID : out STD_LOGIC;
    M_AXI_GP0_AWVALID : out STD_LOGIC;
    M_AXI_GP0_BREADY : out STD_LOGIC;
    M_AXI_GP0_RREADY : out STD_LOGIC;
    M_AXI_GP0_WLAST : out STD_LOGIC;
    M_AXI_GP0_WVALID : out STD_LOGIC;
    M_AXI_GP0_ARID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_AWID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_WID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ACLK : in STD_LOGIC;
    M_AXI_GP0_ARREADY : in STD_LOGIC;
    M_AXI_GP0_AWREADY : in STD_LOGIC;
    M_AXI_GP0_BVALID : in STD_LOGIC;
    M_AXI_GP0_RLAST : in STD_LOGIC;
    M_AXI_GP0_RVALID : in STD_LOGIC;
    M_AXI_GP0_WREADY : in STD_LOGIC;
    M_AXI_GP0_BID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_RID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_ARREADY : out STD_LOGIC;
    S_AXI_HP0_AWREADY : out STD_LOGIC;
    S_AXI_HP0_BVALID : out STD_LOGIC;
    S_AXI_HP0_RLAST : out STD_LOGIC;
    S_AXI_HP0_RVALID : out STD_LOGIC;
    S_AXI_HP0_WREADY : out STD_LOGIC;
    S_AXI_HP0_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_RDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP0_RCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP0_WCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP0_RACOUNT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_WACOUNT : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_ACLK : in STD_LOGIC;
    S_AXI_HP0_ARVALID : in STD_LOGIC;
    S_AXI_HP0_AWVALID : in STD_LOGIC;
    S_AXI_HP0_BREADY : in STD_LOGIC;
    S_AXI_HP0_RDISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP0_RREADY : in STD_LOGIC;
    S_AXI_HP0_WLAST : in STD_LOGIC;
    S_AXI_HP0_WRISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP0_WVALID : in STD_LOGIC;
    S_AXI_HP0_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_ARLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_AWLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_WID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_WDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP0_WSTRB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    FCLK_CLK0 : out STD_LOGIC;
    FCLK_RESET0_N : out STD_LOGIC;
    MIO : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    DDR_CAS_n : inout STD_LOGIC;
    DDR_CKE : inout STD_LOGIC;
    DDR_Clk_n : inout STD_LOGIC;
    DDR_Clk : inout STD_LOGIC;
    DDR_CS_n : inout STD_LOGIC;
    DDR_DRSTB : inout STD_LOGIC;
    DDR_ODT : inout STD_LOGIC;
    DDR_RAS_n : inout STD_LOGIC;
    DDR_WEB : inout STD_LOGIC;
    DDR_BankAddr : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_Addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_VRN : inout STD_LOGIC;
    DDR_VRP : inout STD_LOGIC;
    DDR_DM : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQ : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_DQS_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQS : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    PS_SRSTB : inout STD_LOGIC;
    PS_CLK : inout STD_LOGIC;
    PS_PORB : inout STD_LOGIC
  );
  end component system_processing_system7_0_0;
  component system_axi_cnn_accelerator_0_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component system_axi_cnn_accelerator_0_0;
  component system_axi_i2s_rx_0_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    i2s_sck : out STD_LOGIC;
    i2s_ws : out STD_LOGIC;
    i2s_sd : in STD_LOGIC;
    i2s_lr_sel : out STD_LOGIC;
    lora_trig_o : out STD_LOGIC;
    switches_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    leds_o : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component system_axi_i2s_rx_0_0;
  component system_axi_uart_0_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    uart_rxd : in STD_LOGIC;
    uart_txd : out STD_LOGIC
  );
  end component system_axi_uart_0_0;
  component system_axi_smc_gp0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    S00_AXI_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wvalid : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_rready : out STD_LOGIC;
    M01_AXI_awaddr : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M01_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_awvalid : out STD_LOGIC;
    M01_AXI_awready : in STD_LOGIC;
    M01_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_wvalid : out STD_LOGIC;
    M01_AXI_wready : in STD_LOGIC;
    M01_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_bvalid : in STD_LOGIC;
    M01_AXI_bready : out STD_LOGIC;
    M01_AXI_araddr : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M01_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_arvalid : out STD_LOGIC;
    M01_AXI_arready : in STD_LOGIC;
    M01_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_rvalid : in STD_LOGIC;
    M01_AXI_rready : out STD_LOGIC;
    M02_AXI_awaddr : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M02_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M02_AXI_awvalid : out STD_LOGIC;
    M02_AXI_awready : in STD_LOGIC;
    M02_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M02_AXI_wvalid : out STD_LOGIC;
    M02_AXI_wready : in STD_LOGIC;
    M02_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_bvalid : in STD_LOGIC;
    M02_AXI_bready : out STD_LOGIC;
    M02_AXI_araddr : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M02_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M02_AXI_arvalid : out STD_LOGIC;
    M02_AXI_arready : in STD_LOGIC;
    M02_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_rvalid : in STD_LOGIC;
    M02_AXI_rready : out STD_LOGIC
  );
  end component system_axi_smc_gp0_0;
  component system_axi_smc_hp0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wvalid : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_wlast : out STD_LOGIC;
    M00_AXI_wvalid : out STD_LOGIC;
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rlast : in STD_LOGIC;
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_rready : out STD_LOGIC
  );
  end component system_axi_smc_hp0_0;
  component system_rst_ps7_100M_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component system_rst_ps7_100M_0;
  signal axi_cnn_accelerator_0_m_axi_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_cnn_accelerator_0_m_axi_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_cnn_accelerator_0_m_axi_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_cnn_accelerator_0_m_axi_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_cnn_accelerator_0_m_axi_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_cnn_accelerator_0_m_axi_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_cnn_accelerator_0_m_axi_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_cnn_accelerator_0_m_axi_ARREADY : STD_LOGIC;
  signal axi_cnn_accelerator_0_m_axi_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_cnn_accelerator_0_m_axi_ARVALID : STD_LOGIC;
  signal axi_cnn_accelerator_0_m_axi_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_cnn_accelerator_0_m_axi_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_cnn_accelerator_0_m_axi_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_cnn_accelerator_0_m_axi_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_cnn_accelerator_0_m_axi_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_cnn_accelerator_0_m_axi_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_cnn_accelerator_0_m_axi_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_cnn_accelerator_0_m_axi_AWREADY : STD_LOGIC;
  signal axi_cnn_accelerator_0_m_axi_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_cnn_accelerator_0_m_axi_AWVALID : STD_LOGIC;
  signal axi_cnn_accelerator_0_m_axi_BREADY : STD_LOGIC;
  signal axi_cnn_accelerator_0_m_axi_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_cnn_accelerator_0_m_axi_BVALID : STD_LOGIC;
  signal axi_cnn_accelerator_0_m_axi_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_cnn_accelerator_0_m_axi_RLAST : STD_LOGIC;
  signal axi_cnn_accelerator_0_m_axi_RREADY : STD_LOGIC;
  signal axi_cnn_accelerator_0_m_axi_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_cnn_accelerator_0_m_axi_RVALID : STD_LOGIC;
  signal axi_cnn_accelerator_0_m_axi_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_cnn_accelerator_0_m_axi_WLAST : STD_LOGIC;
  signal axi_cnn_accelerator_0_m_axi_WREADY : STD_LOGIC;
  signal axi_cnn_accelerator_0_m_axi_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_cnn_accelerator_0_m_axi_WVALID : STD_LOGIC;
  signal axi_smc_gp0_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_gp0_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_smc_gp0_M00_AXI_ARREADY : STD_LOGIC;
  signal axi_smc_gp0_M00_AXI_ARVALID : STD_LOGIC;
  signal axi_smc_gp0_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_gp0_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_smc_gp0_M00_AXI_AWREADY : STD_LOGIC;
  signal axi_smc_gp0_M00_AXI_AWVALID : STD_LOGIC;
  signal axi_smc_gp0_M00_AXI_BREADY : STD_LOGIC;
  signal axi_smc_gp0_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_gp0_M00_AXI_BVALID : STD_LOGIC;
  signal axi_smc_gp0_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_smc_gp0_M00_AXI_RREADY : STD_LOGIC;
  signal axi_smc_gp0_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_gp0_M00_AXI_RVALID : STD_LOGIC;
  signal axi_smc_gp0_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_smc_gp0_M00_AXI_WREADY : STD_LOGIC;
  signal axi_smc_gp0_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_gp0_M00_AXI_WVALID : STD_LOGIC;
  signal axi_smc_gp0_M01_AXI_ARADDR : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_smc_gp0_M01_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_smc_gp0_M01_AXI_ARREADY : STD_LOGIC;
  signal axi_smc_gp0_M01_AXI_ARVALID : STD_LOGIC;
  signal axi_smc_gp0_M01_AXI_AWADDR : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_smc_gp0_M01_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_smc_gp0_M01_AXI_AWREADY : STD_LOGIC;
  signal axi_smc_gp0_M01_AXI_AWVALID : STD_LOGIC;
  signal axi_smc_gp0_M01_AXI_BREADY : STD_LOGIC;
  signal axi_smc_gp0_M01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_gp0_M01_AXI_BVALID : STD_LOGIC;
  signal axi_smc_gp0_M01_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_smc_gp0_M01_AXI_RREADY : STD_LOGIC;
  signal axi_smc_gp0_M01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_gp0_M01_AXI_RVALID : STD_LOGIC;
  signal axi_smc_gp0_M01_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_smc_gp0_M01_AXI_WREADY : STD_LOGIC;
  signal axi_smc_gp0_M01_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_gp0_M01_AXI_WVALID : STD_LOGIC;
  signal axi_smc_gp0_M02_AXI_ARADDR : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_smc_gp0_M02_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_smc_gp0_M02_AXI_ARREADY : STD_LOGIC;
  signal axi_smc_gp0_M02_AXI_ARVALID : STD_LOGIC;
  signal axi_smc_gp0_M02_AXI_AWADDR : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_smc_gp0_M02_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_smc_gp0_M02_AXI_AWREADY : STD_LOGIC;
  signal axi_smc_gp0_M02_AXI_AWVALID : STD_LOGIC;
  signal axi_smc_gp0_M02_AXI_BREADY : STD_LOGIC;
  signal axi_smc_gp0_M02_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_gp0_M02_AXI_BVALID : STD_LOGIC;
  signal axi_smc_gp0_M02_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_smc_gp0_M02_AXI_RREADY : STD_LOGIC;
  signal axi_smc_gp0_M02_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_gp0_M02_AXI_RVALID : STD_LOGIC;
  signal axi_smc_gp0_M02_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_smc_gp0_M02_AXI_WREADY : STD_LOGIC;
  signal axi_smc_gp0_M02_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_gp0_M02_AXI_WVALID : STD_LOGIC;
  signal axi_smc_hp0_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_smc_hp0_M00_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_hp0_M00_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_hp0_M00_AXI_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_hp0_M00_AXI_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_hp0_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_smc_hp0_M00_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_hp0_M00_AXI_ARREADY : STD_LOGIC;
  signal axi_smc_hp0_M00_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_smc_hp0_M00_AXI_ARVALID : STD_LOGIC;
  signal axi_smc_hp0_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_smc_hp0_M00_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_hp0_M00_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_hp0_M00_AXI_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_hp0_M00_AXI_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_hp0_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_smc_hp0_M00_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_hp0_M00_AXI_AWREADY : STD_LOGIC;
  signal axi_smc_hp0_M00_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_smc_hp0_M00_AXI_AWVALID : STD_LOGIC;
  signal axi_smc_hp0_M00_AXI_BREADY : STD_LOGIC;
  signal axi_smc_hp0_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_hp0_M00_AXI_BVALID : STD_LOGIC;
  signal axi_smc_hp0_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_smc_hp0_M00_AXI_RLAST : STD_LOGIC;
  signal axi_smc_hp0_M00_AXI_RREADY : STD_LOGIC;
  signal axi_smc_hp0_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_hp0_M00_AXI_RVALID : STD_LOGIC;
  signal axi_smc_hp0_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_smc_hp0_M00_AXI_WLAST : STD_LOGIC;
  signal axi_smc_hp0_M00_AXI_WREADY : STD_LOGIC;
  signal axi_smc_hp0_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_smc_hp0_M00_AXI_WVALID : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK0 : STD_LOGIC;
  signal processing_system7_0_FCLK_RESET0_N : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_BREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_BVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RLAST : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WLAST : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WVALID : STD_LOGIC;
  signal rst_ps7_100M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_BID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_WACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_WCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_rst_ps7_100M_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_ps7_100M_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_ps7_100M_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_ps7_100M_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of DDR_cas_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CAS_N";
  attribute X_INTERFACE_INFO of DDR_ck_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CK_N";
  attribute X_INTERFACE_INFO of DDR_ck_p : signal is "xilinx.com:interface:ddrx:1.0 DDR CK_P";
  attribute X_INTERFACE_INFO of DDR_cke : signal is "xilinx.com:interface:ddrx:1.0 DDR CKE";
  attribute X_INTERFACE_INFO of DDR_cs_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CS_N";
  attribute X_INTERFACE_INFO of DDR_odt : signal is "xilinx.com:interface:ddrx:1.0 DDR ODT";
  attribute X_INTERFACE_INFO of DDR_ras_n : signal is "xilinx.com:interface:ddrx:1.0 DDR RAS_N";
  attribute X_INTERFACE_INFO of DDR_reset_n : signal is "xilinx.com:interface:ddrx:1.0 DDR RESET_N";
  attribute X_INTERFACE_INFO of DDR_we_n : signal is "xilinx.com:interface:ddrx:1.0 DDR WE_N";
  attribute X_INTERFACE_INFO of FIXED_IO_ddr_vrn : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of FIXED_IO_ddr_vrn : signal is "Master";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of FIXED_IO_ddr_vrn : signal is "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false";
  attribute X_INTERFACE_INFO of FIXED_IO_ddr_vrp : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP";
  attribute X_INTERFACE_INFO of FIXED_IO_ps_clk : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK";
  attribute X_INTERFACE_INFO of FIXED_IO_ps_porb : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB";
  attribute X_INTERFACE_INFO of FIXED_IO_ps_srstb : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB";
  attribute X_INTERFACE_INFO of DDR_addr : signal is "xilinx.com:interface:ddrx:1.0 DDR ADDR";
  attribute X_INTERFACE_MODE of DDR_addr : signal is "Master";
  attribute X_INTERFACE_PARAMETER of DDR_addr : signal is "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250";
  attribute X_INTERFACE_INFO of DDR_ba : signal is "xilinx.com:interface:ddrx:1.0 DDR BA";
  attribute X_INTERFACE_INFO of DDR_dm : signal is "xilinx.com:interface:ddrx:1.0 DDR DM";
  attribute X_INTERFACE_INFO of DDR_dq : signal is "xilinx.com:interface:ddrx:1.0 DDR DQ";
  attribute X_INTERFACE_INFO of DDR_dqs_n : signal is "xilinx.com:interface:ddrx:1.0 DDR DQS_N";
  attribute X_INTERFACE_INFO of DDR_dqs_p : signal is "xilinx.com:interface:ddrx:1.0 DDR DQS_P";
  attribute X_INTERFACE_INFO of FIXED_IO_mio : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO";
begin
axi_cnn_accelerator_0: component system_axi_cnn_accelerator_0_0
     port map (
      m_axi_araddr(31 downto 0) => axi_cnn_accelerator_0_m_axi_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => axi_cnn_accelerator_0_m_axi_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => axi_cnn_accelerator_0_m_axi_ARCACHE(3 downto 0),
      m_axi_arlen(7 downto 0) => axi_cnn_accelerator_0_m_axi_ARLEN(7 downto 0),
      m_axi_arlock(0) => axi_cnn_accelerator_0_m_axi_ARLOCK(0),
      m_axi_arprot(2 downto 0) => axi_cnn_accelerator_0_m_axi_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => axi_cnn_accelerator_0_m_axi_ARQOS(3 downto 0),
      m_axi_arready => axi_cnn_accelerator_0_m_axi_ARREADY,
      m_axi_arsize(2 downto 0) => axi_cnn_accelerator_0_m_axi_ARSIZE(2 downto 0),
      m_axi_arvalid => axi_cnn_accelerator_0_m_axi_ARVALID,
      m_axi_awaddr(31 downto 0) => axi_cnn_accelerator_0_m_axi_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => axi_cnn_accelerator_0_m_axi_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => axi_cnn_accelerator_0_m_axi_AWCACHE(3 downto 0),
      m_axi_awlen(7 downto 0) => axi_cnn_accelerator_0_m_axi_AWLEN(7 downto 0),
      m_axi_awlock(0) => axi_cnn_accelerator_0_m_axi_AWLOCK(0),
      m_axi_awprot(2 downto 0) => axi_cnn_accelerator_0_m_axi_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => axi_cnn_accelerator_0_m_axi_AWQOS(3 downto 0),
      m_axi_awready => axi_cnn_accelerator_0_m_axi_AWREADY,
      m_axi_awsize(2 downto 0) => axi_cnn_accelerator_0_m_axi_AWSIZE(2 downto 0),
      m_axi_awvalid => axi_cnn_accelerator_0_m_axi_AWVALID,
      m_axi_bready => axi_cnn_accelerator_0_m_axi_BREADY,
      m_axi_bresp(1 downto 0) => axi_cnn_accelerator_0_m_axi_BRESP(1 downto 0),
      m_axi_bvalid => axi_cnn_accelerator_0_m_axi_BVALID,
      m_axi_rdata(63 downto 0) => axi_cnn_accelerator_0_m_axi_RDATA(63 downto 0),
      m_axi_rlast => axi_cnn_accelerator_0_m_axi_RLAST,
      m_axi_rready => axi_cnn_accelerator_0_m_axi_RREADY,
      m_axi_rresp(1 downto 0) => axi_cnn_accelerator_0_m_axi_RRESP(1 downto 0),
      m_axi_rvalid => axi_cnn_accelerator_0_m_axi_RVALID,
      m_axi_wdata(63 downto 0) => axi_cnn_accelerator_0_m_axi_WDATA(63 downto 0),
      m_axi_wlast => axi_cnn_accelerator_0_m_axi_WLAST,
      m_axi_wready => axi_cnn_accelerator_0_m_axi_WREADY,
      m_axi_wstrb(7 downto 0) => axi_cnn_accelerator_0_m_axi_WSTRB(7 downto 0),
      m_axi_wvalid => axi_cnn_accelerator_0_m_axi_WVALID,
      s_axi_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_araddr(7 downto 0) => axi_smc_gp0_M01_AXI_ARADDR(7 downto 0),
      s_axi_aresetn => rst_ps7_100M_peripheral_aresetn(0),
      s_axi_arprot(2 downto 0) => axi_smc_gp0_M01_AXI_ARPROT(2 downto 0),
      s_axi_arready => axi_smc_gp0_M01_AXI_ARREADY,
      s_axi_arvalid => axi_smc_gp0_M01_AXI_ARVALID,
      s_axi_awaddr(7 downto 0) => axi_smc_gp0_M01_AXI_AWADDR(7 downto 0),
      s_axi_awprot(2 downto 0) => axi_smc_gp0_M01_AXI_AWPROT(2 downto 0),
      s_axi_awready => axi_smc_gp0_M01_AXI_AWREADY,
      s_axi_awvalid => axi_smc_gp0_M01_AXI_AWVALID,
      s_axi_bready => axi_smc_gp0_M01_AXI_BREADY,
      s_axi_bresp(1 downto 0) => axi_smc_gp0_M01_AXI_BRESP(1 downto 0),
      s_axi_bvalid => axi_smc_gp0_M01_AXI_BVALID,
      s_axi_rdata(31 downto 0) => axi_smc_gp0_M01_AXI_RDATA(31 downto 0),
      s_axi_rready => axi_smc_gp0_M01_AXI_RREADY,
      s_axi_rresp(1 downto 0) => axi_smc_gp0_M01_AXI_RRESP(1 downto 0),
      s_axi_rvalid => axi_smc_gp0_M01_AXI_RVALID,
      s_axi_wdata(31 downto 0) => axi_smc_gp0_M01_AXI_WDATA(31 downto 0),
      s_axi_wready => axi_smc_gp0_M01_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => axi_smc_gp0_M01_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => axi_smc_gp0_M01_AXI_WVALID
    );
axi_i2s_rx_0: component system_axi_i2s_rx_0_0
     port map (
      i2s_lr_sel => i2s_lr_sel,
      i2s_sck => i2s_sck,
      i2s_sd => i2s_sd,
      i2s_ws => i2s_ws,
      leds_o(3 downto 0) => leds_o(3 downto 0),
      lora_trig_o => lora_trig_o,
      s_axi_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_araddr(7 downto 0) => axi_smc_gp0_M02_AXI_ARADDR(7 downto 0),
      s_axi_aresetn => rst_ps7_100M_peripheral_aresetn(0),
      s_axi_arprot(2 downto 0) => axi_smc_gp0_M02_AXI_ARPROT(2 downto 0),
      s_axi_arready => axi_smc_gp0_M02_AXI_ARREADY,
      s_axi_arvalid => axi_smc_gp0_M02_AXI_ARVALID,
      s_axi_awaddr(7 downto 0) => axi_smc_gp0_M02_AXI_AWADDR(7 downto 0),
      s_axi_awprot(2 downto 0) => axi_smc_gp0_M02_AXI_AWPROT(2 downto 0),
      s_axi_awready => axi_smc_gp0_M02_AXI_AWREADY,
      s_axi_awvalid => axi_smc_gp0_M02_AXI_AWVALID,
      s_axi_bready => axi_smc_gp0_M02_AXI_BREADY,
      s_axi_bresp(1 downto 0) => axi_smc_gp0_M02_AXI_BRESP(1 downto 0),
      s_axi_bvalid => axi_smc_gp0_M02_AXI_BVALID,
      s_axi_rdata(31 downto 0) => axi_smc_gp0_M02_AXI_RDATA(31 downto 0),
      s_axi_rready => axi_smc_gp0_M02_AXI_RREADY,
      s_axi_rresp(1 downto 0) => axi_smc_gp0_M02_AXI_RRESP(1 downto 0),
      s_axi_rvalid => axi_smc_gp0_M02_AXI_RVALID,
      s_axi_wdata(31 downto 0) => axi_smc_gp0_M02_AXI_WDATA(31 downto 0),
      s_axi_wready => axi_smc_gp0_M02_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => axi_smc_gp0_M02_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => axi_smc_gp0_M02_AXI_WVALID,
      switches_i(1 downto 0) => switches_i(1 downto 0)
    );
axi_smc_gp0: component system_axi_smc_gp0_0
     port map (
      M00_AXI_araddr(3 downto 0) => axi_smc_gp0_M00_AXI_ARADDR(3 downto 0),
      M00_AXI_arprot(2 downto 0) => axi_smc_gp0_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arready => axi_smc_gp0_M00_AXI_ARREADY,
      M00_AXI_arvalid => axi_smc_gp0_M00_AXI_ARVALID,
      M00_AXI_awaddr(3 downto 0) => axi_smc_gp0_M00_AXI_AWADDR(3 downto 0),
      M00_AXI_awprot(2 downto 0) => axi_smc_gp0_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awready => axi_smc_gp0_M00_AXI_AWREADY,
      M00_AXI_awvalid => axi_smc_gp0_M00_AXI_AWVALID,
      M00_AXI_bready => axi_smc_gp0_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => axi_smc_gp0_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => axi_smc_gp0_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => axi_smc_gp0_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rready => axi_smc_gp0_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => axi_smc_gp0_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => axi_smc_gp0_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => axi_smc_gp0_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wready => axi_smc_gp0_M00_AXI_WREADY,
      M00_AXI_wstrb(3 downto 0) => axi_smc_gp0_M00_AXI_WSTRB(3 downto 0),
      M00_AXI_wvalid => axi_smc_gp0_M00_AXI_WVALID,
      M01_AXI_araddr(7 downto 0) => axi_smc_gp0_M01_AXI_ARADDR(7 downto 0),
      M01_AXI_arprot(2 downto 0) => axi_smc_gp0_M01_AXI_ARPROT(2 downto 0),
      M01_AXI_arready => axi_smc_gp0_M01_AXI_ARREADY,
      M01_AXI_arvalid => axi_smc_gp0_M01_AXI_ARVALID,
      M01_AXI_awaddr(7 downto 0) => axi_smc_gp0_M01_AXI_AWADDR(7 downto 0),
      M01_AXI_awprot(2 downto 0) => axi_smc_gp0_M01_AXI_AWPROT(2 downto 0),
      M01_AXI_awready => axi_smc_gp0_M01_AXI_AWREADY,
      M01_AXI_awvalid => axi_smc_gp0_M01_AXI_AWVALID,
      M01_AXI_bready => axi_smc_gp0_M01_AXI_BREADY,
      M01_AXI_bresp(1 downto 0) => axi_smc_gp0_M01_AXI_BRESP(1 downto 0),
      M01_AXI_bvalid => axi_smc_gp0_M01_AXI_BVALID,
      M01_AXI_rdata(31 downto 0) => axi_smc_gp0_M01_AXI_RDATA(31 downto 0),
      M01_AXI_rready => axi_smc_gp0_M01_AXI_RREADY,
      M01_AXI_rresp(1 downto 0) => axi_smc_gp0_M01_AXI_RRESP(1 downto 0),
      M01_AXI_rvalid => axi_smc_gp0_M01_AXI_RVALID,
      M01_AXI_wdata(31 downto 0) => axi_smc_gp0_M01_AXI_WDATA(31 downto 0),
      M01_AXI_wready => axi_smc_gp0_M01_AXI_WREADY,
      M01_AXI_wstrb(3 downto 0) => axi_smc_gp0_M01_AXI_WSTRB(3 downto 0),
      M01_AXI_wvalid => axi_smc_gp0_M01_AXI_WVALID,
      M02_AXI_araddr(7 downto 0) => axi_smc_gp0_M02_AXI_ARADDR(7 downto 0),
      M02_AXI_arprot(2 downto 0) => axi_smc_gp0_M02_AXI_ARPROT(2 downto 0),
      M02_AXI_arready => axi_smc_gp0_M02_AXI_ARREADY,
      M02_AXI_arvalid => axi_smc_gp0_M02_AXI_ARVALID,
      M02_AXI_awaddr(7 downto 0) => axi_smc_gp0_M02_AXI_AWADDR(7 downto 0),
      M02_AXI_awprot(2 downto 0) => axi_smc_gp0_M02_AXI_AWPROT(2 downto 0),
      M02_AXI_awready => axi_smc_gp0_M02_AXI_AWREADY,
      M02_AXI_awvalid => axi_smc_gp0_M02_AXI_AWVALID,
      M02_AXI_bready => axi_smc_gp0_M02_AXI_BREADY,
      M02_AXI_bresp(1 downto 0) => axi_smc_gp0_M02_AXI_BRESP(1 downto 0),
      M02_AXI_bvalid => axi_smc_gp0_M02_AXI_BVALID,
      M02_AXI_rdata(31 downto 0) => axi_smc_gp0_M02_AXI_RDATA(31 downto 0),
      M02_AXI_rready => axi_smc_gp0_M02_AXI_RREADY,
      M02_AXI_rresp(1 downto 0) => axi_smc_gp0_M02_AXI_RRESP(1 downto 0),
      M02_AXI_rvalid => axi_smc_gp0_M02_AXI_RVALID,
      M02_AXI_wdata(31 downto 0) => axi_smc_gp0_M02_AXI_WDATA(31 downto 0),
      M02_AXI_wready => axi_smc_gp0_M02_AXI_WREADY,
      M02_AXI_wstrb(3 downto 0) => axi_smc_gp0_M02_AXI_WSTRB(3 downto 0),
      M02_AXI_wvalid => axi_smc_gp0_M02_AXI_WVALID,
      S00_AXI_araddr(31 downto 0) => processing_system7_0_M_AXI_GP0_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => processing_system7_0_M_AXI_GP0_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => processing_system7_0_M_AXI_GP0_ARCACHE(3 downto 0),
      S00_AXI_arid(11 downto 0) => processing_system7_0_M_AXI_GP0_ARID(11 downto 0),
      S00_AXI_arlen(3 downto 0) => processing_system7_0_M_AXI_GP0_ARLEN(3 downto 0),
      S00_AXI_arlock(1 downto 0) => processing_system7_0_M_AXI_GP0_ARLOCK(1 downto 0),
      S00_AXI_arprot(2 downto 0) => processing_system7_0_M_AXI_GP0_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => processing_system7_0_M_AXI_GP0_ARQOS(3 downto 0),
      S00_AXI_arready => processing_system7_0_M_AXI_GP0_ARREADY,
      S00_AXI_arsize(2 downto 0) => processing_system7_0_M_AXI_GP0_ARSIZE(2 downto 0),
      S00_AXI_arvalid => processing_system7_0_M_AXI_GP0_ARVALID,
      S00_AXI_awaddr(31 downto 0) => processing_system7_0_M_AXI_GP0_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => processing_system7_0_M_AXI_GP0_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => processing_system7_0_M_AXI_GP0_AWCACHE(3 downto 0),
      S00_AXI_awid(11 downto 0) => processing_system7_0_M_AXI_GP0_AWID(11 downto 0),
      S00_AXI_awlen(3 downto 0) => processing_system7_0_M_AXI_GP0_AWLEN(3 downto 0),
      S00_AXI_awlock(1 downto 0) => processing_system7_0_M_AXI_GP0_AWLOCK(1 downto 0),
      S00_AXI_awprot(2 downto 0) => processing_system7_0_M_AXI_GP0_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => processing_system7_0_M_AXI_GP0_AWQOS(3 downto 0),
      S00_AXI_awready => processing_system7_0_M_AXI_GP0_AWREADY,
      S00_AXI_awsize(2 downto 0) => processing_system7_0_M_AXI_GP0_AWSIZE(2 downto 0),
      S00_AXI_awvalid => processing_system7_0_M_AXI_GP0_AWVALID,
      S00_AXI_bid(11 downto 0) => processing_system7_0_M_AXI_GP0_BID(11 downto 0),
      S00_AXI_bready => processing_system7_0_M_AXI_GP0_BREADY,
      S00_AXI_bresp(1 downto 0) => processing_system7_0_M_AXI_GP0_BRESP(1 downto 0),
      S00_AXI_bvalid => processing_system7_0_M_AXI_GP0_BVALID,
      S00_AXI_rdata(31 downto 0) => processing_system7_0_M_AXI_GP0_RDATA(31 downto 0),
      S00_AXI_rid(11 downto 0) => processing_system7_0_M_AXI_GP0_RID(11 downto 0),
      S00_AXI_rlast => processing_system7_0_M_AXI_GP0_RLAST,
      S00_AXI_rready => processing_system7_0_M_AXI_GP0_RREADY,
      S00_AXI_rresp(1 downto 0) => processing_system7_0_M_AXI_GP0_RRESP(1 downto 0),
      S00_AXI_rvalid => processing_system7_0_M_AXI_GP0_RVALID,
      S00_AXI_wdata(31 downto 0) => processing_system7_0_M_AXI_GP0_WDATA(31 downto 0),
      S00_AXI_wid(11 downto 0) => processing_system7_0_M_AXI_GP0_WID(11 downto 0),
      S00_AXI_wlast => processing_system7_0_M_AXI_GP0_WLAST,
      S00_AXI_wready => processing_system7_0_M_AXI_GP0_WREADY,
      S00_AXI_wstrb(3 downto 0) => processing_system7_0_M_AXI_GP0_WSTRB(3 downto 0),
      S00_AXI_wvalid => processing_system7_0_M_AXI_GP0_WVALID,
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => rst_ps7_100M_peripheral_aresetn(0)
    );
axi_smc_hp0: component system_axi_smc_hp0_0
     port map (
      M00_AXI_araddr(31 downto 0) => axi_smc_hp0_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arburst(1 downto 0) => axi_smc_hp0_M00_AXI_ARBURST(1 downto 0),
      M00_AXI_arcache(3 downto 0) => axi_smc_hp0_M00_AXI_ARCACHE(3 downto 0),
      M00_AXI_arlen(3 downto 0) => axi_smc_hp0_M00_AXI_ARLEN(3 downto 0),
      M00_AXI_arlock(1 downto 0) => axi_smc_hp0_M00_AXI_ARLOCK(1 downto 0),
      M00_AXI_arprot(2 downto 0) => axi_smc_hp0_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arqos(3 downto 0) => axi_smc_hp0_M00_AXI_ARQOS(3 downto 0),
      M00_AXI_arready => axi_smc_hp0_M00_AXI_ARREADY,
      M00_AXI_arsize(2 downto 0) => axi_smc_hp0_M00_AXI_ARSIZE(2 downto 0),
      M00_AXI_arvalid => axi_smc_hp0_M00_AXI_ARVALID,
      M00_AXI_awaddr(31 downto 0) => axi_smc_hp0_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awburst(1 downto 0) => axi_smc_hp0_M00_AXI_AWBURST(1 downto 0),
      M00_AXI_awcache(3 downto 0) => axi_smc_hp0_M00_AXI_AWCACHE(3 downto 0),
      M00_AXI_awlen(3 downto 0) => axi_smc_hp0_M00_AXI_AWLEN(3 downto 0),
      M00_AXI_awlock(1 downto 0) => axi_smc_hp0_M00_AXI_AWLOCK(1 downto 0),
      M00_AXI_awprot(2 downto 0) => axi_smc_hp0_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awqos(3 downto 0) => axi_smc_hp0_M00_AXI_AWQOS(3 downto 0),
      M00_AXI_awready => axi_smc_hp0_M00_AXI_AWREADY,
      M00_AXI_awsize(2 downto 0) => axi_smc_hp0_M00_AXI_AWSIZE(2 downto 0),
      M00_AXI_awvalid => axi_smc_hp0_M00_AXI_AWVALID,
      M00_AXI_bready => axi_smc_hp0_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => axi_smc_hp0_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => axi_smc_hp0_M00_AXI_BVALID,
      M00_AXI_rdata(63 downto 0) => axi_smc_hp0_M00_AXI_RDATA(63 downto 0),
      M00_AXI_rlast => axi_smc_hp0_M00_AXI_RLAST,
      M00_AXI_rready => axi_smc_hp0_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => axi_smc_hp0_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => axi_smc_hp0_M00_AXI_RVALID,
      M00_AXI_wdata(63 downto 0) => axi_smc_hp0_M00_AXI_WDATA(63 downto 0),
      M00_AXI_wlast => axi_smc_hp0_M00_AXI_WLAST,
      M00_AXI_wready => axi_smc_hp0_M00_AXI_WREADY,
      M00_AXI_wstrb(7 downto 0) => axi_smc_hp0_M00_AXI_WSTRB(7 downto 0),
      M00_AXI_wvalid => axi_smc_hp0_M00_AXI_WVALID,
      S00_AXI_araddr(31 downto 0) => axi_cnn_accelerator_0_m_axi_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => axi_cnn_accelerator_0_m_axi_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => axi_cnn_accelerator_0_m_axi_ARCACHE(3 downto 0),
      S00_AXI_arlen(7 downto 0) => axi_cnn_accelerator_0_m_axi_ARLEN(7 downto 0),
      S00_AXI_arlock(0) => axi_cnn_accelerator_0_m_axi_ARLOCK(0),
      S00_AXI_arprot(2 downto 0) => axi_cnn_accelerator_0_m_axi_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => axi_cnn_accelerator_0_m_axi_ARQOS(3 downto 0),
      S00_AXI_arready => axi_cnn_accelerator_0_m_axi_ARREADY,
      S00_AXI_arsize(2 downto 0) => axi_cnn_accelerator_0_m_axi_ARSIZE(2 downto 0),
      S00_AXI_arvalid => axi_cnn_accelerator_0_m_axi_ARVALID,
      S00_AXI_awaddr(31 downto 0) => axi_cnn_accelerator_0_m_axi_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => axi_cnn_accelerator_0_m_axi_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => axi_cnn_accelerator_0_m_axi_AWCACHE(3 downto 0),
      S00_AXI_awlen(7 downto 0) => axi_cnn_accelerator_0_m_axi_AWLEN(7 downto 0),
      S00_AXI_awlock(0) => axi_cnn_accelerator_0_m_axi_AWLOCK(0),
      S00_AXI_awprot(2 downto 0) => axi_cnn_accelerator_0_m_axi_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => axi_cnn_accelerator_0_m_axi_AWQOS(3 downto 0),
      S00_AXI_awready => axi_cnn_accelerator_0_m_axi_AWREADY,
      S00_AXI_awsize(2 downto 0) => axi_cnn_accelerator_0_m_axi_AWSIZE(2 downto 0),
      S00_AXI_awvalid => axi_cnn_accelerator_0_m_axi_AWVALID,
      S00_AXI_bready => axi_cnn_accelerator_0_m_axi_BREADY,
      S00_AXI_bresp(1 downto 0) => axi_cnn_accelerator_0_m_axi_BRESP(1 downto 0),
      S00_AXI_bvalid => axi_cnn_accelerator_0_m_axi_BVALID,
      S00_AXI_rdata(63 downto 0) => axi_cnn_accelerator_0_m_axi_RDATA(63 downto 0),
      S00_AXI_rlast => axi_cnn_accelerator_0_m_axi_RLAST,
      S00_AXI_rready => axi_cnn_accelerator_0_m_axi_RREADY,
      S00_AXI_rresp(1 downto 0) => axi_cnn_accelerator_0_m_axi_RRESP(1 downto 0),
      S00_AXI_rvalid => axi_cnn_accelerator_0_m_axi_RVALID,
      S00_AXI_wdata(63 downto 0) => axi_cnn_accelerator_0_m_axi_WDATA(63 downto 0),
      S00_AXI_wlast => axi_cnn_accelerator_0_m_axi_WLAST,
      S00_AXI_wready => axi_cnn_accelerator_0_m_axi_WREADY,
      S00_AXI_wstrb(7 downto 0) => axi_cnn_accelerator_0_m_axi_WSTRB(7 downto 0),
      S00_AXI_wvalid => axi_cnn_accelerator_0_m_axi_WVALID,
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => rst_ps7_100M_peripheral_aresetn(0)
    );
axi_uart_0: component system_axi_uart_0_0
     port map (
      s_axi_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_araddr(3 downto 0) => axi_smc_gp0_M00_AXI_ARADDR(3 downto 0),
      s_axi_aresetn => rst_ps7_100M_peripheral_aresetn(0),
      s_axi_arprot(2 downto 0) => axi_smc_gp0_M00_AXI_ARPROT(2 downto 0),
      s_axi_arready => axi_smc_gp0_M00_AXI_ARREADY,
      s_axi_arvalid => axi_smc_gp0_M00_AXI_ARVALID,
      s_axi_awaddr(3 downto 0) => axi_smc_gp0_M00_AXI_AWADDR(3 downto 0),
      s_axi_awprot(2 downto 0) => axi_smc_gp0_M00_AXI_AWPROT(2 downto 0),
      s_axi_awready => axi_smc_gp0_M00_AXI_AWREADY,
      s_axi_awvalid => axi_smc_gp0_M00_AXI_AWVALID,
      s_axi_bready => axi_smc_gp0_M00_AXI_BREADY,
      s_axi_bresp(1 downto 0) => axi_smc_gp0_M00_AXI_BRESP(1 downto 0),
      s_axi_bvalid => axi_smc_gp0_M00_AXI_BVALID,
      s_axi_rdata(31 downto 0) => axi_smc_gp0_M00_AXI_RDATA(31 downto 0),
      s_axi_rready => axi_smc_gp0_M00_AXI_RREADY,
      s_axi_rresp(1 downto 0) => axi_smc_gp0_M00_AXI_RRESP(1 downto 0),
      s_axi_rvalid => axi_smc_gp0_M00_AXI_RVALID,
      s_axi_wdata(31 downto 0) => axi_smc_gp0_M00_AXI_WDATA(31 downto 0),
      s_axi_wready => axi_smc_gp0_M00_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => axi_smc_gp0_M00_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => axi_smc_gp0_M00_AXI_WVALID,
      uart_rxd => lora_uart_rxd,
      uart_txd => lora_uart_txd
    );
processing_system7_0: component system_processing_system7_0_0
     port map (
      DDR_Addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_BankAddr(2 downto 0) => DDR_ba(2 downto 0),
      DDR_CAS_n => DDR_cas_n,
      DDR_CKE => DDR_cke,
      DDR_CS_n => DDR_cs_n,
      DDR_Clk => DDR_ck_p,
      DDR_Clk_n => DDR_ck_n,
      DDR_DM(3 downto 0) => DDR_dm(3 downto 0),
      DDR_DQ(31 downto 0) => DDR_dq(31 downto 0),
      DDR_DQS(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_DQS_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_DRSTB => DDR_reset_n,
      DDR_ODT => DDR_odt,
      DDR_RAS_n => DDR_ras_n,
      DDR_VRN => FIXED_IO_ddr_vrn,
      DDR_VRP => FIXED_IO_ddr_vrp,
      DDR_WEB => DDR_we_n,
      FCLK_CLK0 => processing_system7_0_FCLK_CLK0,
      FCLK_RESET0_N => processing_system7_0_FCLK_RESET0_N,
      MIO(53 downto 0) => FIXED_IO_mio(53 downto 0),
      M_AXI_GP0_ACLK => processing_system7_0_FCLK_CLK0,
      M_AXI_GP0_ARADDR(31 downto 0) => processing_system7_0_M_AXI_GP0_ARADDR(31 downto 0),
      M_AXI_GP0_ARBURST(1 downto 0) => processing_system7_0_M_AXI_GP0_ARBURST(1 downto 0),
      M_AXI_GP0_ARCACHE(3 downto 0) => processing_system7_0_M_AXI_GP0_ARCACHE(3 downto 0),
      M_AXI_GP0_ARID(11 downto 0) => processing_system7_0_M_AXI_GP0_ARID(11 downto 0),
      M_AXI_GP0_ARLEN(3 downto 0) => processing_system7_0_M_AXI_GP0_ARLEN(3 downto 0),
      M_AXI_GP0_ARLOCK(1 downto 0) => processing_system7_0_M_AXI_GP0_ARLOCK(1 downto 0),
      M_AXI_GP0_ARPROT(2 downto 0) => processing_system7_0_M_AXI_GP0_ARPROT(2 downto 0),
      M_AXI_GP0_ARQOS(3 downto 0) => processing_system7_0_M_AXI_GP0_ARQOS(3 downto 0),
      M_AXI_GP0_ARREADY => processing_system7_0_M_AXI_GP0_ARREADY,
      M_AXI_GP0_ARSIZE(2 downto 0) => processing_system7_0_M_AXI_GP0_ARSIZE(2 downto 0),
      M_AXI_GP0_ARVALID => processing_system7_0_M_AXI_GP0_ARVALID,
      M_AXI_GP0_AWADDR(31 downto 0) => processing_system7_0_M_AXI_GP0_AWADDR(31 downto 0),
      M_AXI_GP0_AWBURST(1 downto 0) => processing_system7_0_M_AXI_GP0_AWBURST(1 downto 0),
      M_AXI_GP0_AWCACHE(3 downto 0) => processing_system7_0_M_AXI_GP0_AWCACHE(3 downto 0),
      M_AXI_GP0_AWID(11 downto 0) => processing_system7_0_M_AXI_GP0_AWID(11 downto 0),
      M_AXI_GP0_AWLEN(3 downto 0) => processing_system7_0_M_AXI_GP0_AWLEN(3 downto 0),
      M_AXI_GP0_AWLOCK(1 downto 0) => processing_system7_0_M_AXI_GP0_AWLOCK(1 downto 0),
      M_AXI_GP0_AWPROT(2 downto 0) => processing_system7_0_M_AXI_GP0_AWPROT(2 downto 0),
      M_AXI_GP0_AWQOS(3 downto 0) => processing_system7_0_M_AXI_GP0_AWQOS(3 downto 0),
      M_AXI_GP0_AWREADY => processing_system7_0_M_AXI_GP0_AWREADY,
      M_AXI_GP0_AWSIZE(2 downto 0) => processing_system7_0_M_AXI_GP0_AWSIZE(2 downto 0),
      M_AXI_GP0_AWVALID => processing_system7_0_M_AXI_GP0_AWVALID,
      M_AXI_GP0_BID(11 downto 0) => processing_system7_0_M_AXI_GP0_BID(11 downto 0),
      M_AXI_GP0_BREADY => processing_system7_0_M_AXI_GP0_BREADY,
      M_AXI_GP0_BRESP(1 downto 0) => processing_system7_0_M_AXI_GP0_BRESP(1 downto 0),
      M_AXI_GP0_BVALID => processing_system7_0_M_AXI_GP0_BVALID,
      M_AXI_GP0_RDATA(31 downto 0) => processing_system7_0_M_AXI_GP0_RDATA(31 downto 0),
      M_AXI_GP0_RID(11 downto 0) => processing_system7_0_M_AXI_GP0_RID(11 downto 0),
      M_AXI_GP0_RLAST => processing_system7_0_M_AXI_GP0_RLAST,
      M_AXI_GP0_RREADY => processing_system7_0_M_AXI_GP0_RREADY,
      M_AXI_GP0_RRESP(1 downto 0) => processing_system7_0_M_AXI_GP0_RRESP(1 downto 0),
      M_AXI_GP0_RVALID => processing_system7_0_M_AXI_GP0_RVALID,
      M_AXI_GP0_WDATA(31 downto 0) => processing_system7_0_M_AXI_GP0_WDATA(31 downto 0),
      M_AXI_GP0_WID(11 downto 0) => processing_system7_0_M_AXI_GP0_WID(11 downto 0),
      M_AXI_GP0_WLAST => processing_system7_0_M_AXI_GP0_WLAST,
      M_AXI_GP0_WREADY => processing_system7_0_M_AXI_GP0_WREADY,
      M_AXI_GP0_WSTRB(3 downto 0) => processing_system7_0_M_AXI_GP0_WSTRB(3 downto 0),
      M_AXI_GP0_WVALID => processing_system7_0_M_AXI_GP0_WVALID,
      PS_CLK => FIXED_IO_ps_clk,
      PS_PORB => FIXED_IO_ps_porb,
      PS_SRSTB => FIXED_IO_ps_srstb,
      S_AXI_HP0_ACLK => processing_system7_0_FCLK_CLK0,
      S_AXI_HP0_ARADDR(31 downto 0) => axi_smc_hp0_M00_AXI_ARADDR(31 downto 0),
      S_AXI_HP0_ARBURST(1 downto 0) => axi_smc_hp0_M00_AXI_ARBURST(1 downto 0),
      S_AXI_HP0_ARCACHE(3 downto 0) => axi_smc_hp0_M00_AXI_ARCACHE(3 downto 0),
      S_AXI_HP0_ARID(5 downto 0) => B"000000",
      S_AXI_HP0_ARLEN(3 downto 0) => axi_smc_hp0_M00_AXI_ARLEN(3 downto 0),
      S_AXI_HP0_ARLOCK(1 downto 0) => axi_smc_hp0_M00_AXI_ARLOCK(1 downto 0),
      S_AXI_HP0_ARPROT(2 downto 0) => axi_smc_hp0_M00_AXI_ARPROT(2 downto 0),
      S_AXI_HP0_ARQOS(3 downto 0) => axi_smc_hp0_M00_AXI_ARQOS(3 downto 0),
      S_AXI_HP0_ARREADY => axi_smc_hp0_M00_AXI_ARREADY,
      S_AXI_HP0_ARSIZE(2 downto 0) => axi_smc_hp0_M00_AXI_ARSIZE(2 downto 0),
      S_AXI_HP0_ARVALID => axi_smc_hp0_M00_AXI_ARVALID,
      S_AXI_HP0_AWADDR(31 downto 0) => axi_smc_hp0_M00_AXI_AWADDR(31 downto 0),
      S_AXI_HP0_AWBURST(1 downto 0) => axi_smc_hp0_M00_AXI_AWBURST(1 downto 0),
      S_AXI_HP0_AWCACHE(3 downto 0) => axi_smc_hp0_M00_AXI_AWCACHE(3 downto 0),
      S_AXI_HP0_AWID(5 downto 0) => B"000000",
      S_AXI_HP0_AWLEN(3 downto 0) => axi_smc_hp0_M00_AXI_AWLEN(3 downto 0),
      S_AXI_HP0_AWLOCK(1 downto 0) => axi_smc_hp0_M00_AXI_AWLOCK(1 downto 0),
      S_AXI_HP0_AWPROT(2 downto 0) => axi_smc_hp0_M00_AXI_AWPROT(2 downto 0),
      S_AXI_HP0_AWQOS(3 downto 0) => axi_smc_hp0_M00_AXI_AWQOS(3 downto 0),
      S_AXI_HP0_AWREADY => axi_smc_hp0_M00_AXI_AWREADY,
      S_AXI_HP0_AWSIZE(2 downto 0) => axi_smc_hp0_M00_AXI_AWSIZE(2 downto 0),
      S_AXI_HP0_AWVALID => axi_smc_hp0_M00_AXI_AWVALID,
      S_AXI_HP0_BID(5 downto 0) => NLW_processing_system7_0_S_AXI_HP0_BID_UNCONNECTED(5 downto 0),
      S_AXI_HP0_BREADY => axi_smc_hp0_M00_AXI_BREADY,
      S_AXI_HP0_BRESP(1 downto 0) => axi_smc_hp0_M00_AXI_BRESP(1 downto 0),
      S_AXI_HP0_BVALID => axi_smc_hp0_M00_AXI_BVALID,
      S_AXI_HP0_RACOUNT(2 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RACOUNT_UNCONNECTED(2 downto 0),
      S_AXI_HP0_RCOUNT(7 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP0_RDATA(63 downto 0) => axi_smc_hp0_M00_AXI_RDATA(63 downto 0),
      S_AXI_HP0_RDISSUECAP1_EN => '0',
      S_AXI_HP0_RID(5 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RID_UNCONNECTED(5 downto 0),
      S_AXI_HP0_RLAST => axi_smc_hp0_M00_AXI_RLAST,
      S_AXI_HP0_RREADY => axi_smc_hp0_M00_AXI_RREADY,
      S_AXI_HP0_RRESP(1 downto 0) => axi_smc_hp0_M00_AXI_RRESP(1 downto 0),
      S_AXI_HP0_RVALID => axi_smc_hp0_M00_AXI_RVALID,
      S_AXI_HP0_WACOUNT(5 downto 0) => NLW_processing_system7_0_S_AXI_HP0_WACOUNT_UNCONNECTED(5 downto 0),
      S_AXI_HP0_WCOUNT(7 downto 0) => NLW_processing_system7_0_S_AXI_HP0_WCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP0_WDATA(63 downto 0) => axi_smc_hp0_M00_AXI_WDATA(63 downto 0),
      S_AXI_HP0_WID(5 downto 0) => B"000000",
      S_AXI_HP0_WLAST => axi_smc_hp0_M00_AXI_WLAST,
      S_AXI_HP0_WREADY => axi_smc_hp0_M00_AXI_WREADY,
      S_AXI_HP0_WRISSUECAP1_EN => '0',
      S_AXI_HP0_WSTRB(7 downto 0) => axi_smc_hp0_M00_AXI_WSTRB(7 downto 0),
      S_AXI_HP0_WVALID => axi_smc_hp0_M00_AXI_WVALID
    );
rst_ps7_100M: component system_rst_ps7_100M_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_rst_ps7_100M_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => processing_system7_0_FCLK_RESET0_N,
      interconnect_aresetn(0) => NLW_rst_ps7_100M_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_rst_ps7_100M_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => rst_ps7_100M_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_rst_ps7_100M_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => processing_system7_0_FCLK_CLK0
    );
end STRUCTURE;
