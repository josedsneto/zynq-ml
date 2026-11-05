-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2026.1 (lin64) Build 6511674 Tue Jun 16 11:01:26 MDT 2026
-- Date        : Wed Nov  4 20:37:05 2026
-- Host        : pop-os running 64-bit Pop!_OS 24.04 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/nectx/Dev/zynq_ml/zynq_ml.gen/sources_1/bd/system/ip/system_axi_uart_0_0/system_axi_uart_0_0_sim_netlist.vhdl
-- Design      : system_axi_uart_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_uart_0_0_uart_rx is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    error_reg : out STD_LOGIC;
    rx_data_avail_reg : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    raw_rxd : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    baud_tick_16 : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    rx_data_avail : in STD_LOGIC;
    rx_data_avail_reg_0 : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    rx_data_avail_reg_1 : in STD_LOGIC;
    rx_data_avail_reg_2 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_uart_0_0_uart_rx : entity is "uart_rx";
end system_axi_uart_0_0_uart_rx;

architecture STRUCTURE of system_axi_uart_0_0_uart_rx is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \FSM_sequential_state[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_3_n_0\ : STD_LOGIC;
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal bit_idx : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \bit_idx[0]_i_1_n_0\ : STD_LOGIC;
  signal \bit_idx[1]_i_1_n_0\ : STD_LOGIC;
  signal \bit_idx[2]_i_1_n_0\ : STD_LOGIC;
  signal \bit_idx[2]_i_2_n_0\ : STD_LOGIC;
  signal \bit_idx_reg_n_0_[0]\ : STD_LOGIC;
  signal \bit_idx_reg_n_0_[1]\ : STD_LOGIC;
  signal \bit_idx_reg_n_0_[2]\ : STD_LOGIC;
  signal \^error_reg\ : STD_LOGIC;
  signal error_reg_i_1_n_0 : STD_LOGIC;
  signal rx_shreg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rx_shreg_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rxd_reg : STD_LOGIC;
  signal rxd_sync2_reg_srl2_n_0 : STD_LOGIC;
  signal sample_cnt : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \sample_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \sample_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \sample_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \sample_cnt[2]_i_2_n_0\ : STD_LOGIC;
  signal \sample_cnt[3]_i_2_n_0\ : STD_LOGIC;
  signal \sample_cnt[3]_i_3_n_0\ : STD_LOGIC;
  signal \sample_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \sample_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \sample_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \sample_cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal valid_reg_i_1_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_1__0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_3\ : label is "soft_lutpair1";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "start_bit:01,idle:00,data_bits:10,stop_bit:11";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "start_bit:01,idle:00,data_bits:10,stop_bit:11";
  attribute SOFT_HLUTNM of \bit_idx[2]_i_2\ : label is "soft_lutpair0";
  attribute srl_name : string;
  attribute srl_name of rxd_sync2_reg_srl2 : label is "\U0/inst_uart_rx/rxd_sync2_reg_srl2 ";
begin
  E(0) <= \^e\(0);
  SR(0) <= \^sr\(0);
  error_reg <= \^error_reg\;
\FSM_sequential_state[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3300550F33CC550F"
    )
        port map (
      I0 => \FSM_sequential_state[1]_i_2_n_0\,
      I1 => \FSM_sequential_state[1]_i_3_n_0\,
      I2 => rxd_reg,
      I3 => state(0),
      I4 => state(1),
      I5 => \FSM_sequential_state[0]_i_2__0_n_0\,
      O => \FSM_sequential_state[0]_i_1__0_n_0\
    );
\FSM_sequential_state[0]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \bit_idx_reg_n_0_[1]\,
      I1 => \bit_idx_reg_n_0_[0]\,
      I2 => \bit_idx_reg_n_0_[2]\,
      O => \FSM_sequential_state[0]_i_2__0_n_0\
    );
\FSM_sequential_state[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"33FF0A00"
    )
        port map (
      I0 => \FSM_sequential_state[1]_i_2_n_0\,
      I1 => \FSM_sequential_state[1]_i_3_n_0\,
      I2 => rxd_reg,
      I3 => state(0),
      I4 => state(1),
      O => \FSM_sequential_state[1]_i_1__0_n_0\
    );
\FSM_sequential_state[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => baud_tick_16,
      I1 => \sample_cnt_reg_n_0_[2]\,
      I2 => \sample_cnt_reg_n_0_[1]\,
      I3 => \sample_cnt_reg_n_0_[0]\,
      I4 => \sample_cnt_reg_n_0_[3]\,
      O => \FSM_sequential_state[1]_i_2_n_0\
    );
\FSM_sequential_state[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \sample_cnt_reg_n_0_[0]\,
      I1 => \sample_cnt_reg_n_0_[1]\,
      I2 => \sample_cnt_reg_n_0_[2]\,
      I3 => \sample_cnt_reg_n_0_[3]\,
      I4 => baud_tick_16,
      O => \FSM_sequential_state[1]_i_3_n_0\
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_state[0]_i_1__0_n_0\,
      Q => state(0),
      R => \^sr\(0)
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_state[1]_i_1__0_n_0\,
      Q => state(1),
      R => \^sr\(0)
    );
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_aresetn,
      O => \^sr\(0)
    );
\bit_idx[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88FFF800"
    )
        port map (
      I0 => state(0),
      I1 => rxd_reg,
      I2 => state(1),
      I3 => bit_idx(0),
      I4 => \bit_idx_reg_n_0_[0]\,
      O => \bit_idx[0]_i_1_n_0\
    );
\bit_idx[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88F8FFFFF8880000"
    )
        port map (
      I0 => state(0),
      I1 => rxd_reg,
      I2 => state(1),
      I3 => \bit_idx_reg_n_0_[0]\,
      I4 => bit_idx(0),
      I5 => \bit_idx_reg_n_0_[1]\,
      O => \bit_idx[1]_i_1_n_0\
    );
\bit_idx[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFAAFFFFEAAA0000"
    )
        port map (
      I0 => \bit_idx[2]_i_2_n_0\,
      I1 => \bit_idx_reg_n_0_[1]\,
      I2 => \bit_idx_reg_n_0_[0]\,
      I3 => state(1),
      I4 => bit_idx(0),
      I5 => \bit_idx_reg_n_0_[2]\,
      O => \bit_idx[2]_i_1_n_0\
    );
\bit_idx[2]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => rxd_reg,
      I1 => state(0),
      O => \bit_idx[2]_i_2_n_0\
    );
\bit_idx[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000F0004444FFFF"
    )
        port map (
      I0 => rxd_reg,
      I1 => \FSM_sequential_state[1]_i_2_n_0\,
      I2 => \FSM_sequential_state[1]_i_3_n_0\,
      I3 => \FSM_sequential_state[0]_i_2__0_n_0\,
      I4 => state(0),
      I5 => state(1),
      O => bit_idx(0)
    );
\bit_idx_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \bit_idx[0]_i_1_n_0\,
      Q => \bit_idx_reg_n_0_[0]\,
      R => \^sr\(0)
    );
\bit_idx_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \bit_idx[1]_i_1_n_0\,
      Q => \bit_idx_reg_n_0_[1]\,
      R => \^sr\(0)
    );
\bit_idx_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \bit_idx[2]_i_1_n_0\,
      Q => \bit_idx_reg_n_0_[2]\,
      R => \^sr\(0)
    );
error_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF4000"
    )
        port map (
      I0 => rxd_reg,
      I1 => \FSM_sequential_state[1]_i_3_n_0\,
      I2 => state(1),
      I3 => state(0),
      I4 => \^error_reg\,
      O => error_reg_i_1_n_0
    );
error_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => error_reg_i_1_n_0,
      Q => \^error_reg\,
      R => \^sr\(0)
    );
rx_data_avail_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000CEEEEEEE"
    )
        port map (
      I0 => rx_data_avail,
      I1 => \^e\(0),
      I2 => rx_data_avail_reg_0,
      I3 => s_axi_arvalid,
      I4 => rx_data_avail_reg_1,
      I5 => rx_data_avail_reg_2(0),
      O => rx_data_avail_reg
    );
\rx_data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => valid_reg_i_1_n_0,
      D => rx_shreg(0),
      Q => Q(0),
      R => \^sr\(0)
    );
\rx_data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => valid_reg_i_1_n_0,
      D => rx_shreg(1),
      Q => Q(1),
      R => \^sr\(0)
    );
\rx_data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => valid_reg_i_1_n_0,
      D => rx_shreg(2),
      Q => Q(2),
      R => \^sr\(0)
    );
\rx_data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => valid_reg_i_1_n_0,
      D => rx_shreg(3),
      Q => Q(3),
      R => \^sr\(0)
    );
\rx_data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => valid_reg_i_1_n_0,
      D => rx_shreg(4),
      Q => Q(4),
      R => \^sr\(0)
    );
\rx_data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => valid_reg_i_1_n_0,
      D => rx_shreg(5),
      Q => Q(5),
      R => \^sr\(0)
    );
