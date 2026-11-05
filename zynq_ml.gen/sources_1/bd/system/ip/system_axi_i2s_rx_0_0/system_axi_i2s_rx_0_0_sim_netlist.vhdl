-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2026.1 (lin64) Build 6511674 Tue Jun 16 11:01:26 MDT 2026
-- Date        : Wed Nov  4 20:37:08 2026
-- Host        : pop-os running 64-bit Pop!_OS 24.04 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/nectx/Dev/zynq_ml/zynq_ml.gen/sources_1/bd/system/ip/system_axi_i2s_rx_0_0/system_axi_i2s_rx_0_0_sim_netlist.vhdl
-- Design      : system_axi_i2s_rx_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_i2s_rx_0_0_axi_i2s_rx is
  port (
    s_axi_arready : out STD_LOGIC;
    leds_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bvalid_r_reg_0 : out STD_LOGIC;
    i2s_ws : out STD_LOGIC;
    sck_reg_reg_0 : out STD_LOGIC;
    lora_trig_o : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    switches_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    i2s_sd : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_i2s_rx_0_0_axi_i2s_rx : entity is "axi_i2s_rx";
end system_axi_i2s_rx_0_0_axi_i2s_rx;

architecture STRUCTURE of system_axi_i2s_rx_0_0_axi_i2s_rx is
  signal \FSM_onehot_rd_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_rd_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_rd_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_rd_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_rd_state_reg_n_0_[2]\ : STD_LOGIC;
  signal \araddr_reg_reg_n_0_[5]\ : STD_LOGIC;
  signal \araddr_reg_reg_n_0_[6]\ : STD_LOGIC;
  signal \araddr_reg_reg_n_0_[7]\ : STD_LOGIC;
  signal arready_r : STD_LOGIC;
  signal aw_latched_i_1_n_0 : STD_LOGIC;
  signal aw_latched_reg_n_0 : STD_LOGIC;
  signal \awaddr_reg_reg_n_0_[6]\ : STD_LOGIC;
  signal \awaddr_reg_reg_n_0_[7]\ : STD_LOGIC;
  signal awready_r_i_1_n_0 : STD_LOGIC;
  signal bit_cnt : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal bvalid_r_i_1_n_0 : STD_LOGIC;
  signal bvalid_r_i_2_n_0 : STD_LOGIC;
  signal \^bvalid_r_reg_0\ : STD_LOGIC;
  signal fifo_clr : STD_LOGIC;
  signal fifo_clr1 : STD_LOGIC;
  signal fifo_clr_i_1_n_0 : STD_LOGIC;
  signal fifo_clr_i_2_n_0 : STD_LOGIC;
  signal \fifo_count[0]_i_10_n_0\ : STD_LOGIC;
  signal \fifo_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_count[0]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_count[0]_i_4_n_0\ : STD_LOGIC;
  signal \fifo_count[0]_i_5_n_0\ : STD_LOGIC;
  signal \fifo_count[0]_i_6_n_0\ : STD_LOGIC;
  signal \fifo_count[0]_i_7_n_0\ : STD_LOGIC;
  signal \fifo_count[0]_i_8_n_0\ : STD_LOGIC;
  signal \fifo_count[0]_i_9_n_0\ : STD_LOGIC;
  signal \fifo_count[12]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_count[12]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_count[12]_i_4_n_0\ : STD_LOGIC;
  signal \fifo_count[4]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_count[4]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_count[4]_i_4_n_0\ : STD_LOGIC;
  signal \fifo_count[4]_i_5_n_0\ : STD_LOGIC;
  signal \fifo_count[8]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_count[8]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_count[8]_i_4_n_0\ : STD_LOGIC;
  signal \fifo_count[8]_i_5_n_0\ : STD_LOGIC;
  signal fifo_count_reg : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal \fifo_count_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_count_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \fifo_count_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \fifo_count_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \fifo_count_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \fifo_count_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \fifo_count_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \fifo_count_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \fifo_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \fifo_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \fifo_count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \fifo_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \fifo_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \fifo_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \fifo_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \fifo_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \fifo_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \fifo_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \fifo_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \fifo_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \fifo_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \fifo_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \fifo_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \fifo_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \fifo_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \fifo_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \fifo_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal fifo_ram_reg_0_i_1_n_0 : STD_LOGIC;
  signal fifo_ram_reg_0_i_2_n_0 : STD_LOGIC;
  signal fifo_ram_reg_2_i_1_n_0 : STD_LOGIC;
  signal fifo_ram_reg_5_i_1_n_0 : STD_LOGIC;
  signal fifo_ram_reg_7_i_1_n_0 : STD_LOGIC;
  signal i2s_en : STD_LOGIC;
  signal i2s_en_i_1_n_0 : STD_LOGIC;
  signal \^i2s_ws\ : STD_LOGIC;
  signal \i__carry__0_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__5_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__5_i_2_n_0\ : STD_LOGIC;
  signal \i__carry_i_1_n_0\ : STD_LOGIC;
  signal \^leds_o\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal leds_reg : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \leds_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \^lora_trig_o\ : STD_LOGIC;
  signal lora_trig_r_i_1_n_0 : STD_LOGIC;
  signal nco_acc : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal next_b : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal overrun_reg : STD_LOGIC;
  signal overrun_reg_i_1_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal p_0_in0 : STD_LOGIC;
  signal p_19_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_1_in_1 : STD_LOGIC;
  signal p_2_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal pop_nonempty : STD_LOGIC;
  signal pop_nonempty_i_1_n_0 : STD_LOGIC;
  signal pop_pulse_i_1_n_0 : STD_LOGIC;
  signal pop_pulse_i_2_n_0 : STD_LOGIC;
  signal pop_pulse_reg_n_0 : STD_LOGIC;
  signal ram_rdata : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal rd_ptr : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal rd_ptr1 : STD_LOGIC;
  signal \rd_ptr[0]_i_2_n_0\ : STD_LOGIC;
  signal rd_ptr_reg : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \rd_ptr_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \rd_ptr_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \rd_ptr_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \rd_ptr_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \rd_ptr_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \rd_ptr_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \rd_ptr_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \rd_ptr_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \rd_ptr_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \rd_ptr_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \rd_ptr_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \rd_ptr_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \rd_ptr_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \rd_ptr_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \rd_ptr_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \rd_ptr_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \rd_ptr_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \rd_ptr_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \rd_ptr_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \rd_ptr_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \rd_ptr_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \rd_ptr_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \rd_ptr_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \rd_ptr_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[12]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[12]_i_1_n_1\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[12]_i_1_n_2\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[12]_i_1_n_3\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[12]_i_1_n_4\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[12]_i_1_n_5\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[12]_i_1_n_6\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[12]_i_1_n_7\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[13]_i_3_n_7\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[4]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[4]_i_1_n_1\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[4]_i_1_n_2\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[4]_i_1_n_3\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[4]_i_1_n_4\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[4]_i_1_n_5\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[4]_i_1_n_6\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[4]_i_1_n_7\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[8]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[8]_i_1_n_1\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[8]_i_1_n_2\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[8]_i_1_n_3\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[8]_i_1_n_4\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[8]_i_1_n_5\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[8]_i_1_n_6\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[8]_i_1_n_7\ : STD_LOGIC;
  signal \rd_ptr_rep[0]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_rep[13]_i_1_n_0\ : STD_LOGIC;
  signal rdata_r : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \rdata_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[0]_i_2_n_0\ : STD_LOGIC;
  signal \rdata_r[0]_i_3_n_0\ : STD_LOGIC;
  signal \rdata_r[10]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[11]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[12]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[13]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[14]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[14]_i_2_n_0\ : STD_LOGIC;
  signal \rdata_r[15]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[16]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[17]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[18]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[19]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[1]_i_2_n_0\ : STD_LOGIC;
  signal \rdata_r[1]_i_3_n_0\ : STD_LOGIC;
  signal \rdata_r[20]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[21]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[22]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[23]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[24]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[25]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[26]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[27]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[28]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[28]_i_2_n_0\ : STD_LOGIC;
  signal \rdata_r[29]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[2]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[2]_i_2_n_0\ : STD_LOGIC;
  signal \rdata_r[2]_i_3_n_0\ : STD_LOGIC;
  signal \rdata_r[2]_i_4_n_0\ : STD_LOGIC;
  signal \rdata_r[2]_i_5_n_0\ : STD_LOGIC;
  signal \rdata_r[30]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[31]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[31]_i_2_n_0\ : STD_LOGIC;
  signal \rdata_r[31]_i_3_n_0\ : STD_LOGIC;
  signal \rdata_r[31]_i_4_n_0\ : STD_LOGIC;
  signal \rdata_r[3]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[3]_i_2_n_0\ : STD_LOGIC;
  signal \rdata_r[3]_i_3_n_0\ : STD_LOGIC;
  signal \rdata_r[4]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[4]_i_2_n_0\ : STD_LOGIC;
  signal \rdata_r[5]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[5]_i_2_n_0\ : STD_LOGIC;
  signal \rdata_r[5]_i_3_n_0\ : STD_LOGIC;
  signal \rdata_r[6]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[7]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[8]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_r[9]_i_1_n_0\ : STD_LOGIC;
  signal rvalid_r_i_1_n_0 : STD_LOGIC;
  signal \^s_axi_rvalid\ : STD_LOGIC;
  signal sample_data : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \sample_data[15]_i_1_n_0\ : STD_LOGIC;
  signal \sample_data[15]_i_2_n_0\ : STD_LOGIC;
  signal \sample_data[15]_i_3_n_0\ : STD_LOGIC;
  signal sample_push : STD_LOGIC;
  signal sample_push0 : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__0_n_0\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__0_n_4\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__0_n_5\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__0_n_6\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__0_n_7\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__1_n_0\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__1_n_1\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__1_n_2\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__1_n_3\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__1_n_4\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__1_n_5\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__1_n_6\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__1_n_7\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__2_n_0\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__2_n_1\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__2_n_2\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__2_n_3\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__2_n_4\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__2_n_5\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__2_n_6\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__2_n_7\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__3_n_0\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__3_n_1\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__3_n_2\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__3_n_3\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__3_n_4\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__3_n_5\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__3_n_6\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__3_n_7\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__4_n_0\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__4_n_1\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__4_n_2\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__4_n_3\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__4_n_4\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__4_n_5\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__4_n_6\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__4_n_7\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__5_n_0\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__5_n_1\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__5_n_2\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__5_n_3\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__5_n_4\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__5_n_5\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__5_n_6\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__5_n_7\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__6_n_0\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__6_n_1\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__6_n_2\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__6_n_3\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__6_n_4\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__6_n_5\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__6_n_6\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry__6_n_7\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry_n_4\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry_n_5\ : STD_LOGIC;
  signal \sample_push1_inferred__0/i__carry_n_6\ : STD_LOGIC;
  signal sample_push_reg_n_0 : STD_LOGIC;
  signal sck_reg_i_2_n_0 : STD_LOGIC;
  signal \^sck_reg_reg_0\ : STD_LOGIC;
  signal sd_sync1 : STD_LOGIC;
  signal sd_sync2 : STD_LOGIC;
  signal sel0 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal shift_reg : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal shift_reg_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \shift_reg_reg_n_0_[10]\ : STD_LOGIC;
  signal \shift_reg_reg_n_0_[11]\ : STD_LOGIC;
  signal \shift_reg_reg_n_0_[12]\ : STD_LOGIC;
  signal \shift_reg_reg_n_0_[13]\ : STD_LOGIC;
  signal \shift_reg_reg_n_0_[14]\ : STD_LOGIC;
  signal \shift_reg_reg_n_0_[15]\ : STD_LOGIC;
  signal \shift_reg_reg_n_0_[16]\ : STD_LOGIC;
  signal \shift_reg_reg_n_0_[17]\ : STD_LOGIC;
  signal \shift_reg_reg_n_0_[18]\ : STD_LOGIC;
  signal \shift_reg_reg_n_0_[19]\ : STD_LOGIC;
  signal \shift_reg_reg_n_0_[20]\ : STD_LOGIC;
  signal \shift_reg_reg_n_0_[21]\ : STD_LOGIC;
  signal \shift_reg_reg_n_0_[22]\ : STD_LOGIC;
  signal \shift_reg_reg_n_0_[7]\ : STD_LOGIC;
  signal \shift_reg_reg_n_0_[8]\ : STD_LOGIC;
  signal \shift_reg_reg_n_0_[9]\ : STD_LOGIC;
  signal sw_sync1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal sw_sync2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \total_cnt[0]_i_2_n_0\ : STD_LOGIC;
  signal total_cnt_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \total_cnt_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \total_cnt_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \total_cnt_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \total_cnt_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \total_cnt_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \total_cnt_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \total_cnt_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \total_cnt_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \total_cnt_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \total_cnt_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \total_cnt_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \total_cnt_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \total_cnt_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \total_cnt_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \total_cnt_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \total_cnt_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \total_cnt_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \total_cnt_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \total_cnt_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \total_cnt_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \total_cnt_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \total_cnt_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \total_cnt_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \total_cnt_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \total_cnt_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \total_cnt_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \total_cnt_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \total_cnt_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \total_cnt_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \total_cnt_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \total_cnt_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \total_cnt_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \total_cnt_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \total_cnt_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \total_cnt_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \total_cnt_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \total_cnt_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \total_cnt_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \total_cnt_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \total_cnt_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \total_cnt_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \total_cnt_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \total_cnt_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \total_cnt_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \total_cnt_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \total_cnt_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \total_cnt_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \total_cnt_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \total_cnt_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \total_cnt_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \total_cnt_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \total_cnt_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \total_cnt_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \total_cnt_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \total_cnt_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \total_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \total_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \total_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \total_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \total_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \total_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \total_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \total_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal w_latched_i_1_n_0 : STD_LOGIC;
  signal w_latched_reg_n_0 : STD_LOGIC;
  signal \wdata_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \wdata_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal \wdata_reg_reg_n_0_[3]\ : STD_LOGIC;
  signal \wr_ptr[0]_i_2_n_0\ : STD_LOGIC;
  signal wr_ptr_reg : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \wr_ptr_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \wr_ptr_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \wr_ptr_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \wr_ptr_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \wr_ptr_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \wr_ptr_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \wr_ptr_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \wr_ptr_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \wr_ptr_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \wr_ptr_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \wr_ptr_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \wr_ptr_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \wr_ptr_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \wr_ptr_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \wr_ptr_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \wr_ptr_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \wr_ptr_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \wr_ptr_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \wr_ptr_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \wr_ptr_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \wr_ptr_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \wr_ptr_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \wr_ptr_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \wr_ptr_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal wready_r_i_1_n_0 : STD_LOGIC;
  signal ws_reg0_out : STD_LOGIC;
  signal ws_reg_i_1_n_0 : STD_LOGIC;
  signal \NLW_fifo_count_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_fifo_count_reg[12]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_fifo_ram_reg_0_CASCADEOUTA_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_0_CASCADEOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_0_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_0_INJECTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_0_INJECTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_0_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_0_DOADO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_fifo_ram_reg_0_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 2 );
  signal NLW_fifo_ram_reg_0_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_ram_reg_0_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_ram_reg_0_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_ram_reg_0_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_fifo_ram_reg_1_CASCADEOUTA_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_1_CASCADEOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_1_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_1_INJECTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_1_INJECTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_1_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_1_DOADO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_fifo_ram_reg_1_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 2 );
  signal NLW_fifo_ram_reg_1_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_ram_reg_1_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_ram_reg_1_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_ram_reg_1_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_fifo_ram_reg_2_CASCADEOUTA_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_2_CASCADEOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_2_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_2_INJECTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_2_INJECTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_2_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_2_DOADO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_fifo_ram_reg_2_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 2 );
  signal NLW_fifo_ram_reg_2_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_ram_reg_2_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_ram_reg_2_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_ram_reg_2_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_fifo_ram_reg_3_CASCADEOUTA_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_3_CASCADEOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_3_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_3_INJECTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_3_INJECTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_3_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_3_DOADO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_fifo_ram_reg_3_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 2 );
  signal NLW_fifo_ram_reg_3_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_ram_reg_3_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_ram_reg_3_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_ram_reg_3_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_fifo_ram_reg_4_CASCADEOUTA_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_4_CASCADEOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_4_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_4_INJECTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_4_INJECTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_4_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_4_DOADO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_fifo_ram_reg_4_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 2 );
  signal NLW_fifo_ram_reg_4_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_ram_reg_4_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_ram_reg_4_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_ram_reg_4_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_fifo_ram_reg_5_CASCADEOUTA_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_5_CASCADEOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_5_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_5_INJECTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_5_INJECTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_5_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_5_DOADO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_fifo_ram_reg_5_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 2 );
  signal NLW_fifo_ram_reg_5_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_ram_reg_5_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_ram_reg_5_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_ram_reg_5_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_fifo_ram_reg_6_CASCADEOUTA_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_6_CASCADEOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_6_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_6_INJECTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_6_INJECTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_6_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_6_DOADO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_fifo_ram_reg_6_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 2 );
  signal NLW_fifo_ram_reg_6_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_ram_reg_6_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_ram_reg_6_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_ram_reg_6_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_fifo_ram_reg_7_CASCADEOUTA_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_7_CASCADEOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_7_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_7_INJECTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_7_INJECTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_7_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_7_DOADO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_fifo_ram_reg_7_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 2 );
  signal NLW_fifo_ram_reg_7_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_ram_reg_7_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_ram_reg_7_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_ram_reg_7_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_rd_ptr_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_rd_ptr_reg[12]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_rd_ptr_reg_rep[13]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_rd_ptr_reg_rep[13]_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_sample_push1_inferred__0/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_sck_reg_reg_i_3_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_sck_reg_reg_i_3_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_total_cnt_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_wr_ptr_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_wr_ptr_reg[12]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_rd_state[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FSM_onehot_rd_state[2]_i_1\ : label is "soft_lutpair1";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_rd_state_reg[0]\ : label is "rd_idle:001,rd_bram_wait:010,rd_resp:100,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_rd_state_reg[1]\ : label is "rd_idle:001,rd_bram_wait:010,rd_resp:100,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_rd_state_reg[2]\ : label is "rd_idle:001,rd_bram_wait:010,rd_resp:100,";
  attribute SOFT_HLUTNM of aw_latched_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \bit_cnt[0]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \bit_cnt[1]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \bit_cnt[2]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \bit_cnt[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \bit_cnt[4]_i_1\ : label is "soft_lutpair2";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \fifo_count_reg[0]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \fifo_count_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \fifo_count_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \fifo_count_reg[8]_i_1\ : label is 35;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of fifo_ram_reg_0 : label is "p0_d2";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of fifo_ram_reg_0 : label is "p0_d2";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of fifo_ram_reg_0 : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of fifo_ram_reg_0 : label is 262144;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of fifo_ram_reg_0 : label is "system_axi_i2s_rx_0_0/U0/fifo_ram_reg";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of fifo_ram_reg_0 : label is "block";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of fifo_ram_reg_0 : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of fifo_ram_reg_0 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of fifo_ram_reg_0 : label is 16383;
  attribute ram_offset : integer;
  attribute ram_offset of fifo_ram_reg_0 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of fifo_ram_reg_0 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of fifo_ram_reg_0 : label is 1;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of fifo_ram_reg_1 : label is "p0_d2";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of fifo_ram_reg_1 : label is "p0_d2";
  attribute METHODOLOGY_DRC_VIOS of fifo_ram_reg_1 : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS of fifo_ram_reg_1 : label is 262144;
  attribute RTL_RAM_NAME of fifo_ram_reg_1 : label is "system_axi_i2s_rx_0_0/U0/fifo_ram_reg";
  attribute RTL_RAM_STYLE of fifo_ram_reg_1 : label is "block";
  attribute RTL_RAM_TYPE of fifo_ram_reg_1 : label is "RAM_SDP";
  attribute ram_addr_begin of fifo_ram_reg_1 : label is 0;
  attribute ram_addr_end of fifo_ram_reg_1 : label is 16383;
  attribute ram_offset of fifo_ram_reg_1 : label is 0;
  attribute ram_slice_begin of fifo_ram_reg_1 : label is 2;
  attribute ram_slice_end of fifo_ram_reg_1 : label is 3;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of fifo_ram_reg_2 : label is "p0_d2";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of fifo_ram_reg_2 : label is "p0_d2";
  attribute METHODOLOGY_DRC_VIOS of fifo_ram_reg_2 : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS of fifo_ram_reg_2 : label is 262144;
  attribute RTL_RAM_NAME of fifo_ram_reg_2 : label is "system_axi_i2s_rx_0_0/U0/fifo_ram_reg";
  attribute RTL_RAM_STYLE of fifo_ram_reg_2 : label is "block";
  attribute RTL_RAM_TYPE of fifo_ram_reg_2 : label is "RAM_SDP";
  attribute ram_addr_begin of fifo_ram_reg_2 : label is 0;
  attribute ram_addr_end of fifo_ram_reg_2 : label is 16383;
  attribute ram_offset of fifo_ram_reg_2 : label is 0;
  attribute ram_slice_begin of fifo_ram_reg_2 : label is 4;
  attribute ram_slice_end of fifo_ram_reg_2 : label is 5;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of fifo_ram_reg_3 : label is "p0_d2";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of fifo_ram_reg_3 : label is "p0_d2";
  attribute METHODOLOGY_DRC_VIOS of fifo_ram_reg_3 : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS of fifo_ram_reg_3 : label is 262144;
  attribute RTL_RAM_NAME of fifo_ram_reg_3 : label is "system_axi_i2s_rx_0_0/U0/fifo_ram_reg";
  attribute RTL_RAM_STYLE of fifo_ram_reg_3 : label is "block";
  attribute RTL_RAM_TYPE of fifo_ram_reg_3 : label is "RAM_SDP";
  attribute ram_addr_begin of fifo_ram_reg_3 : label is 0;
  attribute ram_addr_end of fifo_ram_reg_3 : label is 16383;
  attribute ram_offset of fifo_ram_reg_3 : label is 0;
  attribute ram_slice_begin of fifo_ram_reg_3 : label is 6;
  attribute ram_slice_end of fifo_ram_reg_3 : label is 7;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of fifo_ram_reg_4 : label is "p0_d2";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of fifo_ram_reg_4 : label is "p0_d2";
  attribute METHODOLOGY_DRC_VIOS of fifo_ram_reg_4 : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS of fifo_ram_reg_4 : label is 262144;
  attribute RTL_RAM_NAME of fifo_ram_reg_4 : label is "system_axi_i2s_rx_0_0/U0/fifo_ram_reg";
  attribute RTL_RAM_STYLE of fifo_ram_reg_4 : label is "block";
  attribute RTL_RAM_TYPE of fifo_ram_reg_4 : label is "RAM_SDP";
  attribute ram_addr_begin of fifo_ram_reg_4 : label is 0;
  attribute ram_addr_end of fifo_ram_reg_4 : label is 16383;
  attribute ram_offset of fifo_ram_reg_4 : label is 0;
  attribute ram_slice_begin of fifo_ram_reg_4 : label is 8;
  attribute ram_slice_end of fifo_ram_reg_4 : label is 9;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of fifo_ram_reg_5 : label is "p0_d2";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of fifo_ram_reg_5 : label is "p0_d2";
  attribute METHODOLOGY_DRC_VIOS of fifo_ram_reg_5 : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS of fifo_ram_reg_5 : label is 262144;
  attribute RTL_RAM_NAME of fifo_ram_reg_5 : label is "system_axi_i2s_rx_0_0/U0/fifo_ram_reg";
  attribute RTL_RAM_STYLE of fifo_ram_reg_5 : label is "block";
  attribute RTL_RAM_TYPE of fifo_ram_reg_5 : label is "RAM_SDP";
  attribute ram_addr_begin of fifo_ram_reg_5 : label is 0;
  attribute ram_addr_end of fifo_ram_reg_5 : label is 16383;
  attribute ram_offset of fifo_ram_reg_5 : label is 0;
  attribute ram_slice_begin of fifo_ram_reg_5 : label is 10;
  attribute ram_slice_end of fifo_ram_reg_5 : label is 11;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of fifo_ram_reg_6 : label is "p0_d2";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of fifo_ram_reg_6 : label is "p0_d2";
  attribute METHODOLOGY_DRC_VIOS of fifo_ram_reg_6 : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS of fifo_ram_reg_6 : label is 262144;
  attribute RTL_RAM_NAME of fifo_ram_reg_6 : label is "system_axi_i2s_rx_0_0/U0/fifo_ram_reg";
  attribute RTL_RAM_STYLE of fifo_ram_reg_6 : label is "block";
  attribute RTL_RAM_TYPE of fifo_ram_reg_6 : label is "RAM_SDP";
  attribute ram_addr_begin of fifo_ram_reg_6 : label is 0;
  attribute ram_addr_end of fifo_ram_reg_6 : label is 16383;
  attribute ram_offset of fifo_ram_reg_6 : label is 0;
  attribute ram_slice_begin of fifo_ram_reg_6 : label is 12;
  attribute ram_slice_end of fifo_ram_reg_6 : label is 13;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of fifo_ram_reg_7 : label is "p0_d2";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of fifo_ram_reg_7 : label is "p0_d2";
  attribute METHODOLOGY_DRC_VIOS of fifo_ram_reg_7 : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS of fifo_ram_reg_7 : label is 262144;
  attribute RTL_RAM_NAME of fifo_ram_reg_7 : label is "system_axi_i2s_rx_0_0/U0/fifo_ram_reg";
  attribute RTL_RAM_STYLE of fifo_ram_reg_7 : label is "block";
  attribute RTL_RAM_TYPE of fifo_ram_reg_7 : label is "RAM_SDP";
  attribute ram_addr_begin of fifo_ram_reg_7 : label is 0;
  attribute ram_addr_end of fifo_ram_reg_7 : label is 16383;
  attribute ram_offset of fifo_ram_reg_7 : label is 0;
  attribute ram_slice_begin of fifo_ram_reg_7 : label is 14;
  attribute ram_slice_end of fifo_ram_reg_7 : label is 15;
  attribute SOFT_HLUTNM of i2s_en_i_1 : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \leds_reg[3]_i_3\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of lora_trig_r_i_1 : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of pop_nonempty_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of pop_pulse_i_1 : label is "soft_lutpair0";
  attribute ADDER_THRESHOLD of \rd_ptr_reg[0]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \rd_ptr_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \rd_ptr_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \rd_ptr_reg[8]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \rd_ptr_reg_rep[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \rd_ptr_reg_rep[13]_i_3\ : label is 35;
  attribute ADDER_THRESHOLD of \rd_ptr_reg_rep[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \rd_ptr_reg_rep[8]_i_1\ : label is 35;
  attribute SOFT_HLUTNM of \rdata_r[0]_i_3\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \rdata_r[15]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \rdata_r[16]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \rdata_r[17]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \rdata_r[18]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \rdata_r[19]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \rdata_r[1]_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \rdata_r[20]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \rdata_r[21]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \rdata_r[22]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \rdata_r[23]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \rdata_r[24]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \rdata_r[25]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \rdata_r[26]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \rdata_r[27]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \rdata_r[29]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \rdata_r[2]_i_4\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \rdata_r[30]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \rdata_r[31]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \rdata_r[3]_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \rdata_r[4]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \rdata_r[5]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \sample_data[15]_i_3\ : label is "soft_lutpair11";
  attribute ADDER_THRESHOLD of \total_cnt_reg[0]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \total_cnt_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \total_cnt_reg[16]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \total_cnt_reg[20]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \total_cnt_reg[24]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \total_cnt_reg[28]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \total_cnt_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \total_cnt_reg[8]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \wr_ptr_reg[0]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \wr_ptr_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \wr_ptr_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \wr_ptr_reg[8]_i_1\ : label is 35;
begin
  bvalid_r_reg_0 <= \^bvalid_r_reg_0\;
  i2s_ws <= \^i2s_ws\;
  leds_o(3 downto 0) <= \^leds_o\(3 downto 0);
  lora_trig_o <= \^lora_trig_o\;
  s_axi_rvalid <= \^s_axi_rvalid\;
  sck_reg_reg_0 <= \^sck_reg_reg_0\;
\FSM_onehot_rd_state[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F5E0E0"
    )
        port map (
      I0 => rdata_r(0),
      I1 => s_axi_rready,
      I2 => \FSM_onehot_rd_state_reg_n_0_[2]\,
      I3 => s_axi_arvalid,
      I4 => \FSM_onehot_rd_state_reg_n_0_[0]\,
      O => \FSM_onehot_rd_state[0]_i_1_n_0\
    );
\FSM_onehot_rd_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEA0000"
    )
        port map (
      I0 => rdata_r(0),
      I1 => s_axi_rready,
      I2 => \FSM_onehot_rd_state_reg_n_0_[2]\,
      I3 => s_axi_arvalid,
      I4 => \FSM_onehot_rd_state_reg_n_0_[0]\,
      O => \FSM_onehot_rd_state[1]_i_1_n_0\
    );
\FSM_onehot_rd_state[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AABABABA"
    )
        port map (
      I0 => rdata_r(0),
      I1 => s_axi_rready,
      I2 => \FSM_onehot_rd_state_reg_n_0_[2]\,
      I3 => s_axi_arvalid,
      I4 => \FSM_onehot_rd_state_reg_n_0_[0]\,
      O => \FSM_onehot_rd_state[2]_i_1_n_0\
    );
\FSM_onehot_rd_state_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_rd_state[0]_i_1_n_0\,
      Q => \FSM_onehot_rd_state_reg_n_0_[0]\,
      S => bvalid_r_i_1_n_0
    );
\FSM_onehot_rd_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_rd_state[1]_i_1_n_0\,
      Q => rdata_r(0),
      R => bvalid_r_i_1_n_0
    );
\FSM_onehot_rd_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_rd_state[2]_i_1_n_0\,
      Q => \FSM_onehot_rd_state_reg_n_0_[2]\,
      R => bvalid_r_i_1_n_0
    );
\araddr_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => arready_r,
      D => s_axi_araddr(0),
      Q => sel0(0),
      R => bvalid_r_i_1_n_0
    );
\araddr_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => arready_r,
      D => s_axi_araddr(1),
      Q => sel0(1),
      R => bvalid_r_i_1_n_0
    );
\araddr_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => arready_r,
      D => s_axi_araddr(2),
      Q => sel0(2),
      R => bvalid_r_i_1_n_0
    );
\araddr_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => arready_r,
      D => s_axi_araddr(3),
      Q => \araddr_reg_reg_n_0_[5]\,
      R => bvalid_r_i_1_n_0
    );
\araddr_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => arready_r,
      D => s_axi_araddr(4),
      Q => \araddr_reg_reg_n_0_[6]\,
      R => bvalid_r_i_1_n_0
    );
\araddr_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => arready_r,
      D => s_axi_araddr(5),
      Q => \araddr_reg_reg_n_0_[7]\,
      R => bvalid_r_i_1_n_0
    );
arready_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_rd_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      O => arready_r
    );
arready_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => arready_r,
      Q => s_axi_arready,
      R => bvalid_r_i_1_n_0
    );
aw_latched_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0CC0808"
    )
        port map (
      I0 => s_axi_awvalid,
      I1 => s_axi_aresetn,
      I2 => \^bvalid_r_reg_0\,
      I3 => w_latched_reg_n_0,
      I4 => aw_latched_reg_n_0,
      O => aw_latched_i_1_n_0
    );
aw_latched_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => aw_latched_i_1_n_0,
      Q => aw_latched_reg_n_0,
      R => '0'
    );
\awaddr_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => awready_r_i_1_n_0,
      D => s_axi_awaddr(0),
      Q => p_0_in(0),
      R => '0'
    );
\awaddr_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => awready_r_i_1_n_0,
      D => s_axi_awaddr(1),
      Q => p_0_in(1),
      R => '0'
    );
\awaddr_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => awready_r_i_1_n_0,
      D => s_axi_awaddr(2),
      Q => p_0_in(2),
      R => '0'
    );
\awaddr_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => awready_r_i_1_n_0,
      D => s_axi_awaddr(3),
      Q => p_0_in0,
      R => '0'
    );
\awaddr_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => awready_r_i_1_n_0,
      D => s_axi_awaddr(4),
      Q => \awaddr_reg_reg_n_0_[6]\,
      R => '0'
    );
\awaddr_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => awready_r_i_1_n_0,
      D => s_axi_awaddr(5),
      Q => \awaddr_reg_reg_n_0_[7]\,
      R => '0'
    );
awready_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => aw_latched_reg_n_0,
      I1 => s_axi_awvalid,
      I2 => s_axi_aresetn,
      I3 => \^bvalid_r_reg_0\,
      O => awready_r_i_1_n_0
    );
awready_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => awready_r_i_1_n_0,
      Q => s_axi_awready,
      R => '0'
    );
\bit_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bit_cnt(0),
      O => next_b(0)
    );
\bit_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => bit_cnt(0),
      I1 => bit_cnt(1),
      O => next_b(1)
    );
\bit_cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => bit_cnt(1),
      I1 => bit_cnt(0),
      I2 => bit_cnt(2),
      O => next_b(2)
    );
\bit_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => bit_cnt(2),
      I1 => bit_cnt(0),
      I2 => bit_cnt(1),
      I3 => bit_cnt(3),
      O => next_b(3)
    );
\bit_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => bit_cnt(3),
      I1 => bit_cnt(1),
      I2 => bit_cnt(0),
      I3 => bit_cnt(2),
      I4 => bit_cnt(4),
      O => next_b(4)
    );
\bit_cnt[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^sck_reg_reg_0\,
      I1 => p_1_in_1,
      O => ws_reg0_out
    );
\bit_cnt[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => bit_cnt(3),
      I1 => bit_cnt(4),
      I2 => bit_cnt(1),
      I3 => bit_cnt(0),
      I4 => bit_cnt(2),
      I5 => bit_cnt(5),
      O => next_b(5)
    );
\bit_cnt_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => ws_reg0_out,
      D => next_b(0),
      Q => bit_cnt(0),
      S => sample_push0
    );
\bit_cnt_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => ws_reg0_out,
      D => next_b(1),
      Q => bit_cnt(1),
      S => sample_push0
    );
\bit_cnt_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => ws_reg0_out,
      D => next_b(2),
      Q => bit_cnt(2),
      S => sample_push0
    );