\rx_data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => valid_reg_i_1_n_0,
      D => rx_shreg(6),
      Q => Q(6),
      R => \^sr\(0)
    );
\rx_data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => valid_reg_i_1_n_0,
      D => rx_shreg(7),
      Q => Q(7),
      R => \^sr\(0)
    );
\rx_shreg[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => baud_tick_16,
      I1 => \sample_cnt_reg_n_0_[3]\,
      I2 => \sample_cnt[3]_i_3_n_0\,
      I3 => state(1),
      I4 => state(0),
      O => rx_shreg_0(0)
    );
\rx_shreg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rx_shreg_0(0),
      D => rx_shreg(1),
      Q => rx_shreg(0),
      R => \^sr\(0)
    );
\rx_shreg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rx_shreg_0(0),
      D => rx_shreg(2),
      Q => rx_shreg(1),
      R => \^sr\(0)
    );
\rx_shreg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rx_shreg_0(0),
      D => rx_shreg(3),
      Q => rx_shreg(2),
      R => \^sr\(0)
    );
\rx_shreg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rx_shreg_0(0),
      D => rx_shreg(4),
      Q => rx_shreg(3),
      R => \^sr\(0)
    );
\rx_shreg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rx_shreg_0(0),
      D => rx_shreg(5),
      Q => rx_shreg(4),
      R => \^sr\(0)
    );
\rx_shreg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rx_shreg_0(0),
      D => rx_shreg(6),
      Q => rx_shreg(5),
      R => \^sr\(0)
    );
\rx_shreg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rx_shreg_0(0),
      D => rx_shreg(7),
      Q => rx_shreg(6),
      R => \^sr\(0)
    );
\rx_shreg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rx_shreg_0(0),
      D => rxd_reg,
      Q => rx_shreg(7),
      R => \^sr\(0)
    );
rxd_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => rxd_sync2_reg_srl2_n_0,
      Q => rxd_reg,
      R => '0'
    );
rxd_sync2_reg_srl2: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0003"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => s_axi_aclk,
      D => raw_rxd,
      Q => rxd_sync2_reg_srl2_n_0
    );
\sample_cnt[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00200000EEEEEEEE"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => rxd_reg,
      I3 => \sample_cnt_reg_n_0_[3]\,
      I4 => \sample_cnt[3]_i_3_n_0\,
      I5 => \sample_cnt_reg_n_0_[0]\,
      O => \sample_cnt[0]_i_1_n_0\
    );
\sample_cnt[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EEEE0EE0"
    )
        port map (
      I0 => state(1),
      I1 => state(0),
      I2 => \sample_cnt_reg_n_0_[0]\,
      I3 => \sample_cnt_reg_n_0_[1]\,
      I4 => \sample_cnt[2]_i_2_n_0\,
      O => \sample_cnt[1]_i_1_n_0\
    );
\sample_cnt[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEEEE0EE0E0E0"
    )
        port map (
      I0 => state(1),
      I1 => state(0),
      I2 => \sample_cnt_reg_n_0_[2]\,
      I3 => \sample_cnt_reg_n_0_[1]\,
      I4 => \sample_cnt_reg_n_0_[0]\,
      I5 => \sample_cnt[2]_i_2_n_0\,
      O => \sample_cnt[2]_i_1_n_0\
    );
\sample_cnt[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0400000000000000"
    )
        port map (
      I0 => state(1),
      I1 => rxd_reg,
      I2 => \sample_cnt_reg_n_0_[3]\,
      I3 => \sample_cnt_reg_n_0_[0]\,
      I4 => \sample_cnt_reg_n_0_[1]\,
      I5 => \sample_cnt_reg_n_0_[2]\,
      O => \sample_cnt[2]_i_2_n_0\
    );
\sample_cnt[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF11111111"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => rxd_reg,
      I3 => \sample_cnt_reg_n_0_[3]\,
      I4 => \sample_cnt[3]_i_3_n_0\,
      I5 => baud_tick_16,
      O => sample_cnt(0)
    );
\sample_cnt[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00EAEE00"
    )
        port map (
      I0 => state(1),
      I1 => state(0),
      I2 => rxd_reg,
      I3 => \sample_cnt_reg_n_0_[3]\,
      I4 => \sample_cnt[3]_i_3_n_0\,
      O => \sample_cnt[3]_i_2_n_0\
    );
\sample_cnt[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \sample_cnt_reg_n_0_[2]\,
      I1 => \sample_cnt_reg_n_0_[1]\,
      I2 => \sample_cnt_reg_n_0_[0]\,
      O => \sample_cnt[3]_i_3_n_0\
    );
\sample_cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_cnt(0),
      D => \sample_cnt[0]_i_1_n_0\,
      Q => \sample_cnt_reg_n_0_[0]\,
      R => \^sr\(0)
    );
\sample_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_cnt(0),
      D => \sample_cnt[1]_i_1_n_0\,
      Q => \sample_cnt_reg_n_0_[1]\,
      R => \^sr\(0)
    );
\sample_cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_cnt(0),
      D => \sample_cnt[2]_i_1_n_0\,
      Q => \sample_cnt_reg_n_0_[2]\,
      R => \^sr\(0)
    );
\sample_cnt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => sample_cnt(0),
      D => \sample_cnt[3]_i_2_n_0\,
      Q => \sample_cnt_reg_n_0_[3]\,
      R => \^sr\(0)
    );
valid_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => \sample_cnt[3]_i_3_n_0\,
      I3 => \sample_cnt_reg_n_0_[3]\,
      I4 => baud_tick_16,
      I5 => rxd_reg,
      O => valid_reg_i_1_n_0
    );
valid_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => valid_reg_i_1_n_0,
      Q => \^e\(0),
      R => \^sr\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_uart_0_0_uart_tx is
  port (
    uart_txd : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aresetn_0 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    raw_rxd : out STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC;
    tx_start : in STD_LOGIC;
    \FSM_sequential_state_reg[0]_0\ : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    \tx_data_reg[0]\ : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    axi_awready0 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \axi_rdata_reg[3]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \axi_rdata_reg[3]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    uart_rxd : in STD_LOGIC;
    \shreg_reg[7]_0\ : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_uart_0_0_uart_tx : entity is "uart_tx";
end system_axi_uart_0_0_uart_tx;

architecture STRUCTURE of system_axi_uart_0_0_uart_tx is
  signal \FSM_sequential_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \bit_idx[0]_i_1_n_0\ : STD_LOGIC;
  signal \bit_idx[1]_i_1_n_0\ : STD_LOGIC;
  signal \bit_idx[2]_i_1_n_0\ : STD_LOGIC;
  signal \bit_idx_reg_n_0_[0]\ : STD_LOGIC;
  signal \bit_idx_reg_n_0_[1]\ : STD_LOGIC;
  signal \bit_idx_reg_n_0_[2]\ : STD_LOGIC;
  signal busy_reg : STD_LOGIC;
  signal busy_reg_0 : STD_LOGIC;
  signal shreg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \shreg[7]_i_1_n_0\ : STD_LOGIC;
  signal \shreg_reg_n_0_[0]\ : STD_LOGIC;
  signal \shreg_reg_n_0_[1]\ : STD_LOGIC;
  signal \shreg_reg_n_0_[2]\ : STD_LOGIC;
  signal \shreg_reg_n_0_[3]\ : STD_LOGIC;
  signal \shreg_reg_n_0_[4]\ : STD_LOGIC;
  signal \shreg_reg_n_0_[5]\ : STD_LOGIC;
  signal \shreg_reg_n_0_[6]\ : STD_LOGIC;
  signal \shreg_reg_n_0_[7]\ : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal txd_reg_i_1_n_0 : STD_LOGIC;
  signal \^uart_txd\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_1\ : label is "soft_lutpair2";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "idle:00,start_bit:01,data_bits:10,stop_bit:11";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "idle:00,start_bit:01,data_bits:10,stop_bit:11";
  attribute SOFT_HLUTNM of busy_reg_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \shreg[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \shreg[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \shreg[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \shreg[3]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \shreg[4]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \shreg[5]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \shreg[6]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \shreg[7]_i_2\ : label is "soft_lutpair6";
begin
  uart_txd <= \^uart_txd\;
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F0FB380"
    )
        port map (
      I0 => \FSM_sequential_state[0]_i_2_n_0\,
      I1 => state(1),
      I2 => \FSM_sequential_state_reg[0]_0\,
      I3 => tx_start,
      I4 => state(0),
      O => \FSM_sequential_state[0]_i_1_n_0\
    );
\FSM_sequential_state[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \bit_idx_reg_n_0_[1]\,
      I1 => \bit_idx_reg_n_0_[2]\,
      I2 => \bit_idx_reg_n_0_[0]\,
      O => \FSM_sequential_state[0]_i_2_n_0\
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6C"
    )
        port map (
      I0 => \FSM_sequential_state_reg[0]_0\,
      I1 => state(1),
      I2 => state(0),
      O => \FSM_sequential_state[1]_i_1_n_0\
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_state[0]_i_1_n_0\,
      Q => state(0),
      R => SR(0)
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_state[1]_i_1_n_0\,
      Q => state(1),
      R => SR(0)
    );
\axi_rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => Q(0),
      I1 => \axi_rdata_reg[3]\(0),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(0),
      I4 => \axi_rdata_reg[3]_0\(0),
      I5 => busy_reg,
      O => D(0)
    );
\axi_rdata[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C0AFC0A0CFAFCFA0"
    )
        port map (
      I0 => Q(2),
      I1 => \axi_rdata_reg[3]\(1),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(0),
      I4 => \axi_rdata_reg[3]_0\(1),
      I5 => busy_reg,
      O => D(1)
    );
\bit_idx[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888CCCCA2228888"
    )
        port map (
      I0 => state(1),
      I1 => \bit_idx_reg_n_0_[0]\,
      I2 => \bit_idx_reg_n_0_[2]\,
      I3 => \bit_idx_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[0]_0\,
      I5 => state(0),
      O => \bit_idx[0]_i_1_n_0\
    );
\bit_idx[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA00FF00A288AA00"
    )
        port map (
      I0 => state(1),
      I1 => \bit_idx_reg_n_0_[0]\,
      I2 => \bit_idx_reg_n_0_[2]\,
      I3 => \bit_idx_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[0]_0\,
      I5 => state(0),
      O => \bit_idx[1]_i_1_n_0\
    );
\bit_idx[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0A0F0F0A8A0A0A0"
    )
        port map (
      I0 => state(1),
      I1 => \bit_idx_reg_n_0_[0]\,
      I2 => \bit_idx_reg_n_0_[2]\,
      I3 => \bit_idx_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[0]_0\,
      I5 => state(0),
      O => \bit_idx[2]_i_1_n_0\
    );
\bit_idx_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \bit_idx[0]_i_1_n_0\,
      Q => \bit_idx_reg_n_0_[0]\,
      R => SR(0)
    );
\bit_idx_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \bit_idx[1]_i_1_n_0\,
      Q => \bit_idx_reg_n_0_[1]\,
      R => SR(0)
    );
\bit_idx_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \bit_idx[2]_i_1_n_0\,
      Q => \bit_idx_reg_n_0_[2]\,
      R => SR(0)
    );
busy_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5EFE"
    )
        port map (
      I0 => state(0),
      I1 => tx_start,
      I2 => state(1),
      I3 => \FSM_sequential_state_reg[0]_0\,
      O => busy_reg_0
    );
busy_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => busy_reg_0,
      Q => busy_reg,
      R => SR(0)
    );
rxd_sync2_reg_srl2_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^uart_txd\,
      I1 => Q(1),
      I2 => uart_rxd,
      O => raw_rxd
    );
\shreg[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shreg_reg_n_0_[1]\,
      I1 => state(1),
      I2 => \shreg_reg[7]_0\(0),
      O => shreg(0)
    );
\shreg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shreg_reg_n_0_[2]\,
      I1 => state(1),
      I2 => \shreg_reg[7]_0\(1),
      O => shreg(1)
    );
\shreg[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shreg_reg_n_0_[3]\,
      I1 => state(1),
      I2 => \shreg_reg[7]_0\(2),
      O => shreg(2)
    );
\shreg[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shreg_reg_n_0_[4]\,
      I1 => state(1),
      I2 => \shreg_reg[7]_0\(3),
      O => shreg(3)
    );
\shreg[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shreg_reg_n_0_[5]\,
      I1 => state(1),
      I2 => \shreg_reg[7]_0\(4),
      O => shreg(4)
    );
\shreg[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shreg_reg_n_0_[6]\,
      I1 => state(1),
      I2 => \shreg_reg[7]_0\(5),
      O => shreg(5)
    );
\shreg[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shreg_reg_n_0_[7]\,
      I1 => state(1),
      I2 => \shreg_reg[7]_0\(6),
      O => shreg(6)
    );
\shreg[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => tx_start,
      I1 => state(1),
      I2 => \FSM_sequential_state_reg[0]_0\,
      I3 => state(0),
      O => \shreg[7]_i_1_n_0\
    );
\shreg[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \shreg_reg[7]_0\(7),
      I1 => state(1),
      O => shreg(7)
    );
\shreg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \shreg[7]_i_1_n_0\,
      D => shreg(0),
      Q => \shreg_reg_n_0_[0]\,
      R => SR(0)
    );
\shreg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \shreg[7]_i_1_n_0\,
      D => shreg(1),
      Q => \shreg_reg_n_0_[1]\,
      R => SR(0)
    );
\shreg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \shreg[7]_i_1_n_0\,
      D => shreg(2),
      Q => \shreg_reg_n_0_[2]\,
      R => SR(0)
    );
\shreg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \shreg[7]_i_1_n_0\,
      D => shreg(3),
      Q => \shreg_reg_n_0_[3]\,
      R => SR(0)
    );
\shreg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \shreg[7]_i_1_n_0\,
      D => shreg(4),
      Q => \shreg_reg_n_0_[4]\,
      R => SR(0)
    );
\shreg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \shreg[7]_i_1_n_0\,
      D => shreg(5),
      Q => \shreg_reg_n_0_[5]\,
      R => SR(0)
    );
\shreg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \shreg[7]_i_1_n_0\,
      D => shreg(6),
      Q => \shreg_reg_n_0_[6]\,
      R => SR(0)
    );
\shreg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \shreg[7]_i_1_n_0\,
      D => shreg(7),
      Q => \shreg_reg_n_0_[7]\,
      R => SR(0)
    );
\tx_data[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000000"
    )
        port map (
      I0 => s_axi_awaddr(0),
      I1 => s_axi_awaddr(1),
      I2 => busy_reg,
      I3 => s_axi_awvalid,
      I4 => \tx_data_reg[0]\,
      I5 => s_axi_wvalid,
      O => E(0)
    );
tx_start_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => busy_reg,
      I2 => s_axi_awaddr(0),
      I3 => s_axi_awaddr(1),
      I4 => axi_awready0,
      O => s_axi_aresetn_0
    );
txd_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F3BFC08F"
    )
        port map (
      I0 => \shreg_reg_n_0_[0]\,
      I1 => \FSM_sequential_state_reg[0]_0\,
      I2 => state(1),
      I3 => state(0),
      I4 => \^uart_txd\,
      O => txd_reg_i_1_n_0
    );