\bit_cnt_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => ws_reg0_out,
      D => next_b(3),
      Q => bit_cnt(3),
      S => sample_push0
    );
\bit_cnt_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => ws_reg0_out,
      D => next_b(4),
      Q => bit_cnt(4),
      S => sample_push0
    );
\bit_cnt_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => ws_reg0_out,
      D => next_b(5),
      Q => bit_cnt(5),
      S => sample_push0
    );
bvalid_r_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_aresetn,
      O => bvalid_r_i_1_n_0
    );
bvalid_r_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"55C0"
    )
        port map (
      I0 => s_axi_bready,
      I1 => aw_latched_reg_n_0,
      I2 => w_latched_reg_n_0,
      I3 => \^bvalid_r_reg_0\,
      O => bvalid_r_i_2_n_0
    );
bvalid_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => bvalid_r_i_2_n_0,
      Q => \^bvalid_r_reg_0\,
      R => bvalid_r_i_1_n_0
    );
fifo_clr_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000400000000000"
    )
        port map (
      I0 => \^bvalid_r_reg_0\,
      I1 => w_latched_reg_n_0,
      I2 => aw_latched_reg_n_0,
      I3 => \wdata_reg_reg_n_0_[1]\,
      I4 => p_0_in(0),
      I5 => fifo_clr_i_2_n_0,
      O => fifo_clr_i_1_n_0
    );
fifo_clr_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
        port map (
      I0 => p_0_in0,
      I1 => \awaddr_reg_reg_n_0_[6]\,
      I2 => p_0_in(1),
      I3 => p_0_in(2),
      I4 => \awaddr_reg_reg_n_0_[7]\,
      I5 => s_axi_aresetn,
      O => fifo_clr_i_2_n_0
    );
fifo_clr_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => fifo_clr_i_1_n_0,
      Q => fifo_clr,
      R => '0'
    );
\fifo_count[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B5E0"
    )
        port map (
      I0 => fifo_count_reg(14),
      I1 => \fifo_count[0]_i_3_n_0\,
      I2 => pop_pulse_reg_n_0,
      I3 => sample_push_reg_n_0,
      O => \fifo_count[0]_i_1_n_0\
    );
\fifo_count[0]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => fifo_count_reg(12),
      I1 => fifo_count_reg(13),
      I2 => fifo_count_reg(10),
      I3 => fifo_count_reg(11),
      I4 => fifo_count_reg(1),
      I5 => fifo_count_reg(0),
      O => \fifo_count[0]_i_10_n_0\
    );
\fifo_count[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \fifo_count[0]_i_9_n_0\,
      I1 => fifo_count_reg(3),
      I2 => fifo_count_reg(2),
      I3 => fifo_count_reg(5),
      I4 => fifo_count_reg(4),
      I5 => \fifo_count[0]_i_10_n_0\,
      O => \fifo_count[0]_i_3_n_0\
    );
\fifo_count[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFD5"
    )
        port map (
      I0 => sample_push_reg_n_0,
      I1 => \fifo_count[0]_i_3_n_0\,
      I2 => pop_pulse_reg_n_0,
      I3 => fifo_count_reg(14),
      O => \fifo_count[0]_i_4_n_0\
    );
\fifo_count[0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002AFFD5"
    )
        port map (
      I0 => sample_push_reg_n_0,
      I1 => \fifo_count[0]_i_3_n_0\,
      I2 => pop_pulse_reg_n_0,
      I3 => fifo_count_reg(14),
      I4 => fifo_count_reg(3),
      O => \fifo_count[0]_i_5_n_0\
    );
\fifo_count[0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002AFFD5"
    )
        port map (
      I0 => sample_push_reg_n_0,
      I1 => \fifo_count[0]_i_3_n_0\,
      I2 => pop_pulse_reg_n_0,
      I3 => fifo_count_reg(14),
      I4 => fifo_count_reg(2),
      O => \fifo_count[0]_i_6_n_0\
    );
\fifo_count[0]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002AFFD5"
    )
        port map (
      I0 => sample_push_reg_n_0,
      I1 => \fifo_count[0]_i_3_n_0\,
      I2 => pop_pulse_reg_n_0,
      I3 => fifo_count_reg(14),
      I4 => fifo_count_reg(1),
      O => \fifo_count[0]_i_7_n_0\
    );
\fifo_count[0]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FD5502AA"
    )
        port map (
      I0 => sample_push_reg_n_0,
      I1 => fifo_count_reg(14),
      I2 => pop_pulse_reg_n_0,
      I3 => rd_ptr1,
      I4 => fifo_count_reg(0),
      O => \fifo_count[0]_i_8_n_0\
    );
\fifo_count[0]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => fifo_count_reg(7),
      I1 => fifo_count_reg(6),
      I2 => fifo_count_reg(9),
      I3 => fifo_count_reg(8),
      O => \fifo_count[0]_i_9_n_0\
    );
\fifo_count[12]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00D5"
    )
        port map (
      I0 => sample_push_reg_n_0,
      I1 => \fifo_count[0]_i_3_n_0\,
      I2 => pop_pulse_reg_n_0,
      I3 => fifo_count_reg(14),
      O => \fifo_count[12]_i_2_n_0\
    );
\fifo_count[12]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002AFFD5"
    )
        port map (
      I0 => sample_push_reg_n_0,
      I1 => \fifo_count[0]_i_3_n_0\,
      I2 => pop_pulse_reg_n_0,
      I3 => fifo_count_reg(14),
      I4 => fifo_count_reg(13),
      O => \fifo_count[12]_i_3_n_0\
    );
\fifo_count[12]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002AFFD5"
    )
        port map (
      I0 => sample_push_reg_n_0,
      I1 => \fifo_count[0]_i_3_n_0\,
      I2 => pop_pulse_reg_n_0,
      I3 => fifo_count_reg(14),
      I4 => fifo_count_reg(12),
      O => \fifo_count[12]_i_4_n_0\
    );
\fifo_count[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002AFFD5"
    )
        port map (
      I0 => sample_push_reg_n_0,
      I1 => \fifo_count[0]_i_3_n_0\,
      I2 => pop_pulse_reg_n_0,
      I3 => fifo_count_reg(14),
      I4 => fifo_count_reg(7),
      O => \fifo_count[4]_i_2_n_0\
    );
\fifo_count[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002AFFD5"
    )
        port map (
      I0 => sample_push_reg_n_0,
      I1 => \fifo_count[0]_i_3_n_0\,
      I2 => pop_pulse_reg_n_0,
      I3 => fifo_count_reg(14),
      I4 => fifo_count_reg(6),
      O => \fifo_count[4]_i_3_n_0\
    );
\fifo_count[4]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002AFFD5"
    )
        port map (
      I0 => sample_push_reg_n_0,
      I1 => \fifo_count[0]_i_3_n_0\,
      I2 => pop_pulse_reg_n_0,
      I3 => fifo_count_reg(14),
      I4 => fifo_count_reg(5),
      O => \fifo_count[4]_i_4_n_0\
    );
\fifo_count[4]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002AFFD5"
    )
        port map (
      I0 => sample_push_reg_n_0,
      I1 => \fifo_count[0]_i_3_n_0\,
      I2 => pop_pulse_reg_n_0,
      I3 => fifo_count_reg(14),
      I4 => fifo_count_reg(4),
      O => \fifo_count[4]_i_5_n_0\
    );
\fifo_count[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002AFFD5"
    )
        port map (
      I0 => sample_push_reg_n_0,
      I1 => \fifo_count[0]_i_3_n_0\,
      I2 => pop_pulse_reg_n_0,
      I3 => fifo_count_reg(14),
      I4 => fifo_count_reg(11),
      O => \fifo_count[8]_i_2_n_0\
    );
\fifo_count[8]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002AFFD5"
    )
        port map (
      I0 => sample_push_reg_n_0,
      I1 => \fifo_count[0]_i_3_n_0\,
      I2 => pop_pulse_reg_n_0,
      I3 => fifo_count_reg(14),
      I4 => fifo_count_reg(10),
      O => \fifo_count[8]_i_3_n_0\
    );
\fifo_count[8]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002AFFD5"
    )
        port map (
      I0 => sample_push_reg_n_0,
      I1 => \fifo_count[0]_i_3_n_0\,
      I2 => pop_pulse_reg_n_0,
      I3 => fifo_count_reg(14),
      I4 => fifo_count_reg(9),
      O => \fifo_count[8]_i_4_n_0\
    );
\fifo_count[8]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002AFFD5"
    )
        port map (
      I0 => sample_push_reg_n_0,
      I1 => \fifo_count[0]_i_3_n_0\,
      I2 => pop_pulse_reg_n_0,
      I3 => fifo_count_reg(14),
      I4 => fifo_count_reg(8),
      O => \fifo_count[8]_i_5_n_0\
    );
\fifo_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \fifo_count[0]_i_1_n_0\,
      D => \fifo_count_reg[0]_i_2_n_7\,
      Q => fifo_count_reg(0),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\fifo_count_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \fifo_count_reg[0]_i_2_n_0\,
      CO(2) => \fifo_count_reg[0]_i_2_n_1\,
      CO(1) => \fifo_count_reg[0]_i_2_n_2\,
      CO(0) => \fifo_count_reg[0]_i_2_n_3\,
      CYINIT => \fifo_count[0]_i_4_n_0\,
      DI(3 downto 0) => fifo_count_reg(3 downto 0),
      O(3) => \fifo_count_reg[0]_i_2_n_4\,
      O(2) => \fifo_count_reg[0]_i_2_n_5\,
      O(1) => \fifo_count_reg[0]_i_2_n_6\,
      O(0) => \fifo_count_reg[0]_i_2_n_7\,
      S(3) => \fifo_count[0]_i_5_n_0\,
      S(2) => \fifo_count[0]_i_6_n_0\,
      S(1) => \fifo_count[0]_i_7_n_0\,
      S(0) => \fifo_count[0]_i_8_n_0\
    );
\fifo_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \fifo_count[0]_i_1_n_0\,
      D => \fifo_count_reg[8]_i_1_n_5\,
      Q => fifo_count_reg(10),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\fifo_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \fifo_count[0]_i_1_n_0\,
      D => \fifo_count_reg[8]_i_1_n_4\,
      Q => fifo_count_reg(11),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\fifo_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \fifo_count[0]_i_1_n_0\,
      D => \fifo_count_reg[12]_i_1_n_7\,
      Q => fifo_count_reg(12),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\fifo_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \fifo_count_reg[8]_i_1_n_0\,
      CO(3 downto 2) => \NLW_fifo_count_reg[12]_i_1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \fifo_count_reg[12]_i_1_n_2\,
      CO(0) => \fifo_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => fifo_count_reg(13 downto 12),
      O(3) => \NLW_fifo_count_reg[12]_i_1_O_UNCONNECTED\(3),
      O(2) => \fifo_count_reg[12]_i_1_n_5\,
      O(1) => \fifo_count_reg[12]_i_1_n_6\,
      O(0) => \fifo_count_reg[12]_i_1_n_7\,
      S(3) => '0',
      S(2) => \fifo_count[12]_i_2_n_0\,
      S(1) => \fifo_count[12]_i_3_n_0\,
      S(0) => \fifo_count[12]_i_4_n_0\
    );
\fifo_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \fifo_count[0]_i_1_n_0\,
      D => \fifo_count_reg[12]_i_1_n_6\,
      Q => fifo_count_reg(13),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\fifo_count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \fifo_count[0]_i_1_n_0\,
      D => \fifo_count_reg[12]_i_1_n_5\,
      Q => fifo_count_reg(14),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\fifo_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \fifo_count[0]_i_1_n_0\,
      D => \fifo_count_reg[0]_i_2_n_6\,
      Q => fifo_count_reg(1),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\fifo_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \fifo_count[0]_i_1_n_0\,
      D => \fifo_count_reg[0]_i_2_n_5\,
      Q => fifo_count_reg(2),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\fifo_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \fifo_count[0]_i_1_n_0\,
      D => \fifo_count_reg[0]_i_2_n_4\,
      Q => fifo_count_reg(3),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\fifo_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \fifo_count[0]_i_1_n_0\,
      D => \fifo_count_reg[4]_i_1_n_7\,
      Q => fifo_count_reg(4),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\fifo_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \fifo_count_reg[0]_i_2_n_0\,
      CO(3) => \fifo_count_reg[4]_i_1_n_0\,
      CO(2) => \fifo_count_reg[4]_i_1_n_1\,
      CO(1) => \fifo_count_reg[4]_i_1_n_2\,
      CO(0) => \fifo_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => fifo_count_reg(7 downto 4),
      O(3) => \fifo_count_reg[4]_i_1_n_4\,
      O(2) => \fifo_count_reg[4]_i_1_n_5\,
      O(1) => \fifo_count_reg[4]_i_1_n_6\,
      O(0) => \fifo_count_reg[4]_i_1_n_7\,
      S(3) => \fifo_count[4]_i_2_n_0\,
      S(2) => \fifo_count[4]_i_3_n_0\,
      S(1) => \fifo_count[4]_i_4_n_0\,
      S(0) => \fifo_count[4]_i_5_n_0\
    );
\fifo_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \fifo_count[0]_i_1_n_0\,
      D => \fifo_count_reg[4]_i_1_n_6\,
      Q => fifo_count_reg(5),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\fifo_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \fifo_count[0]_i_1_n_0\,
      D => \fifo_count_reg[4]_i_1_n_5\,
      Q => fifo_count_reg(6),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\fifo_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \fifo_count[0]_i_1_n_0\,
      D => \fifo_count_reg[4]_i_1_n_4\,
      Q => fifo_count_reg(7),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\fifo_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \fifo_count[0]_i_1_n_0\,
      D => \fifo_count_reg[8]_i_1_n_7\,
      Q => fifo_count_reg(8),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\fifo_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \fifo_count_reg[4]_i_1_n_0\,
      CO(3) => \fifo_count_reg[8]_i_1_n_0\,
      CO(2) => \fifo_count_reg[8]_i_1_n_1\,
      CO(1) => \fifo_count_reg[8]_i_1_n_2\,
      CO(0) => \fifo_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => fifo_count_reg(11 downto 8),
      O(3) => \fifo_count_reg[8]_i_1_n_4\,
      O(2) => \fifo_count_reg[8]_i_1_n_5\,
      O(1) => \fifo_count_reg[8]_i_1_n_6\,
      O(0) => \fifo_count_reg[8]_i_1_n_7\,
      S(3) => \fifo_count[8]_i_2_n_0\,
      S(2) => \fifo_count[8]_i_3_n_0\,
      S(1) => \fifo_count[8]_i_4_n_0\,
      S(0) => \fifo_count[8]_i_5_n_0\
    );
\fifo_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \fifo_count[0]_i_1_n_0\,
      D => \fifo_count_reg[8]_i_1_n_6\,
      Q => fifo_count_reg(9),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
fifo_ram_reg_0: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 1) => wr_ptr_reg(13 downto 0),
      ADDRARDADDR(0) => '0',
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 1) => rd_ptr(13 downto 0),
      ADDRBWRADDR(0) => '0',
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => NLW_fifo_ram_reg_0_CASCADEOUTA_UNCONNECTED,
      CASCADEOUTB => NLW_fifo_ram_reg_0_CASCADEOUTB_UNCONNECTED,
      CLKARDCLK => s_axi_aclk,
      CLKBWRCLK => s_axi_aclk,
      DBITERR => NLW_fifo_ram_reg_0_DBITERR_UNCONNECTED,
      DIADI(31 downto 2) => B"000000000000000000000000000000",
      DIADI(1 downto 0) => sample_data(1 downto 0),
      DIBDI(31 downto 0) => B"00000000000000000000000000000011",
      DIPADIP(3 downto 0) => B"0000",
      DIPBDIP(3 downto 0) => B"0000",
      DOADO(31 downto 0) => NLW_fifo_ram_reg_0_DOADO_UNCONNECTED(31 downto 0),
      DOBDO(31 downto 2) => NLW_fifo_ram_reg_0_DOBDO_UNCONNECTED(31 downto 2),
      DOBDO(1 downto 0) => ram_rdata(1 downto 0),
      DOPADOP(3 downto 0) => NLW_fifo_ram_reg_0_DOPADOP_UNCONNECTED(3 downto 0),
      DOPBDOP(3 downto 0) => NLW_fifo_ram_reg_0_DOPBDOP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_fifo_ram_reg_0_ECCPARITY_UNCONNECTED(7 downto 0),
      ENARDEN => fifo_ram_reg_0_i_1_n_0,
      ENBWREN => '1',
      INJECTDBITERR => NLW_fifo_ram_reg_0_INJECTDBITERR_UNCONNECTED,
      INJECTSBITERR => NLW_fifo_ram_reg_0_INJECTSBITERR_UNCONNECTED,
      RDADDRECC(8 downto 0) => NLW_fifo_ram_reg_0_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_fifo_ram_reg_0_SBITERR_UNCONNECTED,
      WEA(3) => fifo_ram_reg_0_i_2_n_0,
      WEA(2) => fifo_ram_reg_0_i_2_n_0,
      WEA(1) => fifo_ram_reg_0_i_2_n_0,
      WEA(0) => fifo_ram_reg_0_i_2_n_0,
      WEBWE(7 downto 0) => B"00000000"
    );