txd_reg_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => txd_reg_i_1_n_0,
      Q => \^uart_txd\,
      S => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_uart_0_0_axi_uart is
  port (
    s_axi_awready : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    uart_txd : out STD_LOGIC;
    s_axi_bvalid : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_aresetn : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    uart_rxd : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_uart_0_0_axi_uart : entity is "axi_uart";
end system_axi_uart_0_0_axi_uart;

architecture STRUCTURE of system_axi_uart_0_0_axi_uart is
  signal aw_en_i_1_n_0 : STD_LOGIC;
  signal aw_en_reg_n_0 : STD_LOGIC;
  signal axi_arready0 : STD_LOGIC;
  signal axi_awready0 : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal baud_cnt160 : STD_LOGIC;
  signal \baud_cnt160_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \baud_cnt160_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \baud_cnt160_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \baud_cnt160_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \baud_cnt160_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \baud_cnt160_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \baud_cnt160_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \baud_cnt160_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \baud_cnt160_carry__0_n_1\ : STD_LOGIC;
  signal \baud_cnt160_carry__0_n_2\ : STD_LOGIC;
  signal \baud_cnt160_carry__0_n_3\ : STD_LOGIC;
  signal baud_cnt160_carry_i_1_n_0 : STD_LOGIC;
  signal baud_cnt160_carry_i_2_n_0 : STD_LOGIC;
  signal baud_cnt160_carry_i_3_n_0 : STD_LOGIC;
  signal baud_cnt160_carry_i_4_n_0 : STD_LOGIC;
  signal baud_cnt160_carry_i_5_n_0 : STD_LOGIC;
  signal baud_cnt160_carry_i_6_n_0 : STD_LOGIC;
  signal baud_cnt160_carry_i_7_n_0 : STD_LOGIC;
  signal baud_cnt160_carry_i_8_n_0 : STD_LOGIC;
  signal baud_cnt160_carry_n_0 : STD_LOGIC;
  signal baud_cnt160_carry_n_1 : STD_LOGIC;
  signal baud_cnt160_carry_n_2 : STD_LOGIC;
  signal baud_cnt160_carry_n_3 : STD_LOGIC;
  signal \baud_cnt16[0]_i_1_n_0\ : STD_LOGIC;
  signal \baud_cnt16[0]_i_3_n_0\ : STD_LOGIC;
  signal baud_cnt16_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \baud_cnt16_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \baud_cnt16_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \baud_cnt16_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \baud_cnt16_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \baud_cnt16_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \baud_cnt16_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \baud_cnt16_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \baud_cnt16_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \baud_cnt16_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \baud_cnt16_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \baud_cnt16_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \baud_cnt16_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \baud_cnt16_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \baud_cnt16_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \baud_cnt16_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \baud_cnt16_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \baud_cnt16_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \baud_cnt16_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \baud_cnt16_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \baud_cnt16_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \baud_cnt16_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \baud_cnt16_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \baud_cnt16_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \baud_cnt16_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \baud_cnt16_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \baud_cnt16_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \baud_cnt16_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \baud_cnt16_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \baud_cnt16_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \baud_cnt16_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \baud_cnt16_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal baud_tick_16 : STD_LOGIC;
  signal baud_tick_1x0_out : STD_LOGIC;
  signal baud_tick_1x_reg_n_0 : STD_LOGIC;
  signal error_reg : STD_LOGIC;
  signal inst_uart_rx_n_1 : STD_LOGIC;
  signal inst_uart_rx_n_3 : STD_LOGIC;
  signal inst_uart_tx_n_2 : STD_LOGIC;
  signal minusOp : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal \minusOp_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_n_1\ : STD_LOGIC;
  signal \minusOp_carry__0_n_2\ : STD_LOGIC;
  signal \minusOp_carry__0_n_3\ : STD_LOGIC;
  signal \minusOp_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_n_1\ : STD_LOGIC;
  signal \minusOp_carry__1_n_2\ : STD_LOGIC;
  signal \minusOp_carry__1_n_3\ : STD_LOGIC;
  signal \minusOp_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \minusOp_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \minusOp_carry__2_n_2\ : STD_LOGIC;
  signal \minusOp_carry__2_n_3\ : STD_LOGIC;
  signal minusOp_carry_i_1_n_0 : STD_LOGIC;
  signal minusOp_carry_i_2_n_0 : STD_LOGIC;
  signal minusOp_carry_i_3_n_0 : STD_LOGIC;
  signal minusOp_carry_i_4_n_0 : STD_LOGIC;
  signal minusOp_carry_n_0 : STD_LOGIC;
  signal minusOp_carry_n_1 : STD_LOGIC;
  signal minusOp_carry_n_2 : STD_LOGIC;
  signal minusOp_carry_n_3 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal raw_rxd : STD_LOGIC;
  signal reg_baud_div : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \reg_baud_div[15]_i_2_n_0\ : STD_LOGIC;
  signal \reg_baud_div[15]_i_3_n_0\ : STD_LOGIC;
  signal \reg_baud_div[15]_i_4_n_0\ : STD_LOGIC;
  signal \reg_baud_div[15]_i_5_n_0\ : STD_LOGIC;
  signal reg_baud_div_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal reg_ctrl : STD_LOGIC_VECTOR ( 31 downto 2 );
  signal reg_ctrl_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \reg_ctrl_reg_n_0_[0]\ : STD_LOGIC;
  signal rx_data : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rx_data_avail : STD_LOGIC;
  signal rx_data_avail_i_2_n_0 : STD_LOGIC;
  signal rx_data_latched : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rx_error_reg : STD_LOGIC;
  signal rx_error_reg_i_1_n_0 : STD_LOGIC;
  signal rx_valid_pulse : STD_LOGIC;
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_bvalid\ : STD_LOGIC;
  signal \^s_axi_rvalid\ : STD_LOGIC;
  signal tx_data : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal tx_data_2 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \tx_div_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \tx_div_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \tx_div_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \tx_div_cnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \tx_div_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \tx_div_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \tx_div_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \tx_div_cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal tx_start : STD_LOGIC;
  signal NLW_baud_cnt160_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_baud_cnt160_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_baud_cnt16_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_minusOp_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_minusOp_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axi_rdata[10]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \axi_rdata[11]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \axi_rdata[12]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \axi_rdata[13]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \axi_rdata[14]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \axi_rdata[15]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \axi_rdata[16]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \axi_rdata[17]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \axi_rdata[18]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \axi_rdata[19]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \axi_rdata[20]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \axi_rdata[21]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \axi_rdata[22]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \axi_rdata[23]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \axi_rdata[24]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \axi_rdata[25]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \axi_rdata[26]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \axi_rdata[27]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \axi_rdata[28]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \axi_rdata[29]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \axi_rdata[30]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \axi_rdata[31]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \axi_rdata[4]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \axi_rdata[8]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \axi_rdata[9]_i_1\ : label is "soft_lutpair10";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of baud_cnt160_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \baud_cnt160_carry__0\ : label is 11;
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \baud_cnt16_reg[0]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \baud_cnt16_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \baud_cnt16_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \baud_cnt16_reg[8]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of minusOp_carry : label is 35;
  attribute ADDER_THRESHOLD of \minusOp_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \minusOp_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \minusOp_carry__2\ : label is 35;
  attribute SOFT_HLUTNM of rx_data_avail_i_2 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \tx_div_cnt[0]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \tx_div_cnt[1]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \tx_div_cnt[2]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \tx_div_cnt[3]_i_1\ : label is "soft_lutpair8";
begin
  s_axi_arready <= \^s_axi_arready\;
  s_axi_awready <= \^s_axi_awready\;
  s_axi_bvalid <= \^s_axi_bvalid\;
  s_axi_rvalid <= \^s_axi_rvalid\;
aw_en_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D5FFD5D5"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => s_axi_bready,
      I2 => \^s_axi_bvalid\,
      I3 => axi_awready0,
      I4 => aw_en_reg_n_0,
      O => aw_en_i_1_n_0
    );
aw_en_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => aw_en_i_1_n_0,
      Q => aw_en_reg_n_0,
      R => '0'
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => \^s_axi_arready\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => axi_arready0,
      Q => \^s_axi_arready\,
      R => inst_uart_rx_n_1
    );
axi_awready_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => s_axi_wvalid,
      I1 => aw_en_reg_n_0,
      I2 => s_axi_awvalid,
      O => axi_awready0
    );
axi_awready_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => axi_awready0,
      Q => \^s_axi_awready\,
      R => inst_uart_rx_n_1
    );
axi_bvalid_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => s_axi_bready,
      I1 => \^s_axi_bvalid\,
      I2 => \^s_axi_awready\,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s_axi_bvalid\,
      R => inst_uart_rx_n_1
    );
\axi_rdata[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A0C0"
    )
        port map (
      I0 => reg_baud_div(10),
      I1 => reg_ctrl(10),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(0),
      O => p_1_in(10)
    );
\axi_rdata[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A0C0"
    )
        port map (
      I0 => reg_baud_div(11),
      I1 => reg_ctrl(11),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(0),
      O => p_1_in(11)
    );
\axi_rdata[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A0C0"
    )
        port map (
      I0 => reg_baud_div(12),
      I1 => reg_ctrl(12),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(0),
      O => p_1_in(12)
    );
\axi_rdata[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A0C0"
    )
        port map (
      I0 => reg_baud_div(13),
      I1 => reg_ctrl(13),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(0),
      O => p_1_in(13)
    );
\axi_rdata[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A0C0"
    )
        port map (
      I0 => reg_baud_div(14),
      I1 => reg_ctrl(14),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(0),
      O => p_1_in(14)
    );
\axi_rdata[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A0C0"
    )
        port map (
      I0 => reg_baud_div(15),
      I1 => reg_ctrl(15),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(0),
      O => p_1_in(15)
    );
\axi_rdata[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => reg_ctrl(16),
      O => p_1_in(16)
    );
\axi_rdata[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => reg_ctrl(17),
      O => p_1_in(17)
    );
\axi_rdata[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => reg_ctrl(18),
      O => p_1_in(18)
    );
\axi_rdata[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => reg_ctrl(19),
      O => p_1_in(19)
    );
\axi_rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => p_0_in,
      I1 => reg_baud_div(1),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(0),
      I4 => rx_data_latched(1),
      I5 => rx_data_avail,
      O => p_1_in(1)
    );
\axi_rdata[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => reg_ctrl(20),
      O => p_1_in(20)
    );
\axi_rdata[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => reg_ctrl(21),
      O => p_1_in(21)
    );
\axi_rdata[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => reg_ctrl(22),
      O => p_1_in(22)
    );
\axi_rdata[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => reg_ctrl(23),
      O => p_1_in(23)
    );
\axi_rdata[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => reg_ctrl(24),
      O => p_1_in(24)
    );
\axi_rdata[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => reg_ctrl(25),
      O => p_1_in(25)
    );
\axi_rdata[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => reg_ctrl(26),
      O => p_1_in(26)
    );
\axi_rdata[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => reg_ctrl(27),
      O => p_1_in(27)
    );
\axi_rdata[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => reg_ctrl(28),
      O => p_1_in(28)
    );
\axi_rdata[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => reg_ctrl(29),
      O => p_1_in(29)
    );
\axi_rdata[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => reg_ctrl(2),
      I1 => reg_baud_div(2),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(0),
      I4 => rx_data_latched(2),
      I5 => rx_error_reg,
      O => p_1_in(2)
    );
\axi_rdata[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => reg_ctrl(30),
      O => p_1_in(30)
    );
\axi_rdata[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => reg_ctrl(31),
      O => p_1_in(31)
    );
\axi_rdata[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => rx_data_latched(4),
      I1 => reg_ctrl(4),
      I2 => reg_baud_div(4),
      I3 => s_axi_araddr(0),
      I4 => s_axi_araddr(1),
      O => p_1_in(4)
    );
\axi_rdata[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => rx_data_latched(5),
      I1 => reg_ctrl(5),
      I2 => reg_baud_div(5),
      I3 => s_axi_araddr(0),
      I4 => s_axi_araddr(1),
      O => p_1_in(5)
    );
\axi_rdata[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => rx_data_latched(6),
      I1 => reg_ctrl(6),
      I2 => reg_baud_div(6),
      I3 => s_axi_araddr(0),
      I4 => s_axi_araddr(1),
      O => p_1_in(6)
    );
\axi_rdata[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => rx_data_latched(7),
      I1 => reg_ctrl(7),
      I2 => reg_baud_div(7),
      I3 => s_axi_araddr(0),
      I4 => s_axi_araddr(1),
      O => p_1_in(7)
    );
\axi_rdata[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A0C0"
    )
        port map (
      I0 => reg_baud_div(8),
      I1 => reg_ctrl(8),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(0),
      O => p_1_in(8)
    );
\axi_rdata[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A0C0"
    )
        port map (
      I0 => reg_baud_div(9),
      I1 => reg_ctrl(9),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(0),
      O => p_1_in(9)
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(0),
      Q => s_axi_rdata(0),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(10),
      Q => s_axi_rdata(10),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(11),
      Q => s_axi_rdata(11),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(12),
      Q => s_axi_rdata(12),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(13),
      Q => s_axi_rdata(13),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(14),
      Q => s_axi_rdata(14),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(15),
      Q => s_axi_rdata(15),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(16),
      Q => s_axi_rdata(16),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(17),
      Q => s_axi_rdata(17),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(18),
      Q => s_axi_rdata(18),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(19),
      Q => s_axi_rdata(19),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(1),
      Q => s_axi_rdata(1),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(20),
      Q => s_axi_rdata(20),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(21),
      Q => s_axi_rdata(21),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(22),
      Q => s_axi_rdata(22),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(23),
      Q => s_axi_rdata(23),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(24),
      Q => s_axi_rdata(24),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(25),
      Q => s_axi_rdata(25),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(26),
      Q => s_axi_rdata(26),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(27),
      Q => s_axi_rdata(27),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(28),
      Q => s_axi_rdata(28),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(29),
      Q => s_axi_rdata(29),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(2),
      Q => s_axi_rdata(2),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(30),
      Q => s_axi_rdata(30),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(31),
      Q => s_axi_rdata(31),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(3),
      Q => s_axi_rdata(3),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(4),
      Q => s_axi_rdata(4),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(5),
      Q => s_axi_rdata(5),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(6),
      Q => s_axi_rdata(6),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(7),
      Q => s_axi_rdata(7),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(8),
      Q => s_axi_rdata(8),
      R => inst_uart_rx_n_1
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => axi_arready0,
      D => p_1_in(9),
      Q => s_axi_rdata(9),
      R => inst_uart_rx_n_1
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7444"
    )
        port map (
      I0 => s_axi_rready,
      I1 => \^s_axi_rvalid\,
      I2 => s_axi_arvalid,
      I3 => \^s_axi_arready\,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^s_axi_rvalid\,
      R => inst_uart_rx_n_1
    );
baud_cnt160_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => baud_cnt160_carry_n_0,
      CO(2) => baud_cnt160_carry_n_1,
      CO(1) => baud_cnt160_carry_n_2,
      CO(0) => baud_cnt160_carry_n_3,
      CYINIT => '1',
      DI(3) => baud_cnt160_carry_i_1_n_0,
      DI(2) => baud_cnt160_carry_i_2_n_0,
      DI(1) => baud_cnt160_carry_i_3_n_0,
      DI(0) => baud_cnt160_carry_i_4_n_0,
      O(3 downto 0) => NLW_baud_cnt160_carry_O_UNCONNECTED(3 downto 0),
      S(3) => baud_cnt160_carry_i_5_n_0,
      S(2) => baud_cnt160_carry_i_6_n_0,
      S(1) => baud_cnt160_carry_i_7_n_0,
      S(0) => baud_cnt160_carry_i_8_n_0
    );
\baud_cnt160_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => baud_cnt160_carry_n_0,
      CO(3) => baud_cnt160,
      CO(2) => \baud_cnt160_carry__0_n_1\,
      CO(1) => \baud_cnt160_carry__0_n_2\,
      CO(0) => \baud_cnt160_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \baud_cnt160_carry__0_i_1_n_0\,
      DI(2) => \baud_cnt160_carry__0_i_2_n_0\,
      DI(1) => \baud_cnt160_carry__0_i_3_n_0\,
      DI(0) => \baud_cnt160_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_baud_cnt160_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \baud_cnt160_carry__0_i_5_n_0\,
      S(2) => \baud_cnt160_carry__0_i_6_n_0\,
      S(1) => \baud_cnt160_carry__0_i_7_n_0\,
      S(0) => \baud_cnt160_carry__0_i_8_n_0\
    );
\baud_cnt160_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => baud_cnt16_reg(14),
      I1 => minusOp(14),
      I2 => minusOp(15),
      I3 => baud_cnt16_reg(15),
      O => \baud_cnt160_carry__0_i_1_n_0\
    );
\baud_cnt160_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => baud_cnt16_reg(12),
      I1 => minusOp(12),
      I2 => minusOp(13),
      I3 => baud_cnt16_reg(13),
      O => \baud_cnt160_carry__0_i_2_n_0\
    );
\baud_cnt160_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => baud_cnt16_reg(10),
      I1 => minusOp(10),
      I2 => minusOp(11),
      I3 => baud_cnt16_reg(11),
      O => \baud_cnt160_carry__0_i_3_n_0\
    );
\baud_cnt160_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => baud_cnt16_reg(8),
      I1 => minusOp(8),
      I2 => minusOp(9),
      I3 => baud_cnt16_reg(9),
      O => \baud_cnt160_carry__0_i_4_n_0\
    );
\baud_cnt160_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(15),
      I1 => baud_cnt16_reg(15),
      I2 => minusOp(14),
      I3 => baud_cnt16_reg(14),
      O => \baud_cnt160_carry__0_i_5_n_0\
    );
\baud_cnt160_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(13),
      I1 => baud_cnt16_reg(13),
      I2 => minusOp(12),
      I3 => baud_cnt16_reg(12),
      O => \baud_cnt160_carry__0_i_6_n_0\
    );
\baud_cnt160_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(11),
      I1 => baud_cnt16_reg(11),
      I2 => minusOp(10),
      I3 => baud_cnt16_reg(10),
      O => \baud_cnt160_carry__0_i_7_n_0\
    );
\baud_cnt160_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(9),
      I1 => baud_cnt16_reg(9),
      I2 => minusOp(8),
      I3 => baud_cnt16_reg(8),
      O => \baud_cnt160_carry__0_i_8_n_0\
    );
baud_cnt160_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => baud_cnt16_reg(6),
      I1 => minusOp(6),
      I2 => minusOp(7),
      I3 => baud_cnt16_reg(7),
      O => baud_cnt160_carry_i_1_n_0
    );
baud_cnt160_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => baud_cnt16_reg(4),
      I1 => minusOp(4),
      I2 => minusOp(5),
      I3 => baud_cnt16_reg(5),
      O => baud_cnt160_carry_i_2_n_0
    );
baud_cnt160_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => baud_cnt16_reg(2),
      I1 => minusOp(2),
      I2 => minusOp(3),
      I3 => baud_cnt16_reg(3),
      O => baud_cnt160_carry_i_3_n_0
    );
baud_cnt160_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F08"
    )
        port map (
      I0 => baud_cnt16_reg(0),
      I1 => reg_baud_div(0),
      I2 => minusOp(1),
      I3 => baud_cnt16_reg(1),
      O => baud_cnt160_carry_i_4_n_0
    );
baud_cnt160_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(7),
      I1 => baud_cnt16_reg(7),
      I2 => minusOp(6),
      I3 => baud_cnt16_reg(6),
      O => baud_cnt160_carry_i_5_n_0
    );
baud_cnt160_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(5),
      I1 => baud_cnt16_reg(5),
      I2 => minusOp(4),
      I3 => baud_cnt16_reg(4),
      O => baud_cnt160_carry_i_6_n_0
    );