fifo_ram_reg_0_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => sample_push_reg_n_0,
      I1 => fifo_count_reg(14),
      O => fifo_ram_reg_0_i_1_n_0
    );
fifo_ram_reg_0_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => fifo_clr,
      O => fifo_ram_reg_0_i_2_n_0
    );
fifo_ram_reg_1: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 1) => wr_ptr_reg(13 downto 0),
      ADDRARDADDR(0) => '0',
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 1) => rd_ptr(13 downto 0),
      ADDRBWRADDR(0) => '0',
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => NLW_fifo_ram_reg_1_CASCADEOUTA_UNCONNECTED,
      CASCADEOUTB => NLW_fifo_ram_reg_1_CASCADEOUTB_UNCONNECTED,
      CLKARDCLK => s_axi_aclk,
      CLKBWRCLK => s_axi_aclk,
      DBITERR => NLW_fifo_ram_reg_1_DBITERR_UNCONNECTED,
      DIADI(31 downto 2) => B"000000000000000000000000000000",
      DIADI(1 downto 0) => sample_data(3 downto 2),
      DIBDI(31 downto 0) => B"00000000000000000000000000000011",
      DIPADIP(3 downto 0) => B"0000",
      DIPBDIP(3 downto 0) => B"0000",
      DOADO(31 downto 0) => NLW_fifo_ram_reg_1_DOADO_UNCONNECTED(31 downto 0),
      DOBDO(31 downto 2) => NLW_fifo_ram_reg_1_DOBDO_UNCONNECTED(31 downto 2),
      DOBDO(1 downto 0) => ram_rdata(3 downto 2),
      DOPADOP(3 downto 0) => NLW_fifo_ram_reg_1_DOPADOP_UNCONNECTED(3 downto 0),
      DOPBDOP(3 downto 0) => NLW_fifo_ram_reg_1_DOPBDOP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_fifo_ram_reg_1_ECCPARITY_UNCONNECTED(7 downto 0),
      ENARDEN => fifo_ram_reg_0_i_1_n_0,
      ENBWREN => '1',
      INJECTDBITERR => NLW_fifo_ram_reg_1_INJECTDBITERR_UNCONNECTED,
      INJECTSBITERR => NLW_fifo_ram_reg_1_INJECTSBITERR_UNCONNECTED,
      RDADDRECC(8 downto 0) => NLW_fifo_ram_reg_1_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_fifo_ram_reg_1_SBITERR_UNCONNECTED,
      WEA(3) => fifo_ram_reg_0_i_2_n_0,
      WEA(2) => fifo_ram_reg_0_i_2_n_0,
      WEA(1) => fifo_ram_reg_0_i_2_n_0,
      WEA(0) => fifo_ram_reg_0_i_2_n_0,
      WEBWE(7 downto 0) => B"00000000"
    );
fifo_ram_reg_2: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 1) => wr_ptr_reg(13 downto 0),
      ADDRARDADDR(0) => '0',
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 1) => rd_ptr(13 downto 0),
      ADDRBWRADDR(0) => '0',
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => NLW_fifo_ram_reg_2_CASCADEOUTA_UNCONNECTED,
      CASCADEOUTB => NLW_fifo_ram_reg_2_CASCADEOUTB_UNCONNECTED,
      CLKARDCLK => s_axi_aclk,
      CLKBWRCLK => s_axi_aclk,
      DBITERR => NLW_fifo_ram_reg_2_DBITERR_UNCONNECTED,
      DIADI(31 downto 2) => B"000000000000000000000000000000",
      DIADI(1 downto 0) => sample_data(5 downto 4),
      DIBDI(31 downto 0) => B"00000000000000000000000000000011",
      DIPADIP(3 downto 0) => B"0000",
      DIPBDIP(3 downto 0) => B"0000",
      DOADO(31 downto 0) => NLW_fifo_ram_reg_2_DOADO_UNCONNECTED(31 downto 0),
      DOBDO(31 downto 2) => NLW_fifo_ram_reg_2_DOBDO_UNCONNECTED(31 downto 2),
      DOBDO(1 downto 0) => ram_rdata(5 downto 4),
      DOPADOP(3 downto 0) => NLW_fifo_ram_reg_2_DOPADOP_UNCONNECTED(3 downto 0),
      DOPBDOP(3 downto 0) => NLW_fifo_ram_reg_2_DOPBDOP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_fifo_ram_reg_2_ECCPARITY_UNCONNECTED(7 downto 0),
      ENARDEN => fifo_ram_reg_0_i_1_n_0,
      ENBWREN => '1',
      INJECTDBITERR => NLW_fifo_ram_reg_2_INJECTDBITERR_UNCONNECTED,
      INJECTSBITERR => NLW_fifo_ram_reg_2_INJECTSBITERR_UNCONNECTED,
      RDADDRECC(8 downto 0) => NLW_fifo_ram_reg_2_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_fifo_ram_reg_2_SBITERR_UNCONNECTED,
      WEA(3) => fifo_ram_reg_2_i_1_n_0,
      WEA(2) => fifo_ram_reg_2_i_1_n_0,
      WEA(1) => fifo_ram_reg_0_i_2_n_0,
      WEA(0) => fifo_ram_reg_0_i_2_n_0,
      WEBWE(7 downto 0) => B"00000000"
    );
fifo_ram_reg_2_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => fifo_clr,
      O => fifo_ram_reg_2_i_1_n_0
    );
fifo_ram_reg_3: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 1) => wr_ptr_reg(13 downto 0),
      ADDRARDADDR(0) => '0',
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 1) => rd_ptr(13 downto 0),
      ADDRBWRADDR(0) => '0',
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => NLW_fifo_ram_reg_3_CASCADEOUTA_UNCONNECTED,
      CASCADEOUTB => NLW_fifo_ram_reg_3_CASCADEOUTB_UNCONNECTED,
      CLKARDCLK => s_axi_aclk,
      CLKBWRCLK => s_axi_aclk,
      DBITERR => NLW_fifo_ram_reg_3_DBITERR_UNCONNECTED,
      DIADI(31 downto 2) => B"000000000000000000000000000000",
      DIADI(1 downto 0) => sample_data(7 downto 6),
      DIBDI(31 downto 0) => B"00000000000000000000000000000011",
      DIPADIP(3 downto 0) => B"0000",
      DIPBDIP(3 downto 0) => B"0000",
      DOADO(31 downto 0) => NLW_fifo_ram_reg_3_DOADO_UNCONNECTED(31 downto 0),
      DOBDO(31 downto 2) => NLW_fifo_ram_reg_3_DOBDO_UNCONNECTED(31 downto 2),
      DOBDO(1 downto 0) => ram_rdata(7 downto 6),
      DOPADOP(3 downto 0) => NLW_fifo_ram_reg_3_DOPADOP_UNCONNECTED(3 downto 0),
      DOPBDOP(3 downto 0) => NLW_fifo_ram_reg_3_DOPBDOP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_fifo_ram_reg_3_ECCPARITY_UNCONNECTED(7 downto 0),
      ENARDEN => fifo_ram_reg_0_i_1_n_0,
      ENBWREN => '1',
      INJECTDBITERR => NLW_fifo_ram_reg_3_INJECTDBITERR_UNCONNECTED,
      INJECTSBITERR => NLW_fifo_ram_reg_3_INJECTSBITERR_UNCONNECTED,
      RDADDRECC(8 downto 0) => NLW_fifo_ram_reg_3_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_fifo_ram_reg_3_SBITERR_UNCONNECTED,
      WEA(3) => fifo_ram_reg_2_i_1_n_0,
      WEA(2) => fifo_ram_reg_2_i_1_n_0,
      WEA(1) => fifo_ram_reg_2_i_1_n_0,
      WEA(0) => fifo_ram_reg_2_i_1_n_0,
      WEBWE(7 downto 0) => B"00000000"
    );
fifo_ram_reg_4: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 1) => wr_ptr_reg(13 downto 0),
      ADDRARDADDR(0) => '0',
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 1) => rd_ptr(13 downto 0),
      ADDRBWRADDR(0) => '0',
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => NLW_fifo_ram_reg_4_CASCADEOUTA_UNCONNECTED,
      CASCADEOUTB => NLW_fifo_ram_reg_4_CASCADEOUTB_UNCONNECTED,
      CLKARDCLK => s_axi_aclk,
      CLKBWRCLK => s_axi_aclk,
      DBITERR => NLW_fifo_ram_reg_4_DBITERR_UNCONNECTED,
      DIADI(31 downto 2) => B"000000000000000000000000000000",
      DIADI(1 downto 0) => sample_data(9 downto 8),
      DIBDI(31 downto 0) => B"00000000000000000000000000000011",
      DIPADIP(3 downto 0) => B"0000",
      DIPBDIP(3 downto 0) => B"0000",
      DOADO(31 downto 0) => NLW_fifo_ram_reg_4_DOADO_UNCONNECTED(31 downto 0),
      DOBDO(31 downto 2) => NLW_fifo_ram_reg_4_DOBDO_UNCONNECTED(31 downto 2),
      DOBDO(1 downto 0) => ram_rdata(9 downto 8),
      DOPADOP(3 downto 0) => NLW_fifo_ram_reg_4_DOPADOP_UNCONNECTED(3 downto 0),
      DOPBDOP(3 downto 0) => NLW_fifo_ram_reg_4_DOPBDOP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_fifo_ram_reg_4_ECCPARITY_UNCONNECTED(7 downto 0),
      ENARDEN => fifo_ram_reg_0_i_1_n_0,
      ENBWREN => '1',
      INJECTDBITERR => NLW_fifo_ram_reg_4_INJECTDBITERR_UNCONNECTED,
      INJECTSBITERR => NLW_fifo_ram_reg_4_INJECTSBITERR_UNCONNECTED,
      RDADDRECC(8 downto 0) => NLW_fifo_ram_reg_4_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_fifo_ram_reg_4_SBITERR_UNCONNECTED,
      WEA(3) => fifo_ram_reg_2_i_1_n_0,
      WEA(2) => fifo_ram_reg_2_i_1_n_0,
      WEA(1) => fifo_ram_reg_2_i_1_n_0,
      WEA(0) => fifo_ram_reg_2_i_1_n_0,
      WEBWE(7 downto 0) => B"00000000"
    );
fifo_ram_reg_5: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 1) => wr_ptr_reg(13 downto 0),
      ADDRARDADDR(0) => '0',
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 1) => rd_ptr(13 downto 0),
      ADDRBWRADDR(0) => '0',
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => NLW_fifo_ram_reg_5_CASCADEOUTA_UNCONNECTED,
      CASCADEOUTB => NLW_fifo_ram_reg_5_CASCADEOUTB_UNCONNECTED,
      CLKARDCLK => s_axi_aclk,
      CLKBWRCLK => s_axi_aclk,
      DBITERR => NLW_fifo_ram_reg_5_DBITERR_UNCONNECTED,
      DIADI(31 downto 2) => B"000000000000000000000000000000",
      DIADI(1 downto 0) => sample_data(11 downto 10),
      DIBDI(31 downto 0) => B"00000000000000000000000000000011",
      DIPADIP(3 downto 0) => B"0000",
      DIPBDIP(3 downto 0) => B"0000",
      DOADO(31 downto 0) => NLW_fifo_ram_reg_5_DOADO_UNCONNECTED(31 downto 0),
      DOBDO(31 downto 2) => NLW_fifo_ram_reg_5_DOBDO_UNCONNECTED(31 downto 2),
      DOBDO(1 downto 0) => ram_rdata(11 downto 10),
      DOPADOP(3 downto 0) => NLW_fifo_ram_reg_5_DOPADOP_UNCONNECTED(3 downto 0),
      DOPBDOP(3 downto 0) => NLW_fifo_ram_reg_5_DOPBDOP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_fifo_ram_reg_5_ECCPARITY_UNCONNECTED(7 downto 0),
      ENARDEN => fifo_ram_reg_0_i_1_n_0,
      ENBWREN => '1',
      INJECTDBITERR => NLW_fifo_ram_reg_5_INJECTDBITERR_UNCONNECTED,
      INJECTSBITERR => NLW_fifo_ram_reg_5_INJECTSBITERR_UNCONNECTED,
      RDADDRECC(8 downto 0) => NLW_fifo_ram_reg_5_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_fifo_ram_reg_5_SBITERR_UNCONNECTED,
      WEA(3) => fifo_ram_reg_5_i_1_n_0,
      WEA(2) => fifo_ram_reg_5_i_1_n_0,
      WEA(1) => fifo_ram_reg_5_i_1_n_0,
      WEA(0) => fifo_ram_reg_5_i_1_n_0,
      WEBWE(7 downto 0) => B"00000000"
    );
fifo_ram_reg_5_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => fifo_clr,
      O => fifo_ram_reg_5_i_1_n_0
    );
fifo_ram_reg_6: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 1) => wr_ptr_reg(13 downto 0),
      ADDRARDADDR(0) => '0',
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 1) => rd_ptr(13 downto 0),
      ADDRBWRADDR(0) => '0',
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => NLW_fifo_ram_reg_6_CASCADEOUTA_UNCONNECTED,
      CASCADEOUTB => NLW_fifo_ram_reg_6_CASCADEOUTB_UNCONNECTED,
      CLKARDCLK => s_axi_aclk,
      CLKBWRCLK => s_axi_aclk,
      DBITERR => NLW_fifo_ram_reg_6_DBITERR_UNCONNECTED,
      DIADI(31 downto 2) => B"000000000000000000000000000000",
      DIADI(1 downto 0) => sample_data(13 downto 12),
      DIBDI(31 downto 0) => B"00000000000000000000000000000011",
      DIPADIP(3 downto 0) => B"0000",
      DIPBDIP(3 downto 0) => B"0000",
      DOADO(31 downto 0) => NLW_fifo_ram_reg_6_DOADO_UNCONNECTED(31 downto 0),
      DOBDO(31 downto 2) => NLW_fifo_ram_reg_6_DOBDO_UNCONNECTED(31 downto 2),
      DOBDO(1 downto 0) => ram_rdata(13 downto 12),
      DOPADOP(3 downto 0) => NLW_fifo_ram_reg_6_DOPADOP_UNCONNECTED(3 downto 0),
      DOPBDOP(3 downto 0) => NLW_fifo_ram_reg_6_DOPBDOP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_fifo_ram_reg_6_ECCPARITY_UNCONNECTED(7 downto 0),
      ENARDEN => fifo_ram_reg_0_i_1_n_0,
      ENBWREN => '1',
      INJECTDBITERR => NLW_fifo_ram_reg_6_INJECTDBITERR_UNCONNECTED,
      INJECTSBITERR => NLW_fifo_ram_reg_6_INJECTSBITERR_UNCONNECTED,
      RDADDRECC(8 downto 0) => NLW_fifo_ram_reg_6_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_fifo_ram_reg_6_SBITERR_UNCONNECTED,
      WEA(3) => fifo_ram_reg_5_i_1_n_0,
      WEA(2) => fifo_ram_reg_5_i_1_n_0,
      WEA(1) => fifo_ram_reg_5_i_1_n_0,
      WEA(0) => fifo_ram_reg_5_i_1_n_0,
      WEBWE(7 downto 0) => B"00000000"
    );
fifo_ram_reg_7: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 1) => wr_ptr_reg(13 downto 0),
      ADDRARDADDR(0) => '0',
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 1) => rd_ptr(13 downto 0),
      ADDRBWRADDR(0) => '0',
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => NLW_fifo_ram_reg_7_CASCADEOUTA_UNCONNECTED,
      CASCADEOUTB => NLW_fifo_ram_reg_7_CASCADEOUTB_UNCONNECTED,
      CLKARDCLK => s_axi_aclk,
      CLKBWRCLK => s_axi_aclk,
      DBITERR => NLW_fifo_ram_reg_7_DBITERR_UNCONNECTED,
      DIADI(31 downto 2) => B"000000000000000000000000000000",
      DIADI(1 downto 0) => sample_data(15 downto 14),
      DIBDI(31 downto 0) => B"00000000000000000000000000000011",
      DIPADIP(3 downto 0) => B"0000",
      DIPBDIP(3 downto 0) => B"0000",
      DOADO(31 downto 0) => NLW_fifo_ram_reg_7_DOADO_UNCONNECTED(31 downto 0),
      DOBDO(31 downto 2) => NLW_fifo_ram_reg_7_DOBDO_UNCONNECTED(31 downto 2),
      DOBDO(1 downto 0) => ram_rdata(15 downto 14),
      DOPADOP(3 downto 0) => NLW_fifo_ram_reg_7_DOPADOP_UNCONNECTED(3 downto 0),
      DOPBDOP(3 downto 0) => NLW_fifo_ram_reg_7_DOPBDOP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_fifo_ram_reg_7_ECCPARITY_UNCONNECTED(7 downto 0),
      ENARDEN => fifo_ram_reg_0_i_1_n_0,
      ENBWREN => '1',
      INJECTDBITERR => NLW_fifo_ram_reg_7_INJECTDBITERR_UNCONNECTED,
      INJECTSBITERR => NLW_fifo_ram_reg_7_INJECTSBITERR_UNCONNECTED,
      RDADDRECC(8 downto 0) => NLW_fifo_ram_reg_7_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_fifo_ram_reg_7_SBITERR_UNCONNECTED,
      WEA(3) => fifo_ram_reg_7_i_1_n_0,
      WEA(2) => fifo_ram_reg_7_i_1_n_0,
      WEA(1) => fifo_ram_reg_5_i_1_n_0,
      WEA(0) => fifo_ram_reg_5_i_1_n_0,
      WEBWE(7 downto 0) => B"00000000"
    );
fifo_ram_reg_7_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => fifo_clr,
      O => fifo_ram_reg_7_i_1_n_0
    );
i2s_en_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \wdata_reg_reg_n_0_[0]\,
      I1 => i2s_en,
      I2 => p_2_in(0),
      O => i2s_en_i_1_n_0
    );
i2s_en_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i2s_en_i_1_n_0,
      Q => p_2_in(0),
      R => bvalid_r_i_1_n_0
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => nco_acc(6),
      O => \i__carry__0_i_1_n_0\
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => nco_acc(5),
      O => \i__carry__0_i_2_n_0\
    );
\i__carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => nco_acc(11),
      O => \i__carry__1_i_1_n_0\
    );
\i__carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => nco_acc(10),
      O => \i__carry__1_i_2_n_0\
    );
\i__carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => nco_acc(8),
      O => \i__carry__1_i_3_n_0\
    );
\i__carry__2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => nco_acc(13),
      O => \i__carry__2_i_1_n_0\
    );
\i__carry__3_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => nco_acc(19),
      O => \i__carry__3_i_1_n_0\
    );
\i__carry__3_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => nco_acc(18),
      O => \i__carry__3_i_2_n_0\
    );
\i__carry__3_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => nco_acc(17),
      O => \i__carry__3_i_3_n_0\
    );
\i__carry__4_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => nco_acc(21),
      O => \i__carry__4_i_1_n_0\
    );
\i__carry__4_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => nco_acc(20),
      O => \i__carry__4_i_2_n_0\
    );
\i__carry__5_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => nco_acc(26),
      O => \i__carry__5_i_1_n_0\
    );
\i__carry__5_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => nco_acc(24),
      O => \i__carry__5_i_2_n_0\
    );
\i__carry_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => nco_acc(1),
      O => \i__carry_i_1_n_0\
    );
\leds_reg[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000000000000"
    )
        port map (
      I0 => \leds_reg[3]_i_2_n_0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => p_0_in0,
      I4 => p_0_in(2),
      I5 => fifo_clr1,
      O => leds_reg(0)
    );
\leds_reg[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \awaddr_reg_reg_n_0_[6]\,
      I1 => \awaddr_reg_reg_n_0_[7]\,
      O => \leds_reg[3]_i_2_n_0\
    );
\leds_reg[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^bvalid_r_reg_0\,
      I1 => w_latched_reg_n_0,
      I2 => aw_latched_reg_n_0,
      O => fifo_clr1
    );
\leds_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => leds_reg(0),
      D => \wdata_reg_reg_n_0_[0]\,
      Q => \^leds_o\(0),
      R => bvalid_r_i_1_n_0
    );
\leds_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => leds_reg(0),
      D => \wdata_reg_reg_n_0_[1]\,
      Q => \^leds_o\(1),
      R => bvalid_r_i_1_n_0
    );
\leds_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => leds_reg(0),
      D => p_1_in,
      Q => \^leds_o\(2),
      R => bvalid_r_i_1_n_0
    );
\leds_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => leds_reg(0),
      D => \wdata_reg_reg_n_0_[3]\,
      Q => \^leds_o\(3),
      R => bvalid_r_i_1_n_0
    );
lora_trig_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in,
      I1 => i2s_en,
      I2 => \^lora_trig_o\,
      O => lora_trig_r_i_1_n_0
    );
lora_trig_r_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \leds_reg[3]_i_2_n_0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => p_0_in0,
      I4 => p_0_in(2),
      I5 => fifo_clr1,
      O => i2s_en
    );
lora_trig_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => lora_trig_r_i_1_n_0,
      Q => \^lora_trig_o\,
      R => bvalid_r_i_1_n_0
    );
\nco_acc_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__1_n_5\,
      Q => nco_acc(10),
      R => sample_push0
    );
\nco_acc_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__1_n_4\,
      Q => nco_acc(11),
      R => sample_push0
    );
\nco_acc_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__2_n_7\,
      Q => nco_acc(12),
      R => sample_push0
    );
\nco_acc_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__2_n_6\,
      Q => nco_acc(13),
      R => sample_push0
    );
\nco_acc_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__2_n_5\,
      Q => nco_acc(14),
      R => sample_push0
    );
\nco_acc_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__2_n_4\,
      Q => nco_acc(15),
      R => sample_push0
    );
\nco_acc_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__3_n_7\,
      Q => nco_acc(16),
      R => sample_push0
    );
\nco_acc_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__3_n_6\,
      Q => nco_acc(17),
      R => sample_push0
    );
\nco_acc_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__3_n_5\,
      Q => nco_acc(18),
      R => sample_push0
    );
\nco_acc_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__3_n_4\,
      Q => nco_acc(19),
      R => sample_push0
    );
\nco_acc_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry_n_6\,
      Q => nco_acc(1),
      R => sample_push0
    );
\nco_acc_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__4_n_7\,
      Q => nco_acc(20),
      R => sample_push0
    );
\nco_acc_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__4_n_6\,
      Q => nco_acc(21),
      R => sample_push0
    );
\nco_acc_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__4_n_5\,
      Q => nco_acc(22),
      R => sample_push0
    );
\nco_acc_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__4_n_4\,
      Q => nco_acc(23),
      R => sample_push0
    );
\nco_acc_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__5_n_7\,
      Q => nco_acc(24),
      R => sample_push0
    );
\nco_acc_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__5_n_6\,
      Q => nco_acc(25),
      R => sample_push0
    );
\nco_acc_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__5_n_5\,
      Q => nco_acc(26),
      R => sample_push0
    );
\nco_acc_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__5_n_4\,
      Q => nco_acc(27),
      R => sample_push0
    );
\nco_acc_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__6_n_7\,
      Q => nco_acc(28),
      R => sample_push0
    );
\nco_acc_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__6_n_6\,
      Q => nco_acc(29),
      R => sample_push0
    );
\nco_acc_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry_n_5\,
      Q => nco_acc(2),
      R => sample_push0
    );
\nco_acc_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__6_n_5\,
      Q => nco_acc(30),
      R => sample_push0
    );
\nco_acc_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__6_n_4\,
      Q => nco_acc(31),
      R => sample_push0
    );
\nco_acc_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry_n_4\,
      Q => nco_acc(3),
      R => sample_push0
    );
\nco_acc_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__0_n_7\,
      Q => nco_acc(4),
      R => sample_push0
    );
\nco_acc_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__0_n_6\,
      Q => nco_acc(5),
      R => sample_push0
    );
\nco_acc_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__0_n_5\,
      Q => nco_acc(6),
      R => sample_push0
    );
\nco_acc_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__0_n_4\,
      Q => nco_acc(7),
      R => sample_push0
    );
\nco_acc_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__1_n_7\,
      Q => nco_acc(8),
      R => sample_push0
    );
\nco_acc_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \sample_push1_inferred__0/i__carry__1_n_6\,
      Q => nco_acc(9),
      R => sample_push0
    );
overrun_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAEA0000"
    )
        port map (
      I0 => overrun_reg,
      I1 => fifo_count_reg(14),
      I2 => sample_push_reg_n_0,
      I3 => \fifo_count[0]_i_3_n_0\,
      I4 => s_axi_aresetn,
      I5 => fifo_clr,
      O => overrun_reg_i_1_n_0
    );
overrun_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => overrun_reg_i_1_n_0,
      Q => overrun_reg,
      R => '0'
    );
pop_nonempty_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF7F8000"
    )
        port map (
      I0 => pop_pulse_i_2_n_0,
      I1 => s_axi_arvalid,
      I2 => \FSM_onehot_rd_state_reg_n_0_[0]\,
      I3 => rd_ptr1,
      I4 => pop_nonempty,
      O => pop_nonempty_i_1_n_0
    );
pop_nonempty_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => pop_nonempty_i_1_n_0,
      Q => pop_nonempty,
      R => bvalid_r_i_1_n_0
    );
pop_pulse_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => pop_pulse_i_2_n_0,
      I1 => s_axi_arvalid,
      I2 => \FSM_onehot_rd_state_reg_n_0_[0]\,
      I3 => rd_ptr1,
      O => pop_pulse_i_1_n_0
    );
pop_pulse_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000001000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => s_axi_araddr(5),
      I5 => s_axi_araddr(4),
      O => pop_pulse_i_2_n_0
    );
pop_pulse_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => pop_pulse_i_1_n_0,
      Q => pop_pulse_reg_n_0,
      R => bvalid_r_i_1_n_0
    );
\rd_ptr[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rd_ptr_reg(0),
      O => \rd_ptr[0]_i_2_n_0\
    );
\rd_ptr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg[0]_i_1_n_7\,
      Q => rd_ptr_reg(0),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \rd_ptr_reg[0]_i_1_n_0\,
      CO(2) => \rd_ptr_reg[0]_i_1_n_1\,
      CO(1) => \rd_ptr_reg[0]_i_1_n_2\,
      CO(0) => \rd_ptr_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \rd_ptr_reg[0]_i_1_n_4\,
      O(2) => \rd_ptr_reg[0]_i_1_n_5\,
      O(1) => \rd_ptr_reg[0]_i_1_n_6\,
      O(0) => \rd_ptr_reg[0]_i_1_n_7\,
      S(3 downto 1) => rd_ptr_reg(3 downto 1),
      S(0) => \rd_ptr[0]_i_2_n_0\
    );
\rd_ptr_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg[8]_i_1_n_5\,
      Q => rd_ptr_reg(10),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg[8]_i_1_n_4\,
      Q => rd_ptr_reg(11),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg[12]_i_1_n_7\,
      Q => rd_ptr_reg(12),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rd_ptr_reg[8]_i_1_n_0\,
      CO(3 downto 1) => \NLW_rd_ptr_reg[12]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \rd_ptr_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_rd_ptr_reg[12]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \rd_ptr_reg[12]_i_1_n_6\,
      O(0) => \rd_ptr_reg[12]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1 downto 0) => rd_ptr_reg(13 downto 12)
    );
\rd_ptr_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg[12]_i_1_n_6\,
      Q => rd_ptr_reg(13),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg[0]_i_1_n_6\,
      Q => rd_ptr_reg(1),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg[0]_i_1_n_5\,
      Q => rd_ptr_reg(2),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg[0]_i_1_n_4\,
      Q => rd_ptr_reg(3),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg[4]_i_1_n_7\,
      Q => rd_ptr_reg(4),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rd_ptr_reg[0]_i_1_n_0\,
      CO(3) => \rd_ptr_reg[4]_i_1_n_0\,
      CO(2) => \rd_ptr_reg[4]_i_1_n_1\,
      CO(1) => \rd_ptr_reg[4]_i_1_n_2\,
      CO(0) => \rd_ptr_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \rd_ptr_reg[4]_i_1_n_4\,
      O(2) => \rd_ptr_reg[4]_i_1_n_5\,
      O(1) => \rd_ptr_reg[4]_i_1_n_6\,
      O(0) => \rd_ptr_reg[4]_i_1_n_7\,
      S(3 downto 0) => rd_ptr_reg(7 downto 4)
    );
\rd_ptr_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg[4]_i_1_n_6\,
      Q => rd_ptr_reg(5),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg[4]_i_1_n_5\,
      Q => rd_ptr_reg(6),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg[4]_i_1_n_4\,
      Q => rd_ptr_reg(7),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg[8]_i_1_n_7\,
      Q => rd_ptr_reg(8),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rd_ptr_reg[4]_i_1_n_0\,
      CO(3) => \rd_ptr_reg[8]_i_1_n_0\,
      CO(2) => \rd_ptr_reg[8]_i_1_n_1\,
      CO(1) => \rd_ptr_reg[8]_i_1_n_2\,
      CO(0) => \rd_ptr_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \rd_ptr_reg[8]_i_1_n_4\,
      O(2) => \rd_ptr_reg[8]_i_1_n_5\,
      O(1) => \rd_ptr_reg[8]_i_1_n_6\,
      O(0) => \rd_ptr_reg[8]_i_1_n_7\,
      S(3 downto 0) => rd_ptr_reg(11 downto 8)
    );