baud_cnt160_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(3),
      I1 => baud_cnt16_reg(3),
      I2 => minusOp(2),
      I3 => baud_cnt16_reg(2),
      O => baud_cnt160_carry_i_7_n_0
    );
baud_cnt160_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0990"
    )
        port map (
      I0 => minusOp(1),
      I1 => baud_cnt16_reg(1),
      I2 => baud_cnt16_reg(0),
      I3 => reg_baud_div(0),
      O => baud_cnt160_carry_i_8_n_0
    );
\baud_cnt16[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => baud_cnt160,
      I1 => s_axi_aresetn,
      O => \baud_cnt16[0]_i_1_n_0\
    );
\baud_cnt16[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => baud_cnt16_reg(0),
      O => \baud_cnt16[0]_i_3_n_0\
    );
\baud_cnt16_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \baud_cnt16_reg[0]_i_2_n_7\,
      Q => baud_cnt16_reg(0),
      R => \baud_cnt16[0]_i_1_n_0\
    );
\baud_cnt16_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \baud_cnt16_reg[0]_i_2_n_0\,
      CO(2) => \baud_cnt16_reg[0]_i_2_n_1\,
      CO(1) => \baud_cnt16_reg[0]_i_2_n_2\,
      CO(0) => \baud_cnt16_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \baud_cnt16_reg[0]_i_2_n_4\,
      O(2) => \baud_cnt16_reg[0]_i_2_n_5\,
      O(1) => \baud_cnt16_reg[0]_i_2_n_6\,
      O(0) => \baud_cnt16_reg[0]_i_2_n_7\,
      S(3 downto 1) => baud_cnt16_reg(3 downto 1),
      S(0) => \baud_cnt16[0]_i_3_n_0\
    );
\baud_cnt16_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \baud_cnt16_reg[8]_i_1_n_5\,
      Q => baud_cnt16_reg(10),
      R => \baud_cnt16[0]_i_1_n_0\
    );
\baud_cnt16_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \baud_cnt16_reg[8]_i_1_n_4\,
      Q => baud_cnt16_reg(11),
      R => \baud_cnt16[0]_i_1_n_0\
    );
\baud_cnt16_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \baud_cnt16_reg[12]_i_1_n_7\,
      Q => baud_cnt16_reg(12),
      R => \baud_cnt16[0]_i_1_n_0\
    );
\baud_cnt16_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \baud_cnt16_reg[8]_i_1_n_0\,
      CO(3) => \NLW_baud_cnt16_reg[12]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \baud_cnt16_reg[12]_i_1_n_1\,
      CO(1) => \baud_cnt16_reg[12]_i_1_n_2\,
      CO(0) => \baud_cnt16_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \baud_cnt16_reg[12]_i_1_n_4\,
      O(2) => \baud_cnt16_reg[12]_i_1_n_5\,
      O(1) => \baud_cnt16_reg[12]_i_1_n_6\,
      O(0) => \baud_cnt16_reg[12]_i_1_n_7\,
      S(3 downto 0) => baud_cnt16_reg(15 downto 12)
    );
\baud_cnt16_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \baud_cnt16_reg[12]_i_1_n_6\,
      Q => baud_cnt16_reg(13),
      R => \baud_cnt16[0]_i_1_n_0\
    );
\baud_cnt16_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \baud_cnt16_reg[12]_i_1_n_5\,
      Q => baud_cnt16_reg(14),
      R => \baud_cnt16[0]_i_1_n_0\
    );
\baud_cnt16_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \baud_cnt16_reg[12]_i_1_n_4\,
      Q => baud_cnt16_reg(15),
      R => \baud_cnt16[0]_i_1_n_0\
    );
\baud_cnt16_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \baud_cnt16_reg[0]_i_2_n_6\,
      Q => baud_cnt16_reg(1),
      R => \baud_cnt16[0]_i_1_n_0\
    );
\baud_cnt16_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \baud_cnt16_reg[0]_i_2_n_5\,
      Q => baud_cnt16_reg(2),
      R => \baud_cnt16[0]_i_1_n_0\
    );
\baud_cnt16_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \baud_cnt16_reg[0]_i_2_n_4\,
      Q => baud_cnt16_reg(3),
      R => \baud_cnt16[0]_i_1_n_0\
    );
\baud_cnt16_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \baud_cnt16_reg[4]_i_1_n_7\,
      Q => baud_cnt16_reg(4),
      R => \baud_cnt16[0]_i_1_n_0\
    );
\baud_cnt16_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \baud_cnt16_reg[0]_i_2_n_0\,
      CO(3) => \baud_cnt16_reg[4]_i_1_n_0\,
      CO(2) => \baud_cnt16_reg[4]_i_1_n_1\,
      CO(1) => \baud_cnt16_reg[4]_i_1_n_2\,
      CO(0) => \baud_cnt16_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \baud_cnt16_reg[4]_i_1_n_4\,
      O(2) => \baud_cnt16_reg[4]_i_1_n_5\,
      O(1) => \baud_cnt16_reg[4]_i_1_n_6\,
      O(0) => \baud_cnt16_reg[4]_i_1_n_7\,
      S(3 downto 0) => baud_cnt16_reg(7 downto 4)
    );
\baud_cnt16_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \baud_cnt16_reg[4]_i_1_n_6\,
      Q => baud_cnt16_reg(5),
      R => \baud_cnt16[0]_i_1_n_0\
    );
\baud_cnt16_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \baud_cnt16_reg[4]_i_1_n_5\,
      Q => baud_cnt16_reg(6),
      R => \baud_cnt16[0]_i_1_n_0\
    );
\baud_cnt16_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \baud_cnt16_reg[4]_i_1_n_4\,
      Q => baud_cnt16_reg(7),
      R => \baud_cnt16[0]_i_1_n_0\
    );
\baud_cnt16_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \baud_cnt16_reg[8]_i_1_n_7\,
      Q => baud_cnt16_reg(8),
      R => \baud_cnt16[0]_i_1_n_0\
    );
\baud_cnt16_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \baud_cnt16_reg[4]_i_1_n_0\,
      CO(3) => \baud_cnt16_reg[8]_i_1_n_0\,
      CO(2) => \baud_cnt16_reg[8]_i_1_n_1\,
      CO(1) => \baud_cnt16_reg[8]_i_1_n_2\,
      CO(0) => \baud_cnt16_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \baud_cnt16_reg[8]_i_1_n_4\,
      O(2) => \baud_cnt16_reg[8]_i_1_n_5\,
      O(1) => \baud_cnt16_reg[8]_i_1_n_6\,
      O(0) => \baud_cnt16_reg[8]_i_1_n_7\,
      S(3 downto 0) => baud_cnt16_reg(11 downto 8)
    );
\baud_cnt16_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \baud_cnt16_reg[8]_i_1_n_6\,
      Q => baud_cnt16_reg(9),
      R => \baud_cnt16[0]_i_1_n_0\
    );
baud_tick_16_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => baud_cnt160,
      Q => baud_tick_16,
      R => inst_uart_rx_n_1
    );
baud_tick_1x_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \tx_div_cnt_reg_n_0_[2]\,
      I1 => \tx_div_cnt_reg_n_0_[3]\,
      I2 => baud_cnt160,
      I3 => \tx_div_cnt_reg_n_0_[1]\,
      I4 => \tx_div_cnt_reg_n_0_[0]\,
      O => baud_tick_1x0_out
    );
baud_tick_1x_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => baud_tick_1x0_out,
      Q => baud_tick_1x_reg_n_0,
      R => inst_uart_rx_n_1
    );
inst_uart_rx: entity work.system_axi_uart_0_0_uart_rx
     port map (
      E(0) => rx_valid_pulse,
      Q(7 downto 0) => rx_data(7 downto 0),
      SR(0) => inst_uart_rx_n_1,
      baud_tick_16 => baud_tick_16,
      error_reg => error_reg,
      raw_rxd => raw_rxd,
      rx_data_avail => rx_data_avail,
      rx_data_avail_reg => inst_uart_rx_n_3,
      rx_data_avail_reg_0 => \^s_axi_arready\,
      rx_data_avail_reg_1 => rx_data_avail_i_2_n_0,
      rx_data_avail_reg_2(0) => rx_error_reg_i_1_n_0,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arvalid => s_axi_arvalid
    );