\rd_ptr_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg[8]_i_1_n_6\,
      Q => rd_ptr_reg(9),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg_rep[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_rep[0]_i_1_n_0\,
      Q => rd_ptr(0),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg_rep[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg_rep[12]_i_1_n_6\,
      Q => rd_ptr(10),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg_rep[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg_rep[12]_i_1_n_5\,
      Q => rd_ptr(11),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg_rep[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg_rep[12]_i_1_n_4\,
      Q => rd_ptr(12),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg_rep[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rd_ptr_reg_rep[8]_i_1_n_0\,
      CO(3) => \rd_ptr_reg_rep[12]_i_1_n_0\,
      CO(2) => \rd_ptr_reg_rep[12]_i_1_n_1\,
      CO(1) => \rd_ptr_reg_rep[12]_i_1_n_2\,
      CO(0) => \rd_ptr_reg_rep[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \rd_ptr_reg_rep[12]_i_1_n_4\,
      O(2) => \rd_ptr_reg_rep[12]_i_1_n_5\,
      O(1) => \rd_ptr_reg_rep[12]_i_1_n_6\,
      O(0) => \rd_ptr_reg_rep[12]_i_1_n_7\,
      S(3 downto 0) => rd_ptr_reg(12 downto 9)
    );
\rd_ptr_reg_rep[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg_rep[13]_i_3_n_7\,
      Q => rd_ptr(13),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg_rep[13]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \rd_ptr_reg_rep[12]_i_1_n_0\,
      CO(3 downto 0) => \NLW_rd_ptr_reg_rep[13]_i_3_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_rd_ptr_reg_rep[13]_i_3_O_UNCONNECTED\(3 downto 1),
      O(0) => \rd_ptr_reg_rep[13]_i_3_n_7\,
      S(3 downto 1) => B"000",
      S(0) => rd_ptr_reg(13)
    );
\rd_ptr_reg_rep[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg_rep[4]_i_1_n_7\,
      Q => rd_ptr(1),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg_rep[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg_rep[4]_i_1_n_6\,
      Q => rd_ptr(2),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg_rep[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg_rep[4]_i_1_n_5\,
      Q => rd_ptr(3),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg_rep[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg_rep[4]_i_1_n_4\,
      Q => rd_ptr(4),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg_rep[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \rd_ptr_reg_rep[4]_i_1_n_0\,
      CO(2) => \rd_ptr_reg_rep[4]_i_1_n_1\,
      CO(1) => \rd_ptr_reg_rep[4]_i_1_n_2\,
      CO(0) => \rd_ptr_reg_rep[4]_i_1_n_3\,
      CYINIT => rd_ptr_reg(0),
      DI(3 downto 0) => B"0000",
      O(3) => \rd_ptr_reg_rep[4]_i_1_n_4\,
      O(2) => \rd_ptr_reg_rep[4]_i_1_n_5\,
      O(1) => \rd_ptr_reg_rep[4]_i_1_n_6\,
      O(0) => \rd_ptr_reg_rep[4]_i_1_n_7\,
      S(3 downto 0) => rd_ptr_reg(4 downto 1)
    );
\rd_ptr_reg_rep[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg_rep[8]_i_1_n_7\,
      Q => rd_ptr(5),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg_rep[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg_rep[8]_i_1_n_6\,
      Q => rd_ptr(6),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg_rep[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg_rep[8]_i_1_n_5\,
      Q => rd_ptr(7),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg_rep[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg_rep[8]_i_1_n_4\,
      Q => rd_ptr(8),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_reg_rep[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rd_ptr_reg_rep[4]_i_1_n_0\,
      CO(3) => \rd_ptr_reg_rep[8]_i_1_n_0\,
      CO(2) => \rd_ptr_reg_rep[8]_i_1_n_1\,
      CO(1) => \rd_ptr_reg_rep[8]_i_1_n_2\,
      CO(0) => \rd_ptr_reg_rep[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \rd_ptr_reg_rep[8]_i_1_n_4\,
      O(2) => \rd_ptr_reg_rep[8]_i_1_n_5\,
      O(1) => \rd_ptr_reg_rep[8]_i_1_n_6\,
      O(0) => \rd_ptr_reg_rep[8]_i_1_n_7\,
      S(3 downto 0) => rd_ptr_reg(8 downto 5)
    );
\rd_ptr_reg_rep[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_19_in,
      D => \rd_ptr_reg_rep[12]_i_1_n_7\,
      Q => rd_ptr(9),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_rep[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rd_ptr_reg(0),
      O => \rd_ptr_rep[0]_i_1_n_0\
    );
\rd_ptr_rep[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => fifo_clr,
      I1 => s_axi_aresetn,
      O => \rd_ptr_rep[13]_i_1_n_0\
    );
\rd_ptr_rep[13]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => rd_ptr1,
      I1 => pop_pulse_reg_n_0,
      O => p_19_in
    );
\rdata_r[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFEEEFEEE"
    )
        port map (
      I0 => \rdata_r[0]_i_2_n_0\,
      I1 => \rdata_r[0]_i_3_n_0\,
      I2 => \rdata_r[31]_i_2_n_0\,
      I3 => total_cnt_reg(0),
      I4 => ram_rdata(0),
      I5 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[0]_i_1_n_0\
    );
\rdata_r[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEFC0000EE300000"
    )
        port map (
      I0 => overrun_reg,
      I1 => sel0(2),
      I2 => p_2_in(0),
      I3 => sel0(0),
      I4 => \rdata_r[1]_i_3_n_0\,
      I5 => \^leds_o\(0),
      O => \rdata_r[0]_i_2_n_0\
    );
\rdata_r[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \rdata_r[14]_i_2_n_0\,
      I1 => fifo_count_reg(0),
      O => \rdata_r[0]_i_3_n_0\
    );
\rdata_r[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata_r[14]_i_2_n_0\,
      I1 => fifo_count_reg(10),
      I2 => \rdata_r[31]_i_2_n_0\,
      I3 => total_cnt_reg(10),
      I4 => ram_rdata(10),
      I5 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[10]_i_1_n_0\
    );
\rdata_r[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata_r[14]_i_2_n_0\,
      I1 => fifo_count_reg(11),
      I2 => \rdata_r[31]_i_2_n_0\,
      I3 => total_cnt_reg(11),
      I4 => ram_rdata(11),
      I5 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[11]_i_1_n_0\
    );
\rdata_r[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata_r[14]_i_2_n_0\,
      I1 => fifo_count_reg(12),
      I2 => \rdata_r[31]_i_2_n_0\,
      I3 => total_cnt_reg(12),
      I4 => ram_rdata(12),
      I5 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[12]_i_1_n_0\
    );
\rdata_r[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata_r[14]_i_2_n_0\,
      I1 => fifo_count_reg(13),
      I2 => \rdata_r[31]_i_2_n_0\,
      I3 => total_cnt_reg(13),
      I4 => ram_rdata(13),
      I5 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[13]_i_1_n_0\
    );
\rdata_r[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata_r[14]_i_2_n_0\,
      I1 => fifo_count_reg(14),
      I2 => \rdata_r[31]_i_2_n_0\,
      I3 => total_cnt_reg(14),
      I4 => ram_rdata(14),
      I5 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[14]_i_1_n_0\
    );
\rdata_r[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => sel0(0),
      I1 => \araddr_reg_reg_n_0_[7]\,
      I2 => \araddr_reg_reg_n_0_[5]\,
      I3 => \araddr_reg_reg_n_0_[6]\,
      I4 => sel0(1),
      I5 => sel0(2),
      O => \rdata_r[14]_i_2_n_0\
    );
\rdata_r[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => total_cnt_reg(15),
      I1 => \rdata_r[31]_i_2_n_0\,
      I2 => ram_rdata(15),
      I3 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[15]_i_1_n_0\
    );
\rdata_r[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => total_cnt_reg(16),
      I1 => \rdata_r[31]_i_2_n_0\,
      I2 => \rdata_r[28]_i_2_n_0\,
      O => \rdata_r[16]_i_1_n_0\
    );
\rdata_r[17]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => total_cnt_reg(17),
      I1 => \rdata_r[31]_i_2_n_0\,
      I2 => ram_rdata(15),
      I3 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[17]_i_1_n_0\
    );
\rdata_r[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => total_cnt_reg(18),
      I1 => \rdata_r[31]_i_2_n_0\,
      I2 => \rdata_r[28]_i_2_n_0\,
      O => \rdata_r[18]_i_1_n_0\
    );
\rdata_r[19]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => total_cnt_reg(19),
      I1 => \rdata_r[31]_i_2_n_0\,
      I2 => ram_rdata(15),
      I3 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[19]_i_1_n_0\
    );
\rdata_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAEAAAAABBEAAAAA"
    )
        port map (
      I0 => \rdata_r[1]_i_2_n_0\,
      I1 => sel0(2),
      I2 => \^leds_o\(1),
      I3 => sel0(0),
      I4 => \rdata_r[1]_i_3_n_0\,
      I5 => rd_ptr1,
      O => \rdata_r[1]_i_1_n_0\
    );
\rdata_r[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata_r[14]_i_2_n_0\,
      I1 => fifo_count_reg(1),
      I2 => \rdata_r[31]_i_2_n_0\,
      I3 => total_cnt_reg(1),
      I4 => ram_rdata(1),
      I5 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[1]_i_2_n_0\
    );
\rdata_r[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \araddr_reg_reg_n_0_[7]\,
      I1 => \araddr_reg_reg_n_0_[5]\,
      I2 => \araddr_reg_reg_n_0_[6]\,
      I3 => sel0(1),
      O => \rdata_r[1]_i_3_n_0\
    );
\rdata_r[1]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \fifo_count[0]_i_3_n_0\,
      I1 => fifo_count_reg(14),
      O => rd_ptr1
    );
\rdata_r[20]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => total_cnt_reg(20),
      I1 => \rdata_r[31]_i_2_n_0\,
      I2 => ram_rdata(15),
      I3 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[20]_i_1_n_0\
    );
\rdata_r[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => total_cnt_reg(21),
      I1 => \rdata_r[31]_i_2_n_0\,
      I2 => \rdata_r[28]_i_2_n_0\,
      O => \rdata_r[21]_i_1_n_0\
    );
\rdata_r[22]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => total_cnt_reg(22),
      I1 => \rdata_r[31]_i_2_n_0\,
      I2 => ram_rdata(15),
      I3 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[22]_i_1_n_0\
    );
\rdata_r[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => total_cnt_reg(23),
      I1 => \rdata_r[31]_i_2_n_0\,
      I2 => ram_rdata(15),
      I3 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[23]_i_1_n_0\
    );
\rdata_r[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => total_cnt_reg(24),
      I1 => \rdata_r[31]_i_2_n_0\,
      I2 => ram_rdata(15),
      I3 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[24]_i_1_n_0\
    );
\rdata_r[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => total_cnt_reg(25),
      I1 => \rdata_r[31]_i_2_n_0\,
      I2 => \rdata_r[28]_i_2_n_0\,
      O => \rdata_r[25]_i_1_n_0\
    );
\rdata_r[26]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => total_cnt_reg(26),
      I1 => \rdata_r[31]_i_2_n_0\,
      I2 => ram_rdata(15),
      I3 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[26]_i_1_n_0\
    );
\rdata_r[27]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => total_cnt_reg(27),
      I1 => \rdata_r[31]_i_2_n_0\,
      I2 => ram_rdata(15),
      I3 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[27]_i_1_n_0\
    );
\rdata_r[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => total_cnt_reg(28),
      I1 => \rdata_r[31]_i_2_n_0\,
      I2 => \rdata_r[28]_i_2_n_0\,
      O => \rdata_r[28]_i_1_n_0\
    );
\rdata_r[28]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080F00000000000"
    )
        port map (
      I0 => ram_rdata(15),
      I1 => pop_nonempty,
      I2 => sel0(0),
      I3 => sel0(2),
      I4 => sel0(1),
      I5 => \rdata_r[31]_i_4_n_0\,
      O => \rdata_r[28]_i_2_n_0\
    );
\rdata_r[29]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => total_cnt_reg(29),
      I1 => \rdata_r[31]_i_2_n_0\,
      I2 => ram_rdata(15),
      I3 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[29]_i_1_n_0\
    );
\rdata_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFEFEFE"
    )
        port map (
      I0 => \rdata_r[2]_i_2_n_0\,
      I1 => \rdata_r[2]_i_3_n_0\,
      I2 => \rdata_r[2]_i_4_n_0\,
      I3 => \rdata_r[31]_i_2_n_0\,
      I4 => total_cnt_reg(2),
      I5 => \rdata_r[2]_i_5_n_0\,
      O => \rdata_r[2]_i_1_n_0\
    );
\rdata_r[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000020F02000"
    )
        port map (
      I0 => fifo_count_reg(14),
      I1 => \fifo_count[0]_i_3_n_0\,
      I2 => \rdata_r[1]_i_3_n_0\,
      I3 => sel0(0),
      I4 => \^lora_trig_o\,
      I5 => sel0(2),
      O => \rdata_r[2]_i_2_n_0\
    );
\rdata_r[2]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => sel0(2),
      I1 => \^leds_o\(2),
      I2 => \rdata_r[3]_i_3_n_0\,
      O => \rdata_r[2]_i_3_n_0\
    );
\rdata_r[2]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \rdata_r[14]_i_2_n_0\,
      I1 => fifo_count_reg(2),
      O => \rdata_r[2]_i_4_n_0\
    );
\rdata_r[2]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \rdata_r[31]_i_3_n_0\,
      I1 => ram_rdata(2),
      O => \rdata_r[2]_i_5_n_0\
    );
\rdata_r[30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => total_cnt_reg(30),
      I1 => \rdata_r[31]_i_2_n_0\,
      I2 => ram_rdata(15),
      I3 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[30]_i_1_n_0\
    );
\rdata_r[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => total_cnt_reg(31),
      I1 => \rdata_r[31]_i_2_n_0\,
      I2 => ram_rdata(15),
      I3 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[31]_i_1_n_0\
    );
\rdata_r[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => sel0(0),
      I1 => \araddr_reg_reg_n_0_[7]\,
      I2 => \araddr_reg_reg_n_0_[5]\,
      I3 => \araddr_reg_reg_n_0_[6]\,
      I4 => sel0(1),
      I5 => sel0(2),
      O => \rdata_r[31]_i_2_n_0\
    );
\rdata_r[31]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => pop_nonempty,
      I1 => sel0(0),
      I2 => sel0(2),
      I3 => sel0(1),
      I4 => \rdata_r[31]_i_4_n_0\,
      O => \rdata_r[31]_i_3_n_0\
    );
\rdata_r[31]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \araddr_reg_reg_n_0_[6]\,
      I1 => \araddr_reg_reg_n_0_[5]\,
      I2 => \araddr_reg_reg_n_0_[7]\,
      O => \rdata_r[31]_i_4_n_0\
    );
\rdata_r[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \rdata_r[3]_i_2_n_0\,
      I1 => \rdata_r[31]_i_2_n_0\,
      I2 => total_cnt_reg(3),
      I3 => ram_rdata(3),
      I4 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[3]_i_1_n_0\
    );
\rdata_r[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F8888888"
    )
        port map (
      I0 => fifo_count_reg(3),
      I1 => \rdata_r[14]_i_2_n_0\,
      I2 => \rdata_r[3]_i_3_n_0\,
      I3 => \^leds_o\(3),
      I4 => sel0(2),
      O => \rdata_r[3]_i_2_n_0\
    );
\rdata_r[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => sel0(1),
      I1 => \araddr_reg_reg_n_0_[6]\,
      I2 => \araddr_reg_reg_n_0_[5]\,
      I3 => \araddr_reg_reg_n_0_[7]\,
      I4 => sel0(0),
      O => \rdata_r[3]_i_3_n_0\
    );
\rdata_r[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => ram_rdata(4),
      I1 => \rdata_r[31]_i_3_n_0\,
      I2 => \rdata_r[4]_i_2_n_0\,
      O => \rdata_r[4]_i_1_n_0\
    );
\rdata_r[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata_r[14]_i_2_n_0\,
      I1 => fifo_count_reg(4),
      I2 => \rdata_r[31]_i_2_n_0\,
      I3 => total_cnt_reg(4),
      I4 => sw_sync2(0),
      I5 => \rdata_r[5]_i_3_n_0\,
      O => \rdata_r[4]_i_2_n_0\
    );
\rdata_r[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => ram_rdata(5),
      I1 => \rdata_r[31]_i_3_n_0\,
      I2 => \rdata_r[5]_i_2_n_0\,
      O => \rdata_r[5]_i_1_n_0\
    );
\rdata_r[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata_r[14]_i_2_n_0\,
      I1 => fifo_count_reg(5),
      I2 => \rdata_r[31]_i_2_n_0\,
      I3 => total_cnt_reg(5),
      I4 => sw_sync2(1),
      I5 => \rdata_r[5]_i_3_n_0\,
      O => \rdata_r[5]_i_2_n_0\
    );
\rdata_r[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
        port map (
      I0 => sel0(1),
      I1 => \araddr_reg_reg_n_0_[6]\,
      I2 => \araddr_reg_reg_n_0_[5]\,
      I3 => \araddr_reg_reg_n_0_[7]\,
      I4 => sel0(2),
      I5 => sel0(0),
      O => \rdata_r[5]_i_3_n_0\
    );
\rdata_r[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata_r[14]_i_2_n_0\,
      I1 => fifo_count_reg(6),
      I2 => \rdata_r[31]_i_2_n_0\,
      I3 => total_cnt_reg(6),
      I4 => ram_rdata(6),
      I5 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[6]_i_1_n_0\
    );
\rdata_r[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata_r[14]_i_2_n_0\,
      I1 => fifo_count_reg(7),
      I2 => \rdata_r[31]_i_2_n_0\,
      I3 => total_cnt_reg(7),
      I4 => ram_rdata(7),
      I5 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[7]_i_1_n_0\
    );
\rdata_r[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata_r[14]_i_2_n_0\,
      I1 => fifo_count_reg(8),
      I2 => \rdata_r[31]_i_2_n_0\,
      I3 => total_cnt_reg(8),
      I4 => ram_rdata(8),
      I5 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[8]_i_1_n_0\
    );
\rdata_r[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata_r[14]_i_2_n_0\,
      I1 => fifo_count_reg(9),
      I2 => \rdata_r[31]_i_2_n_0\,
      I3 => total_cnt_reg(9),
      I4 => ram_rdata(9),
      I5 => \rdata_r[31]_i_3_n_0\,
      O => \rdata_r[9]_i_1_n_0\
    );
\rdata_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[0]_i_1_n_0\,
      Q => s_axi_rdata(0),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[10]_i_1_n_0\,
      Q => s_axi_rdata(10),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[11]_i_1_n_0\,
      Q => s_axi_rdata(11),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[12]_i_1_n_0\,
      Q => s_axi_rdata(12),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[13]_i_1_n_0\,
      Q => s_axi_rdata(13),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[14]_i_1_n_0\,
      Q => s_axi_rdata(14),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[15]_i_1_n_0\,
      Q => s_axi_rdata(15),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[16]_i_1_n_0\,
      Q => s_axi_rdata(16),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[17]_i_1_n_0\,
      Q => s_axi_rdata(17),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[18]_i_1_n_0\,
      Q => s_axi_rdata(18),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[19]_i_1_n_0\,
      Q => s_axi_rdata(19),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[1]_i_1_n_0\,
      Q => s_axi_rdata(1),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[20]_i_1_n_0\,
      Q => s_axi_rdata(20),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[21]_i_1_n_0\,
      Q => s_axi_rdata(21),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[22]_i_1_n_0\,
      Q => s_axi_rdata(22),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[23]_i_1_n_0\,
      Q => s_axi_rdata(23),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[24]_i_1_n_0\,
      Q => s_axi_rdata(24),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[25]_i_1_n_0\,
      Q => s_axi_rdata(25),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[26]_i_1_n_0\,
      Q => s_axi_rdata(26),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[27]_i_1_n_0\,
      Q => s_axi_rdata(27),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[28]_i_1_n_0\,
      Q => s_axi_rdata(28),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[29]_i_1_n_0\,
      Q => s_axi_rdata(29),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[2]_i_1_n_0\,
      Q => s_axi_rdata(2),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[30]_i_1_n_0\,
      Q => s_axi_rdata(30),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[31]_i_1_n_0\,
      Q => s_axi_rdata(31),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[3]_i_1_n_0\,
      Q => s_axi_rdata(3),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[4]_i_1_n_0\,
      Q => s_axi_rdata(4),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[5]_i_1_n_0\,
      Q => s_axi_rdata(5),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[6]_i_1_n_0\,
      Q => s_axi_rdata(6),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[7]_i_1_n_0\,
      Q => s_axi_rdata(7),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[8]_i_1_n_0\,
      Q => s_axi_rdata(8),
      R => bvalid_r_i_1_n_0
    );
\rdata_r_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rdata_r(0),
      D => \rdata_r[9]_i_1_n_0\,
      Q => s_axi_rdata(9),
      R => bvalid_r_i_1_n_0
    );
rvalid_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F7F0"
    )
        port map (
      I0 => \FSM_onehot_rd_state_reg_n_0_[2]\,
      I1 => s_axi_rready,
      I2 => rdata_r(0),
      I3 => \^s_axi_rvalid\,
      O => rvalid_r_i_1_n_0
    );
rvalid_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => rvalid_r_i_1_n_0,
      Q => \^s_axi_rvalid\,
      R => bvalid_r_i_1_n_0
    );
\sample_data[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => \^sck_reg_reg_0\,
      I1 => p_1_in_1,
      I2 => bit_cnt(5),
      I3 => \sample_data[15]_i_2_n_0\,
      I4 => sample_push0,
      I5 => \sample_data[15]_i_3_n_0\,
      O => \sample_data[15]_i_1_n_0\
    );