inst_uart_tx: entity work.system_axi_uart_0_0_uart_tx
     port map (
      D(1) => p_1_in(3),
      D(0) => p_1_in(0),
      E(0) => tx_data_2(0),
      \FSM_sequential_state_reg[0]_0\ => baud_tick_1x_reg_n_0,
      Q(2) => reg_ctrl(3),
      Q(1) => p_0_in,
      Q(0) => \reg_ctrl_reg_n_0_[0]\,
      SR(0) => inst_uart_rx_n_1,
      axi_awready0 => axi_awready0,
      \axi_rdata_reg[3]\(1) => reg_baud_div(3),
      \axi_rdata_reg[3]\(0) => reg_baud_div(0),
      \axi_rdata_reg[3]_0\(1) => rx_data_latched(3),
      \axi_rdata_reg[3]_0\(0) => rx_data_latched(0),
      raw_rxd => raw_rxd,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(1 downto 0) => s_axi_araddr(1 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_aresetn_0 => inst_uart_tx_n_2,
      s_axi_awaddr(1 downto 0) => s_axi_awaddr(1 downto 0),
      s_axi_awvalid => s_axi_awvalid,
      s_axi_wvalid => s_axi_wvalid,
      \shreg_reg[7]_0\(7 downto 0) => tx_data(7 downto 0),
      \tx_data_reg[0]\ => aw_en_reg_n_0,
      tx_start => tx_start,
      uart_rxd => uart_rxd,
      uart_txd => uart_txd
    );
minusOp_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => minusOp_carry_n_0,
      CO(2) => minusOp_carry_n_1,
      CO(1) => minusOp_carry_n_2,
      CO(0) => minusOp_carry_n_3,
      CYINIT => reg_baud_div(0),
      DI(3 downto 0) => reg_baud_div(4 downto 1),
      O(3 downto 0) => minusOp(4 downto 1),
      S(3) => minusOp_carry_i_1_n_0,
      S(2) => minusOp_carry_i_2_n_0,
      S(1) => minusOp_carry_i_3_n_0,
      S(0) => minusOp_carry_i_4_n_0
    );
\minusOp_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => minusOp_carry_n_0,
      CO(3) => \minusOp_carry__0_n_0\,
      CO(2) => \minusOp_carry__0_n_1\,
      CO(1) => \minusOp_carry__0_n_2\,
      CO(0) => \minusOp_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => reg_baud_div(8 downto 5),
      O(3 downto 0) => minusOp(8 downto 5),
      S(3) => \minusOp_carry__0_i_1_n_0\,
      S(2) => \minusOp_carry__0_i_2_n_0\,
      S(1) => \minusOp_carry__0_i_3_n_0\,
      S(0) => \minusOp_carry__0_i_4_n_0\
    );
\minusOp_carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reg_baud_div(8),
      O => \minusOp_carry__0_i_1_n_0\
    );
\minusOp_carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reg_baud_div(7),
      O => \minusOp_carry__0_i_2_n_0\
    );
\minusOp_carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reg_baud_div(6),
      O => \minusOp_carry__0_i_3_n_0\
    );
\minusOp_carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reg_baud_div(5),
      O => \minusOp_carry__0_i_4_n_0\
    );
\minusOp_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_carry__0_n_0\,
      CO(3) => \minusOp_carry__1_n_0\,
      CO(2) => \minusOp_carry__1_n_1\,
      CO(1) => \minusOp_carry__1_n_2\,
      CO(0) => \minusOp_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => reg_baud_div(12 downto 9),
      O(3 downto 0) => minusOp(12 downto 9),
      S(3) => \minusOp_carry__1_i_1_n_0\,
      S(2) => \minusOp_carry__1_i_2_n_0\,
      S(1) => \minusOp_carry__1_i_3_n_0\,
      S(0) => \minusOp_carry__1_i_4_n_0\
    );
\minusOp_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reg_baud_div(12),
      O => \minusOp_carry__1_i_1_n_0\
    );
\minusOp_carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reg_baud_div(11),
      O => \minusOp_carry__1_i_2_n_0\
    );
\minusOp_carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reg_baud_div(10),
      O => \minusOp_carry__1_i_3_n_0\
    );
\minusOp_carry__1_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reg_baud_div(9),
      O => \minusOp_carry__1_i_4_n_0\
    );
\minusOp_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_carry__1_n_0\,
      CO(3 downto 2) => \NLW_minusOp_carry__2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \minusOp_carry__2_n_2\,
      CO(0) => \minusOp_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => reg_baud_div(14 downto 13),
      O(3) => \NLW_minusOp_carry__2_O_UNCONNECTED\(3),
      O(2 downto 0) => minusOp(15 downto 13),
      S(3) => '0',
      S(2) => \minusOp_carry__2_i_1_n_0\,
      S(1) => \minusOp_carry__2_i_2_n_0\,
      S(0) => \minusOp_carry__2_i_3_n_0\
    );
\minusOp_carry__2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reg_baud_div(15),
      O => \minusOp_carry__2_i_1_n_0\
    );
\minusOp_carry__2_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reg_baud_div(14),
      O => \minusOp_carry__2_i_2_n_0\
    );
\minusOp_carry__2_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reg_baud_div(13),
      O => \minusOp_carry__2_i_3_n_0\
    );
minusOp_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reg_baud_div(4),
      O => minusOp_carry_i_1_n_0
    );
minusOp_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reg_baud_div(3),
      O => minusOp_carry_i_2_n_0
    );
minusOp_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reg_baud_div(2),
      O => minusOp_carry_i_3_n_0
    );
minusOp_carry_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reg_baud_div(1),
      O => minusOp_carry_i_4_n_0
    );
\reg_baud_div[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => s_axi_wvalid,
      I1 => aw_en_reg_n_0,
      I2 => s_axi_awvalid,
      I3 => s_axi_awaddr(0),
      I4 => s_axi_awaddr(1),
      I5 => \reg_baud_div[15]_i_2_n_0\,
      O => reg_baud_div_0(0)
    );
\reg_baud_div[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \reg_baud_div[15]_i_3_n_0\,
      I1 => \reg_baud_div[15]_i_4_n_0\,
      I2 => s_axi_wdata(3),
      I3 => s_axi_wdata(2),
      I4 => s_axi_wdata(14),
      I5 => \reg_baud_div[15]_i_5_n_0\,
      O => \reg_baud_div[15]_i_2_n_0\
    );
\reg_baud_div[15]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => s_axi_wdata(8),
      I1 => s_axi_wdata(11),
      I2 => s_axi_wdata(6),
      I3 => s_axi_wdata(9),
      O => \reg_baud_div[15]_i_3_n_0\
    );
\reg_baud_div[15]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => s_axi_wdata(12),
      I1 => s_axi_wdata(15),
      I2 => s_axi_wdata(10),
      I3 => s_axi_wdata(13),
      O => \reg_baud_div[15]_i_4_n_0\
    );
\reg_baud_div[15]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => s_axi_wdata(4),
      I1 => s_axi_wdata(7),
      I2 => s_axi_wdata(1),
      I3 => s_axi_wdata(5),
      O => \reg_baud_div[15]_i_5_n_0\
    );
\reg_baud_div_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_baud_div_0(0),
      D => s_axi_wdata(0),
      Q => reg_baud_div(0),
      S => inst_uart_rx_n_1
    );
\reg_baud_div_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_baud_div_0(0),
      D => s_axi_wdata(10),
      Q => reg_baud_div(10),
      R => inst_uart_rx_n_1
    );
\reg_baud_div_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_baud_div_0(0),
      D => s_axi_wdata(11),
      Q => reg_baud_div(11),
      R => inst_uart_rx_n_1
    );
\reg_baud_div_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_baud_div_0(0),
      D => s_axi_wdata(12),
      Q => reg_baud_div(12),
      R => inst_uart_rx_n_1
    );
\reg_baud_div_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_baud_div_0(0),
      D => s_axi_wdata(13),
      Q => reg_baud_div(13),
      R => inst_uart_rx_n_1
    );
\reg_baud_div_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_baud_div_0(0),
      D => s_axi_wdata(14),
      Q => reg_baud_div(14),
      R => inst_uart_rx_n_1
    );
\reg_baud_div_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_baud_div_0(0),
      D => s_axi_wdata(15),
      Q => reg_baud_div(15),
      R => inst_uart_rx_n_1
    );
\reg_baud_div_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_baud_div_0(0),
      D => s_axi_wdata(1),
      Q => reg_baud_div(1),
      S => inst_uart_rx_n_1
    );
\reg_baud_div_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_baud_div_0(0),
      D => s_axi_wdata(2),
      Q => reg_baud_div(2),
      R => inst_uart_rx_n_1
    );
\reg_baud_div_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_baud_div_0(0),
      D => s_axi_wdata(3),
      Q => reg_baud_div(3),
      S => inst_uart_rx_n_1
    );
\reg_baud_div_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_baud_div_0(0),
      D => s_axi_wdata(4),
      Q => reg_baud_div(4),
      S => inst_uart_rx_n_1
    );
\reg_baud_div_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_baud_div_0(0),
      D => s_axi_wdata(5),
      Q => reg_baud_div(5),
      R => inst_uart_rx_n_1
    );
\reg_baud_div_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_baud_div_0(0),
      D => s_axi_wdata(6),
      Q => reg_baud_div(6),
      R => inst_uart_rx_n_1
    );
\reg_baud_div_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_baud_div_0(0),
      D => s_axi_wdata(7),
      Q => reg_baud_div(7),
      R => inst_uart_rx_n_1
    );