\sample_data[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => bit_cnt(3),
      I1 => bit_cnt(4),
      O => \sample_data[15]_i_2_n_0\
    );
\sample_data[15]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => bit_cnt(2),
      I1 => bit_cnt(1),
      I2 => bit_cnt(0),
      O => \sample_data[15]_i_3_n_0\
    );
\sample_data_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \sample_data[15]_i_1_n_0\,
      D => \shift_reg_reg_n_0_[7]\,
      Q => sample_data(0),
      R => '0'
    );
\sample_data_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \sample_data[15]_i_1_n_0\,
      D => \shift_reg_reg_n_0_[17]\,
      Q => sample_data(10),
      R => '0'
    );
\sample_data_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \sample_data[15]_i_1_n_0\,
      D => \shift_reg_reg_n_0_[18]\,
      Q => sample_data(11),
      R => '0'
    );
\sample_data_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \sample_data[15]_i_1_n_0\,
      D => \shift_reg_reg_n_0_[19]\,
      Q => sample_data(12),
      R => '0'
    );
\sample_data_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \sample_data[15]_i_1_n_0\,
      D => \shift_reg_reg_n_0_[20]\,
      Q => sample_data(13),
      R => '0'
    );
\sample_data_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \sample_data[15]_i_1_n_0\,
      D => \shift_reg_reg_n_0_[21]\,
      Q => sample_data(14),
      R => '0'
    );
\sample_data_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \sample_data[15]_i_1_n_0\,
      D => \shift_reg_reg_n_0_[22]\,
      Q => sample_data(15),
      R => '0'
    );
\sample_data_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \sample_data[15]_i_1_n_0\,
      D => \shift_reg_reg_n_0_[8]\,
      Q => sample_data(1),
      R => '0'
    );
\sample_data_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \sample_data[15]_i_1_n_0\,
      D => \shift_reg_reg_n_0_[9]\,
      Q => sample_data(2),
      R => '0'
    );
\sample_data_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \sample_data[15]_i_1_n_0\,
      D => \shift_reg_reg_n_0_[10]\,
      Q => sample_data(3),
      R => '0'
    );
\sample_data_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \sample_data[15]_i_1_n_0\,
      D => \shift_reg_reg_n_0_[11]\,
      Q => sample_data(4),
      R => '0'
    );
\sample_data_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \sample_data[15]_i_1_n_0\,
      D => \shift_reg_reg_n_0_[12]\,
      Q => sample_data(5),
      R => '0'
    );
\sample_data_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \sample_data[15]_i_1_n_0\,
      D => \shift_reg_reg_n_0_[13]\,
      Q => sample_data(6),
      R => '0'
    );
\sample_data_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \sample_data[15]_i_1_n_0\,
      D => \shift_reg_reg_n_0_[14]\,
      Q => sample_data(7),
      R => '0'
    );
\sample_data_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \sample_data[15]_i_1_n_0\,
      D => \shift_reg_reg_n_0_[15]\,
      Q => sample_data(8),
      R => '0'
    );
\sample_data_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \sample_data[15]_i_1_n_0\,
      D => \shift_reg_reg_n_0_[16]\,
      Q => sample_data(9),
      R => '0'
    );
\sample_push1_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \sample_push1_inferred__0/i__carry_n_0\,
      CO(2) => \sample_push1_inferred__0/i__carry_n_1\,
      CO(1) => \sample_push1_inferred__0/i__carry_n_2\,
      CO(0) => \sample_push1_inferred__0/i__carry_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => nco_acc(1),
      DI(0) => '0',
      O(3) => \sample_push1_inferred__0/i__carry_n_4\,
      O(2) => \sample_push1_inferred__0/i__carry_n_5\,
      O(1) => \sample_push1_inferred__0/i__carry_n_6\,
      O(0) => \NLW_sample_push1_inferred__0/i__carry_O_UNCONNECTED\(0),
      S(3 downto 2) => nco_acc(3 downto 2),
      S(1) => \i__carry_i_1_n_0\,
      S(0) => '0'
    );
\sample_push1_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_push1_inferred__0/i__carry_n_0\,
      CO(3) => \sample_push1_inferred__0/i__carry__0_n_0\,
      CO(2) => \sample_push1_inferred__0/i__carry__0_n_1\,
      CO(1) => \sample_push1_inferred__0/i__carry__0_n_2\,
      CO(0) => \sample_push1_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 1) => nco_acc(6 downto 5),
      DI(0) => '0',
      O(3) => \sample_push1_inferred__0/i__carry__0_n_4\,
      O(2) => \sample_push1_inferred__0/i__carry__0_n_5\,
      O(1) => \sample_push1_inferred__0/i__carry__0_n_6\,
      O(0) => \sample_push1_inferred__0/i__carry__0_n_7\,
      S(3) => nco_acc(7),
      S(2) => \i__carry__0_i_1_n_0\,
      S(1) => \i__carry__0_i_2_n_0\,
      S(0) => nco_acc(4)
    );
\sample_push1_inferred__0/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_push1_inferred__0/i__carry__0_n_0\,
      CO(3) => \sample_push1_inferred__0/i__carry__1_n_0\,
      CO(2) => \sample_push1_inferred__0/i__carry__1_n_1\,
      CO(1) => \sample_push1_inferred__0/i__carry__1_n_2\,
      CO(0) => \sample_push1_inferred__0/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => nco_acc(11 downto 10),
      DI(1) => '0',
      DI(0) => nco_acc(8),
      O(3) => \sample_push1_inferred__0/i__carry__1_n_4\,
      O(2) => \sample_push1_inferred__0/i__carry__1_n_5\,
      O(1) => \sample_push1_inferred__0/i__carry__1_n_6\,
      O(0) => \sample_push1_inferred__0/i__carry__1_n_7\,
      S(3) => \i__carry__1_i_1_n_0\,
      S(2) => \i__carry__1_i_2_n_0\,
      S(1) => nco_acc(9),
      S(0) => \i__carry__1_i_3_n_0\
    );
\sample_push1_inferred__0/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_push1_inferred__0/i__carry__1_n_0\,
      CO(3) => \sample_push1_inferred__0/i__carry__2_n_0\,
      CO(2) => \sample_push1_inferred__0/i__carry__2_n_1\,
      CO(1) => \sample_push1_inferred__0/i__carry__2_n_2\,
      CO(0) => \sample_push1_inferred__0/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => nco_acc(13),
      DI(0) => '0',
      O(3) => \sample_push1_inferred__0/i__carry__2_n_4\,
      O(2) => \sample_push1_inferred__0/i__carry__2_n_5\,
      O(1) => \sample_push1_inferred__0/i__carry__2_n_6\,
      O(0) => \sample_push1_inferred__0/i__carry__2_n_7\,
      S(3 downto 2) => nco_acc(15 downto 14),
      S(1) => \i__carry__2_i_1_n_0\,
      S(0) => nco_acc(12)
    );
\sample_push1_inferred__0/i__carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_push1_inferred__0/i__carry__2_n_0\,
      CO(3) => \sample_push1_inferred__0/i__carry__3_n_0\,
      CO(2) => \sample_push1_inferred__0/i__carry__3_n_1\,
      CO(1) => \sample_push1_inferred__0/i__carry__3_n_2\,
      CO(0) => \sample_push1_inferred__0/i__carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => nco_acc(19 downto 17),
      DI(0) => '0',
      O(3) => \sample_push1_inferred__0/i__carry__3_n_4\,
      O(2) => \sample_push1_inferred__0/i__carry__3_n_5\,
      O(1) => \sample_push1_inferred__0/i__carry__3_n_6\,
      O(0) => \sample_push1_inferred__0/i__carry__3_n_7\,
      S(3) => \i__carry__3_i_1_n_0\,
      S(2) => \i__carry__3_i_2_n_0\,
      S(1) => \i__carry__3_i_3_n_0\,
      S(0) => nco_acc(16)
    );
\sample_push1_inferred__0/i__carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_push1_inferred__0/i__carry__3_n_0\,
      CO(3) => \sample_push1_inferred__0/i__carry__4_n_0\,
      CO(2) => \sample_push1_inferred__0/i__carry__4_n_1\,
      CO(1) => \sample_push1_inferred__0/i__carry__4_n_2\,
      CO(0) => \sample_push1_inferred__0/i__carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => nco_acc(21 downto 20),
      O(3) => \sample_push1_inferred__0/i__carry__4_n_4\,
      O(2) => \sample_push1_inferred__0/i__carry__4_n_5\,
      O(1) => \sample_push1_inferred__0/i__carry__4_n_6\,
      O(0) => \sample_push1_inferred__0/i__carry__4_n_7\,
      S(3 downto 2) => nco_acc(23 downto 22),
      S(1) => \i__carry__4_i_1_n_0\,
      S(0) => \i__carry__4_i_2_n_0\
    );
\sample_push1_inferred__0/i__carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_push1_inferred__0/i__carry__4_n_0\,
      CO(3) => \sample_push1_inferred__0/i__carry__5_n_0\,
      CO(2) => \sample_push1_inferred__0/i__carry__5_n_1\,
      CO(1) => \sample_push1_inferred__0/i__carry__5_n_2\,
      CO(0) => \sample_push1_inferred__0/i__carry__5_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => nco_acc(26),
      DI(1) => '0',
      DI(0) => nco_acc(24),
      O(3) => \sample_push1_inferred__0/i__carry__5_n_4\,
      O(2) => \sample_push1_inferred__0/i__carry__5_n_5\,
      O(1) => \sample_push1_inferred__0/i__carry__5_n_6\,
      O(0) => \sample_push1_inferred__0/i__carry__5_n_7\,
      S(3) => nco_acc(27),
      S(2) => \i__carry__5_i_1_n_0\,
      S(1) => nco_acc(25),
      S(0) => \i__carry__5_i_2_n_0\
    );
\sample_push1_inferred__0/i__carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_push1_inferred__0/i__carry__5_n_0\,
      CO(3) => \sample_push1_inferred__0/i__carry__6_n_0\,
      CO(2) => \sample_push1_inferred__0/i__carry__6_n_1\,
      CO(1) => \sample_push1_inferred__0/i__carry__6_n_2\,
      CO(0) => \sample_push1_inferred__0/i__carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \sample_push1_inferred__0/i__carry__6_n_4\,
      O(2) => \sample_push1_inferred__0/i__carry__6_n_5\,
      O(1) => \sample_push1_inferred__0/i__carry__6_n_6\,
      O(0) => \sample_push1_inferred__0/i__carry__6_n_7\,
      S(3 downto 0) => nco_acc(31 downto 28)
    );
sample_push_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000800"
    )
        port map (
      I0 => bit_cnt(3),
      I1 => bit_cnt(4),
      I2 => \^sck_reg_reg_0\,
      I3 => p_1_in_1,
      I4 => bit_cnt(5),
      I5 => \sample_data[15]_i_3_n_0\,
      O => sample_push
    );
sample_push_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => sample_push,
      Q => sample_push_reg_n_0,
      R => sample_push0
    );
sck_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => p_2_in(0),
      O => sample_push0
    );
sck_reg_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_1_in_1,
      I1 => \^sck_reg_reg_0\,
      O => sck_reg_i_2_n_0
    );
sck_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => sck_reg_i_2_n_0,
      Q => \^sck_reg_reg_0\,
      R => sample_push0
    );
sck_reg_reg_i_3: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_push1_inferred__0/i__carry__6_n_0\,
      CO(3 downto 1) => NLW_sck_reg_reg_i_3_CO_UNCONNECTED(3 downto 1),
      CO(0) => p_1_in_1,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_sck_reg_reg_i_3_O_UNCONNECTED(3 downto 0),
      S(3 downto 0) => B"0001"
    );
sd_sync1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i2s_sd,
      Q => sd_sync1,
      R => bvalid_r_i_1_n_0
    );
sd_sync2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => sd_sync1,
      Q => sd_sync2,
      R => bvalid_r_i_1_n_0
    );
\shift_reg[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004040404040400"
    )
        port map (
      I0 => bit_cnt(5),
      I1 => p_1_in_1,
      I2 => \^sck_reg_reg_0\,
      I3 => bit_cnt(4),
      I4 => bit_cnt(3),
      I5 => \sample_data[15]_i_3_n_0\,
      O => shift_reg_0(0)
    );
\shift_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => sd_sync2,
      Q => shift_reg(0),
      R => sample_push0
    );
\shift_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => \shift_reg_reg_n_0_[9]\,
      Q => \shift_reg_reg_n_0_[10]\,
      R => sample_push0
    );
\shift_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => \shift_reg_reg_n_0_[10]\,
      Q => \shift_reg_reg_n_0_[11]\,
      R => sample_push0
    );
\shift_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => \shift_reg_reg_n_0_[11]\,
      Q => \shift_reg_reg_n_0_[12]\,
      R => sample_push0
    );
\shift_reg_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => \shift_reg_reg_n_0_[12]\,
      Q => \shift_reg_reg_n_0_[13]\,
      R => sample_push0
    );
\shift_reg_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => \shift_reg_reg_n_0_[13]\,
      Q => \shift_reg_reg_n_0_[14]\,
      R => sample_push0
    );
\shift_reg_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => \shift_reg_reg_n_0_[14]\,
      Q => \shift_reg_reg_n_0_[15]\,
      R => sample_push0
    );
\shift_reg_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => \shift_reg_reg_n_0_[15]\,
      Q => \shift_reg_reg_n_0_[16]\,
      R => sample_push0
    );
\shift_reg_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => \shift_reg_reg_n_0_[16]\,
      Q => \shift_reg_reg_n_0_[17]\,
      R => sample_push0
    );
\shift_reg_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => \shift_reg_reg_n_0_[17]\,
      Q => \shift_reg_reg_n_0_[18]\,
      R => sample_push0
    );
\shift_reg_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => \shift_reg_reg_n_0_[18]\,
      Q => \shift_reg_reg_n_0_[19]\,
      R => sample_push0
    );
\shift_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => shift_reg(0),
      Q => shift_reg(1),
      R => sample_push0
    );
\shift_reg_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => \shift_reg_reg_n_0_[19]\,
      Q => \shift_reg_reg_n_0_[20]\,
      R => sample_push0
    );
\shift_reg_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => \shift_reg_reg_n_0_[20]\,
      Q => \shift_reg_reg_n_0_[21]\,
      R => sample_push0
    );
\shift_reg_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => \shift_reg_reg_n_0_[21]\,
      Q => \shift_reg_reg_n_0_[22]\,
      R => sample_push0
    );
\shift_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => shift_reg(1),
      Q => shift_reg(2),
      R => sample_push0
    );
\shift_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => shift_reg(2),
      Q => shift_reg(3),
      R => sample_push0
    );
\shift_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => shift_reg(3),
      Q => shift_reg(4),
      R => sample_push0
    );
\shift_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => shift_reg(4),
      Q => shift_reg(5),
      R => sample_push0
    );
\shift_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => shift_reg(5),
      Q => shift_reg(6),
      R => sample_push0
    );
\shift_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => shift_reg(6),
      Q => \shift_reg_reg_n_0_[7]\,
      R => sample_push0
    );
\shift_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => \shift_reg_reg_n_0_[7]\,
      Q => \shift_reg_reg_n_0_[8]\,
      R => sample_push0
    );
\shift_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => shift_reg_0(0),
      D => \shift_reg_reg_n_0_[8]\,
      Q => \shift_reg_reg_n_0_[9]\,
      R => sample_push0
    );
\sw_sync1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => switches_i(0),
      Q => sw_sync1(0),
      R => bvalid_r_i_1_n_0
    );
\sw_sync1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => switches_i(1),
      Q => sw_sync1(1),
      R => bvalid_r_i_1_n_0
    );
\sw_sync2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => sw_sync1(0),
      Q => sw_sync2(0),
      R => bvalid_r_i_1_n_0
    );
\sw_sync2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => sw_sync1(1),
      Q => sw_sync2(1),
      R => bvalid_r_i_1_n_0
    );
\total_cnt[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => total_cnt_reg(0),
      O => \total_cnt[0]_i_2_n_0\
    );
\total_cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[0]_i_1_n_7\,
      Q => total_cnt_reg(0),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \total_cnt_reg[0]_i_1_n_0\,
      CO(2) => \total_cnt_reg[0]_i_1_n_1\,
      CO(1) => \total_cnt_reg[0]_i_1_n_2\,
      CO(0) => \total_cnt_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \total_cnt_reg[0]_i_1_n_4\,
      O(2) => \total_cnt_reg[0]_i_1_n_5\,
      O(1) => \total_cnt_reg[0]_i_1_n_6\,
      O(0) => \total_cnt_reg[0]_i_1_n_7\,
      S(3 downto 1) => total_cnt_reg(3 downto 1),
      S(0) => \total_cnt[0]_i_2_n_0\
    );
\total_cnt_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[8]_i_1_n_5\,
      Q => total_cnt_reg(10),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[8]_i_1_n_4\,
      Q => total_cnt_reg(11),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[12]_i_1_n_7\,
      Q => total_cnt_reg(12),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \total_cnt_reg[8]_i_1_n_0\,
      CO(3) => \total_cnt_reg[12]_i_1_n_0\,
      CO(2) => \total_cnt_reg[12]_i_1_n_1\,
      CO(1) => \total_cnt_reg[12]_i_1_n_2\,
      CO(0) => \total_cnt_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \total_cnt_reg[12]_i_1_n_4\,
      O(2) => \total_cnt_reg[12]_i_1_n_5\,
      O(1) => \total_cnt_reg[12]_i_1_n_6\,
      O(0) => \total_cnt_reg[12]_i_1_n_7\,
      S(3 downto 0) => total_cnt_reg(15 downto 12)
    );
\total_cnt_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[12]_i_1_n_6\,
      Q => total_cnt_reg(13),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[12]_i_1_n_5\,
      Q => total_cnt_reg(14),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[12]_i_1_n_4\,
      Q => total_cnt_reg(15),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[16]_i_1_n_7\,
      Q => total_cnt_reg(16),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \total_cnt_reg[12]_i_1_n_0\,
      CO(3) => \total_cnt_reg[16]_i_1_n_0\,
      CO(2) => \total_cnt_reg[16]_i_1_n_1\,
      CO(1) => \total_cnt_reg[16]_i_1_n_2\,
      CO(0) => \total_cnt_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \total_cnt_reg[16]_i_1_n_4\,
      O(2) => \total_cnt_reg[16]_i_1_n_5\,
      O(1) => \total_cnt_reg[16]_i_1_n_6\,
      O(0) => \total_cnt_reg[16]_i_1_n_7\,
      S(3 downto 0) => total_cnt_reg(19 downto 16)
    );
\total_cnt_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[16]_i_1_n_6\,
      Q => total_cnt_reg(17),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[16]_i_1_n_5\,
      Q => total_cnt_reg(18),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[16]_i_1_n_4\,
      Q => total_cnt_reg(19),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[0]_i_1_n_6\,
      Q => total_cnt_reg(1),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[20]_i_1_n_7\,
      Q => total_cnt_reg(20),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \total_cnt_reg[16]_i_1_n_0\,
      CO(3) => \total_cnt_reg[20]_i_1_n_0\,
      CO(2) => \total_cnt_reg[20]_i_1_n_1\,
      CO(1) => \total_cnt_reg[20]_i_1_n_2\,
      CO(0) => \total_cnt_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \total_cnt_reg[20]_i_1_n_4\,
      O(2) => \total_cnt_reg[20]_i_1_n_5\,
      O(1) => \total_cnt_reg[20]_i_1_n_6\,
      O(0) => \total_cnt_reg[20]_i_1_n_7\,
      S(3 downto 0) => total_cnt_reg(23 downto 20)
    );
\total_cnt_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[20]_i_1_n_6\,
      Q => total_cnt_reg(21),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[20]_i_1_n_5\,
      Q => total_cnt_reg(22),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[20]_i_1_n_4\,
      Q => total_cnt_reg(23),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[24]_i_1_n_7\,
      Q => total_cnt_reg(24),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \total_cnt_reg[20]_i_1_n_0\,
      CO(3) => \total_cnt_reg[24]_i_1_n_0\,
      CO(2) => \total_cnt_reg[24]_i_1_n_1\,
      CO(1) => \total_cnt_reg[24]_i_1_n_2\,
      CO(0) => \total_cnt_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \total_cnt_reg[24]_i_1_n_4\,
      O(2) => \total_cnt_reg[24]_i_1_n_5\,
      O(1) => \total_cnt_reg[24]_i_1_n_6\,
      O(0) => \total_cnt_reg[24]_i_1_n_7\,
      S(3 downto 0) => total_cnt_reg(27 downto 24)
    );
\total_cnt_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[24]_i_1_n_6\,
      Q => total_cnt_reg(25),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[24]_i_1_n_5\,
      Q => total_cnt_reg(26),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[24]_i_1_n_4\,
      Q => total_cnt_reg(27),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[28]_i_1_n_7\,
      Q => total_cnt_reg(28),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \total_cnt_reg[24]_i_1_n_0\,
      CO(3) => \NLW_total_cnt_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \total_cnt_reg[28]_i_1_n_1\,
      CO(1) => \total_cnt_reg[28]_i_1_n_2\,
      CO(0) => \total_cnt_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \total_cnt_reg[28]_i_1_n_4\,
      O(2) => \total_cnt_reg[28]_i_1_n_5\,
      O(1) => \total_cnt_reg[28]_i_1_n_6\,
      O(0) => \total_cnt_reg[28]_i_1_n_7\,
      S(3 downto 0) => total_cnt_reg(31 downto 28)
    );
\total_cnt_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[28]_i_1_n_6\,
      Q => total_cnt_reg(29),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[0]_i_1_n_5\,
      Q => total_cnt_reg(2),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[28]_i_1_n_5\,
      Q => total_cnt_reg(30),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[28]_i_1_n_4\,
      Q => total_cnt_reg(31),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[0]_i_1_n_4\,
      Q => total_cnt_reg(3),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[4]_i_1_n_7\,
      Q => total_cnt_reg(4),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \total_cnt_reg[0]_i_1_n_0\,
      CO(3) => \total_cnt_reg[4]_i_1_n_0\,
      CO(2) => \total_cnt_reg[4]_i_1_n_1\,
      CO(1) => \total_cnt_reg[4]_i_1_n_2\,
      CO(0) => \total_cnt_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \total_cnt_reg[4]_i_1_n_4\,
      O(2) => \total_cnt_reg[4]_i_1_n_5\,
      O(1) => \total_cnt_reg[4]_i_1_n_6\,
      O(0) => \total_cnt_reg[4]_i_1_n_7\,
      S(3 downto 0) => total_cnt_reg(7 downto 4)
    );
\total_cnt_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[4]_i_1_n_6\,
      Q => total_cnt_reg(5),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[4]_i_1_n_5\,
      Q => total_cnt_reg(6),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[4]_i_1_n_4\,
      Q => total_cnt_reg(7),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[8]_i_1_n_7\,
      Q => total_cnt_reg(8),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\total_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \total_cnt_reg[4]_i_1_n_0\,
      CO(3) => \total_cnt_reg[8]_i_1_n_0\,
      CO(2) => \total_cnt_reg[8]_i_1_n_1\,
      CO(1) => \total_cnt_reg[8]_i_1_n_2\,
      CO(0) => \total_cnt_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \total_cnt_reg[8]_i_1_n_4\,
      O(2) => \total_cnt_reg[8]_i_1_n_5\,
      O(1) => \total_cnt_reg[8]_i_1_n_6\,
      O(0) => \total_cnt_reg[8]_i_1_n_7\,
      S(3 downto 0) => total_cnt_reg(11 downto 8)
    );
\total_cnt_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_push_reg_n_0,
      D => \total_cnt_reg[8]_i_1_n_6\,
      Q => total_cnt_reg(9),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
w_latched_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C008CC08"
    )
        port map (
      I0 => s_axi_wvalid,
      I1 => s_axi_aresetn,
      I2 => \^bvalid_r_reg_0\,
      I3 => w_latched_reg_n_0,
      I4 => aw_latched_reg_n_0,
      O => w_latched_i_1_n_0
    );
w_latched_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => w_latched_i_1_n_0,
      Q => w_latched_reg_n_0,
      R => '0'
    );
\wdata_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wready_r_i_1_n_0,
      D => s_axi_wdata(0),
      Q => \wdata_reg_reg_n_0_[0]\,
      R => '0'
    );
\wdata_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wready_r_i_1_n_0,
      D => s_axi_wdata(1),
      Q => \wdata_reg_reg_n_0_[1]\,
      R => '0'
    );
\wdata_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wready_r_i_1_n_0,
      D => s_axi_wdata(2),
      Q => p_1_in,
      R => '0'
    );
\wdata_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => wready_r_i_1_n_0,
      D => s_axi_wdata(3),
      Q => \wdata_reg_reg_n_0_[3]\,
      R => '0'
    );
\wr_ptr[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wr_ptr_reg(0),
      O => \wr_ptr[0]_i_2_n_0\
    );
\wr_ptr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => fifo_ram_reg_0_i_1_n_0,
      D => \wr_ptr_reg[0]_i_1_n_7\,
      Q => wr_ptr_reg(0),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\wr_ptr_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \wr_ptr_reg[0]_i_1_n_0\,
      CO(2) => \wr_ptr_reg[0]_i_1_n_1\,
      CO(1) => \wr_ptr_reg[0]_i_1_n_2\,
      CO(0) => \wr_ptr_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \wr_ptr_reg[0]_i_1_n_4\,
      O(2) => \wr_ptr_reg[0]_i_1_n_5\,
      O(1) => \wr_ptr_reg[0]_i_1_n_6\,
      O(0) => \wr_ptr_reg[0]_i_1_n_7\,
      S(3 downto 1) => wr_ptr_reg(3 downto 1),
      S(0) => \wr_ptr[0]_i_2_n_0\
    );
\wr_ptr_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => fifo_ram_reg_0_i_1_n_0,
      D => \wr_ptr_reg[8]_i_1_n_5\,
      Q => wr_ptr_reg(10),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\wr_ptr_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => fifo_ram_reg_0_i_1_n_0,
      D => \wr_ptr_reg[8]_i_1_n_4\,
      Q => wr_ptr_reg(11),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\wr_ptr_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => fifo_ram_reg_0_i_1_n_0,
      D => \wr_ptr_reg[12]_i_1_n_7\,
      Q => wr_ptr_reg(12),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\wr_ptr_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wr_ptr_reg[8]_i_1_n_0\,
      CO(3 downto 1) => \NLW_wr_ptr_reg[12]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \wr_ptr_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_wr_ptr_reg[12]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \wr_ptr_reg[12]_i_1_n_6\,
      O(0) => \wr_ptr_reg[12]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1 downto 0) => wr_ptr_reg(13 downto 12)
    );
\wr_ptr_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => fifo_ram_reg_0_i_1_n_0,
      D => \wr_ptr_reg[12]_i_1_n_6\,
      Q => wr_ptr_reg(13),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\wr_ptr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => fifo_ram_reg_0_i_1_n_0,
      D => \wr_ptr_reg[0]_i_1_n_6\,
      Q => wr_ptr_reg(1),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\wr_ptr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => fifo_ram_reg_0_i_1_n_0,
      D => \wr_ptr_reg[0]_i_1_n_5\,
      Q => wr_ptr_reg(2),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\wr_ptr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => fifo_ram_reg_0_i_1_n_0,
      D => \wr_ptr_reg[0]_i_1_n_4\,
      Q => wr_ptr_reg(3),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\wr_ptr_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => fifo_ram_reg_0_i_1_n_0,
      D => \wr_ptr_reg[4]_i_1_n_7\,
      Q => wr_ptr_reg(4),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\wr_ptr_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wr_ptr_reg[0]_i_1_n_0\,
      CO(3) => \wr_ptr_reg[4]_i_1_n_0\,
      CO(2) => \wr_ptr_reg[4]_i_1_n_1\,
      CO(1) => \wr_ptr_reg[4]_i_1_n_2\,
      CO(0) => \wr_ptr_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wr_ptr_reg[4]_i_1_n_4\,
      O(2) => \wr_ptr_reg[4]_i_1_n_5\,
      O(1) => \wr_ptr_reg[4]_i_1_n_6\,
      O(0) => \wr_ptr_reg[4]_i_1_n_7\,
      S(3 downto 0) => wr_ptr_reg(7 downto 4)
    );
\wr_ptr_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => fifo_ram_reg_0_i_1_n_0,
      D => \wr_ptr_reg[4]_i_1_n_6\,
      Q => wr_ptr_reg(5),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\wr_ptr_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => fifo_ram_reg_0_i_1_n_0,
      D => \wr_ptr_reg[4]_i_1_n_5\,
      Q => wr_ptr_reg(6),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\wr_ptr_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => fifo_ram_reg_0_i_1_n_0,
      D => \wr_ptr_reg[4]_i_1_n_4\,
      Q => wr_ptr_reg(7),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\wr_ptr_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => fifo_ram_reg_0_i_1_n_0,
      D => \wr_ptr_reg[8]_i_1_n_7\,
      Q => wr_ptr_reg(8),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
\wr_ptr_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wr_ptr_reg[4]_i_1_n_0\,
      CO(3) => \wr_ptr_reg[8]_i_1_n_0\,
      CO(2) => \wr_ptr_reg[8]_i_1_n_1\,
      CO(1) => \wr_ptr_reg[8]_i_1_n_2\,
      CO(0) => \wr_ptr_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wr_ptr_reg[8]_i_1_n_4\,
      O(2) => \wr_ptr_reg[8]_i_1_n_5\,
      O(1) => \wr_ptr_reg[8]_i_1_n_6\,
      O(0) => \wr_ptr_reg[8]_i_1_n_7\,
      S(3 downto 0) => wr_ptr_reg(11 downto 8)
    );
\wr_ptr_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => fifo_ram_reg_0_i_1_n_0,
      D => \wr_ptr_reg[8]_i_1_n_6\,
      Q => wr_ptr_reg(9),
      R => \rd_ptr_rep[13]_i_1_n_0\
    );
wready_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => w_latched_reg_n_0,
      I1 => s_axi_wvalid,
      I2 => s_axi_aresetn,
      I3 => \^bvalid_r_reg_0\,
      O => wready_r_i_1_n_0
    );
wready_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => wready_r_i_1_n_0,
      Q => s_axi_wready,
      R => '0'
    );
ws_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8800808080808080"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => p_2_in(0),
      I2 => \^i2s_ws\,
      I3 => next_b(5),
      I4 => p_1_in_1,
      I5 => \^sck_reg_reg_0\,
      O => ws_reg_i_1_n_0
    );
ws_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => ws_reg_i_1_n_0,
      Q => \^i2s_ws\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_i2s_rx_0_0 is
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_axi_i2s_rx_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_axi_i2s_rx_0_0 : entity is "system_axi_i2s_rx_0_0,axi_i2s_rx,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of system_axi_i2s_rx_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of system_axi_i2s_rx_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of system_axi_i2s_rx_0_0 : entity is "axi_i2s_rx,Vivado 2026.1";
end system_axi_i2s_rx_0_0;

architecture STRUCTURE of system_axi_i2s_rx_0_0 is
  signal \<const0>\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of s_axi_aclk : signal is "xilinx.com:signal:clock:1.0 s_axi_aclk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of s_axi_aclk : signal is "slave s_axi_aclk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of s_axi_aclk : signal is "XIL_INTERFACENAME s_axi_aclk, ASSOCIATED_BUSIF s_axi, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute x_interface_info of s_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 s_axi_aresetn RST";
  attribute x_interface_mode of s_axi_aresetn : signal is "slave s_axi_aresetn";
  attribute x_interface_parameter of s_axi_aresetn : signal is "XIL_INTERFACENAME s_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of s_axi_arready : signal is "xilinx.com:interface:aximm:1.0 s_axi ARREADY";
  attribute x_interface_info of s_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi ARVALID";
  attribute x_interface_info of s_axi_awready : signal is "xilinx.com:interface:aximm:1.0 s_axi AWREADY";
  attribute x_interface_info of s_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi AWVALID";
  attribute x_interface_info of s_axi_bready : signal is "xilinx.com:interface:aximm:1.0 s_axi BREADY";
  attribute x_interface_info of s_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi BVALID";
  attribute x_interface_info of s_axi_rready : signal is "xilinx.com:interface:aximm:1.0 s_axi RREADY";
  attribute x_interface_info of s_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi RVALID";
  attribute x_interface_info of s_axi_wready : signal is "xilinx.com:interface:aximm:1.0 s_axi WREADY";
  attribute x_interface_info of s_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi WVALID";
  attribute x_interface_info of s_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 s_axi ARADDR";
  attribute x_interface_info of s_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 s_axi ARPROT";
  attribute x_interface_info of s_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 s_axi AWADDR";
  attribute x_interface_mode of s_axi_awaddr : signal is "slave s_axi";
  attribute x_interface_parameter of s_axi_awaddr : signal is "XIL_INTERFACENAME s_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 8, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute x_interface_info of s_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 s_axi AWPROT";
  attribute x_interface_info of s_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 s_axi BRESP";
  attribute x_interface_info of s_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 s_axi RDATA";
  attribute x_interface_info of s_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 s_axi RRESP";
  attribute x_interface_info of s_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 s_axi WDATA";
  attribute x_interface_info of s_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 s_axi WSTRB";
begin
  i2s_lr_sel <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.system_axi_i2s_rx_0_0_axi_i2s_rx
     port map (
      bvalid_r_reg_0 => s_axi_bvalid,
      i2s_sd => i2s_sd,
      i2s_ws => i2s_ws,
      leds_o(3 downto 0) => leds_o(3 downto 0),
      lora_trig_o => lora_trig_o,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(5 downto 0) => s_axi_araddr(7 downto 2),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(5 downto 0) => s_axi_awaddr(7 downto 2),
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata(3 downto 0) => s_axi_wdata(3 downto 0),
      s_axi_wready => s_axi_wready,
      s_axi_wvalid => s_axi_wvalid,
      sck_reg_reg_0 => i2s_sck,
      switches_i(1 downto 0) => switches_i(1 downto 0)
    );
end STRUCTURE;