\reg_baud_div_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_baud_div_0(0),
      D => s_axi_wdata(8),
      Q => reg_baud_div(8),
      R => inst_uart_rx_n_1
    );
\reg_baud_div_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_baud_div_0(0),
      D => s_axi_wdata(9),
      Q => reg_baud_div(9),
      R => inst_uart_rx_n_1
    );
\reg_ctrl[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => s_axi_awaddr(0),
      I1 => s_axi_awaddr(1),
      I2 => s_axi_awvalid,
      I3 => aw_en_reg_n_0,
      I4 => s_axi_wvalid,
      O => reg_ctrl_1(0)
    );
\reg_ctrl_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(0),
      Q => \reg_ctrl_reg_n_0_[0]\,
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(10),
      Q => reg_ctrl(10),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(11),
      Q => reg_ctrl(11),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(12),
      Q => reg_ctrl(12),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(13),
      Q => reg_ctrl(13),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(14),
      Q => reg_ctrl(14),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(15),
      Q => reg_ctrl(15),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(16),
      Q => reg_ctrl(16),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(17),
      Q => reg_ctrl(17),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(18),
      Q => reg_ctrl(18),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(19),
      Q => reg_ctrl(19),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(1),
      Q => p_0_in,
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(20),
      Q => reg_ctrl(20),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(21),
      Q => reg_ctrl(21),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(22),
      Q => reg_ctrl(22),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(23),
      Q => reg_ctrl(23),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(24),
      Q => reg_ctrl(24),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(25),
      Q => reg_ctrl(25),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(26),
      Q => reg_ctrl(26),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(27),
      Q => reg_ctrl(27),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(28),
      Q => reg_ctrl(28),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(29),
      Q => reg_ctrl(29),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(2),
      Q => reg_ctrl(2),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(30),
      Q => reg_ctrl(30),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(31),
      Q => reg_ctrl(31),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(3),
      Q => reg_ctrl(3),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(4),
      Q => reg_ctrl(4),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(5),
      Q => reg_ctrl(5),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(6),
      Q => reg_ctrl(6),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(7),
      Q => reg_ctrl(7),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(8),
      Q => reg_ctrl(8),
      R => inst_uart_rx_n_1
    );
\reg_ctrl_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => reg_ctrl_1(0),
      D => s_axi_wdata(9),
      Q => reg_ctrl(9),
      R => inst_uart_rx_n_1
    );
rx_data_avail_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      O => rx_data_avail_i_2_n_0
    );
rx_data_avail_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => inst_uart_rx_n_3,
      Q => rx_data_avail,
      R => '0'
    );
\rx_data_latched_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rx_valid_pulse,
      D => rx_data(0),
      Q => rx_data_latched(0),
      R => rx_error_reg_i_1_n_0
    );
\rx_data_latched_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rx_valid_pulse,
      D => rx_data(1),
      Q => rx_data_latched(1),
      R => rx_error_reg_i_1_n_0
    );
\rx_data_latched_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rx_valid_pulse,
      D => rx_data(2),
      Q => rx_data_latched(2),
      R => rx_error_reg_i_1_n_0
    );
\rx_data_latched_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rx_valid_pulse,
      D => rx_data(3),
      Q => rx_data_latched(3),
      R => rx_error_reg_i_1_n_0
    );
\rx_data_latched_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rx_valid_pulse,
      D => rx_data(4),
      Q => rx_data_latched(4),
      R => rx_error_reg_i_1_n_0
    );
\rx_data_latched_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rx_valid_pulse,
      D => rx_data(5),
      Q => rx_data_latched(5),
      R => rx_error_reg_i_1_n_0
    );
\rx_data_latched_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rx_valid_pulse,
      D => rx_data(6),
      Q => rx_data_latched(6),
      R => rx_error_reg_i_1_n_0
    );
\rx_data_latched_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rx_valid_pulse,
      D => rx_data(7),
      Q => rx_data_latched(7),
      R => rx_error_reg_i_1_n_0
    );
rx_error_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \reg_ctrl_reg_n_0_[0]\,
      I1 => s_axi_aresetn,
      O => rx_error_reg_i_1_n_0
    );
rx_error_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => rx_valid_pulse,
      D => error_reg,
      Q => rx_error_reg,
      R => rx_error_reg_i_1_n_0
    );
\tx_data_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => tx_data_2(0),
      D => s_axi_wdata(0),
      Q => tx_data(0),
      R => inst_uart_rx_n_1
    );
\tx_data_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => tx_data_2(0),
      D => s_axi_wdata(1),
      Q => tx_data(1),
      R => inst_uart_rx_n_1
    );
\tx_data_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => tx_data_2(0),
      D => s_axi_wdata(2),
      Q => tx_data(2),
      R => inst_uart_rx_n_1
    );
\tx_data_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => tx_data_2(0),
      D => s_axi_wdata(3),
      Q => tx_data(3),
      R => inst_uart_rx_n_1
    );
\tx_data_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => tx_data_2(0),
      D => s_axi_wdata(4),
      Q => tx_data(4),
      R => inst_uart_rx_n_1
    );
\tx_data_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => tx_data_2(0),
      D => s_axi_wdata(5),
      Q => tx_data(5),
      R => inst_uart_rx_n_1
    );
\tx_data_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => tx_data_2(0),
      D => s_axi_wdata(6),
      Q => tx_data(6),
      R => inst_uart_rx_n_1
    );
\tx_data_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => tx_data_2(0),
      D => s_axi_wdata(7),
      Q => tx_data(7),
      R => inst_uart_rx_n_1
    );
\tx_div_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \tx_div_cnt_reg_n_0_[0]\,
      O => \tx_div_cnt[0]_i_1_n_0\
    );
\tx_div_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tx_div_cnt_reg_n_0_[1]\,
      I1 => \tx_div_cnt_reg_n_0_[0]\,
      O => \tx_div_cnt[1]_i_1_n_0\
    );
\tx_div_cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \tx_div_cnt_reg_n_0_[0]\,
      I1 => \tx_div_cnt_reg_n_0_[1]\,
      I2 => \tx_div_cnt_reg_n_0_[2]\,
      O => \tx_div_cnt[2]_i_1_n_0\
    );
\tx_div_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \tx_div_cnt_reg_n_0_[1]\,
      I1 => \tx_div_cnt_reg_n_0_[0]\,
      I2 => \tx_div_cnt_reg_n_0_[2]\,
      I3 => \tx_div_cnt_reg_n_0_[3]\,
      O => \tx_div_cnt[3]_i_1_n_0\
    );
\tx_div_cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => baud_cnt160,
      D => \tx_div_cnt[0]_i_1_n_0\,
      Q => \tx_div_cnt_reg_n_0_[0]\,
      R => inst_uart_rx_n_1
    );
\tx_div_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => baud_cnt160,
      D => \tx_div_cnt[1]_i_1_n_0\,
      Q => \tx_div_cnt_reg_n_0_[1]\,
      R => inst_uart_rx_n_1
    );
\tx_div_cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => baud_cnt160,
      D => \tx_div_cnt[2]_i_1_n_0\,
      Q => \tx_div_cnt_reg_n_0_[2]\,
      R => inst_uart_rx_n_1
    );
\tx_div_cnt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => baud_cnt160,
      D => \tx_div_cnt[3]_i_1_n_0\,
      Q => \tx_div_cnt_reg_n_0_[3]\,
      R => inst_uart_rx_n_1
    );
tx_start_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => inst_uart_tx_n_2,
      Q => tx_start,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_uart_0_0 is
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_axi_uart_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_axi_uart_0_0 : entity is "system_axi_uart_0_0,axi_uart,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of system_axi_uart_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of system_axi_uart_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of system_axi_uart_0_0 : entity is "axi_uart,Vivado 2026.1";
end system_axi_uart_0_0;

architecture STRUCTURE of system_axi_uart_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
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
  attribute x_interface_parameter of s_axi_awaddr : signal is "XIL_INTERFACENAME s_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute x_interface_info of s_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 s_axi AWPROT";
  attribute x_interface_info of s_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 s_axi BRESP";
  attribute x_interface_info of s_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 s_axi RDATA";
  attribute x_interface_info of s_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 s_axi RRESP";
  attribute x_interface_info of s_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 s_axi WDATA";
  attribute x_interface_info of s_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 s_axi WSTRB";
begin
  s_axi_awready <= \^s_axi_awready\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axi_wready <= \^s_axi_awready\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.system_axi_uart_0_0_axi_uart
     port map (
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(1 downto 0) => s_axi_araddr(3 downto 2),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(1 downto 0) => s_axi_awaddr(3 downto 2),
      s_axi_awready => \^s_axi_awready\,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata(31 downto 0) => s_axi_wdata(31 downto 0),
      s_axi_wvalid => s_axi_wvalid,
      uart_rxd => uart_rxd,
      uart_txd => uart_txd
    );
end STRUCTURE;
