--------------------------------------------------------------------------------
-- File: axi_cnn_accelerator.vhd
-- Description: 64-MAC Parallel INT8 DMA Tensor / Pointwise-Conv / Dense Engine
--              for YAMNet + ARARA Acoustic Deforestation Classifier on Zynq-7000
--
-- Architecture:
--   * AXI4-Lite Slave (0x43C10000 via M_AXI_GP0) for control, dimensions & perf counters
--   * 64-bit AXI4 Burst Master (via S_AXI_HP0 -> DDR3, 800 MB/s @ 100 MHz)
--   * 64 KiB On-Chip Activation Scratchpad BRAM (8192 x 64-bit, 16 BRAM36)
--   * 8 KiB On-Chip Weight Tile BRAM (8 banks x 128 x 64-bit, 4 BRAM36)
--   * 8 Output-Channels x 8 Input-Channels = 64 Parallel INT8 Multipliers/cycle (DSP48E1)
--   * TFLite-style 64-bit Per-Channel Requantizer (31-bit mult + rounding right-shift + ZP)
--   * Overlapped Background AXI4 Writeback + Raw INT32 Logit Mode for final Dense layer
--
-- Register Map (0x43C10000):
--   0x00 CTRL_REG         [R/W] bit0=start, bit1=soft_reset, bit2=relu_en, bit3=raw_i32_en
--   0x04 STATUS_REG       [R]   bit0=busy, bit1=done, bit2=axi_err
--   0x08 ACT_ADDR_REG     [R/W] DDR byte address of X[M, K] (int8, 8B-aligned)
--   0x0C WGT_ADDR_REG     [R/W] DDR byte address of tiled weight+param stream (8B-aligned)
--   0x10 OUT_ADDR_REG     [R/W] DDR byte address of Y[M, N] (int8 or int32, 8B-aligned)
--   0x14 DIM_MK_REG       [R/W] [15:0]=M (1..4096), [31:16]=K (8..1024, mult of 8)
--   0x18 DIM_N_ZP_REG     [R/W] [15:0]=N (8..1024, mult of 8), [23:16]=out_zp (int8)
--   0x1C ID_REG           [R]   0xACC64008
--   0x20 PERF_TOTAL_REG   [R]   total cycles for last layer
--   0x24 PERF_COMP_REG    [R]   compute pipeline cycles for last layer
--   0x28 PERF_DMA_REG     [R]   AXI DMA read/write stall cycles for last layer
--   0x2C PERF_MAC8_REG    [R]   cumulative (MACs / 8) executed since reset
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity axi_cnn_accelerator is
    port (
        -- Shared Clock and Active-Low Reset (100 MHz FCLK_CLK0)
        s_axi_aclk    : in  std_logic;
        s_axi_aresetn : in  std_logic;

        ------------------------------------------------------------------------
        -- AXI4-Lite Slave Interface (Control / Status / Profiling @ 0x43C10000)
        ------------------------------------------------------------------------
        s_axi_awaddr  : in  std_logic_vector(7 downto 0);
        s_axi_awprot  : in  std_logic_vector(2 downto 0);
        s_axi_awvalid : in  std_logic;
        s_axi_awready : out std_logic;
        s_axi_wdata   : in  std_logic_vector(31 downto 0);
        s_axi_wstrb   : in  std_logic_vector(3 downto 0);
        s_axi_wvalid  : in  std_logic;
        s_axi_wready  : out std_logic;
        s_axi_bresp   : out std_logic_vector(1 downto 0);
        s_axi_bvalid  : out std_logic;
        s_axi_bready  : in  std_logic;
        s_axi_araddr  : in  std_logic_vector(7 downto 0);
        s_axi_arprot  : in  std_logic_vector(2 downto 0);
        s_axi_arvalid : in  std_logic;
        s_axi_arready : out std_logic;
        s_axi_rdata   : out std_logic_vector(31 downto 0);
        s_axi_rresp   : out std_logic_vector(1 downto 0);
        s_axi_rvalid  : out std_logic;
        s_axi_rready  : in  std_logic;

        ------------------------------------------------------------------------
        -- 64-bit AXI4 Memory-Mapped Master Interface (DDR3 via S_AXI_HP0)
        ------------------------------------------------------------------------
        m_axi_awaddr  : out std_logic_vector(31 downto 0);
        m_axi_awlen   : out std_logic_vector(7 downto 0);
        m_axi_awsize  : out std_logic_vector(2 downto 0);
        m_axi_awburst : out std_logic_vector(1 downto 0);
        m_axi_awlock  : out std_logic_vector(0 downto 0);
        m_axi_awcache : out std_logic_vector(3 downto 0);
        m_axi_awprot  : out std_logic_vector(2 downto 0);
        m_axi_awqos   : out std_logic_vector(3 downto 0);
        m_axi_awvalid : out std_logic;
        m_axi_awready : in  std_logic;

        m_axi_wdata   : out std_logic_vector(63 downto 0);
        m_axi_wstrb   : out std_logic_vector(7 downto 0);
        m_axi_wlast   : out std_logic;
        m_axi_wvalid  : out std_logic;
        m_axi_wready  : in  std_logic;

        m_axi_bresp   : in  std_logic_vector(1 downto 0);
        m_axi_bvalid  : in  std_logic;
        m_axi_bready  : out std_logic;

        m_axi_araddr  : out std_logic_vector(31 downto 0);
        m_axi_arlen   : out std_logic_vector(7 downto 0);
        m_axi_arsize  : out std_logic_vector(2 downto 0);
        m_axi_arburst : out std_logic_vector(1 downto 0);
        m_axi_arlock  : out std_logic_vector(0 downto 0);
        m_axi_arcache : out std_logic_vector(3 downto 0);
        m_axi_arprot  : out std_logic_vector(2 downto 0);
        m_axi_arqos   : out std_logic_vector(3 downto 0);
        m_axi_arvalid : out std_logic;
        m_axi_arready : in  std_logic;

        m_axi_rdata   : in  std_logic_vector(63 downto 0);
        m_axi_rresp   : in  std_logic_vector(1 downto 0);
        m_axi_rlast   : in  std_logic;
        m_axi_rvalid  : in  std_logic;
        m_axi_rready  : out std_logic
    );
end entity axi_cnn_accelerator;

architecture rtl of axi_cnn_accelerator is

    attribute X_INTERFACE_INFO      : string;
    attribute X_INTERFACE_PARAMETER : string;
    attribute X_INTERFACE_INFO of s_axi_aclk    : signal is "xilinx.com:signal:clock:1.0 s_axi_aclk CLK";
    attribute X_INTERFACE_PARAMETER of s_axi_aclk : signal is "ASSOCIATED_BUSIF s_axi:m_axi, ASSOCIATED_RESET s_axi_aresetn";
    attribute X_INTERFACE_INFO of s_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 s_axi_aresetn RST";
    attribute X_INTERFACE_PARAMETER of s_axi_aresetn : signal is "POLARITY ACTIVE_LOW";

    ----------------------------------------------------------------------------
    -- Configuration & Status Registers
    ----------------------------------------------------------------------------
    signal reg_act_addr   : unsigned(31 downto 0) := (others => '0');
    signal reg_wgt_addr   : unsigned(31 downto 0) := (others => '0');
    signal reg_out_addr   : unsigned(31 downto 0) := (others => '0');
    signal reg_dim_m      : unsigned(15 downto 0) := to_unsigned(1, 16);
    signal reg_dim_k      : unsigned(15 downto 0) := to_unsigned(8, 16);
    signal reg_dim_n      : unsigned(15 downto 0) := to_unsigned(8, 16);
    signal reg_out_zp     : signed(7 downto 0)    := to_signed(-128, 8);
    signal reg_relu_en    : std_logic := '1';
    signal reg_raw_i32    : std_logic := '0';
    signal start_pulse    : std_logic := '0';
    signal soft_rst_pulse : std_logic := '0';

    signal status_busy    : std_logic := '0';
    signal status_done    : std_logic := '0';
    signal status_err     : std_logic := '0';

    signal perf_total     : unsigned(31 downto 0) := (others => '0');
    signal perf_comp      : unsigned(31 downto 0) := (others => '0');
    signal perf_dma       : unsigned(31 downto 0) := (others => '0');
    signal perf_mac8      : unsigned(31 downto 0) := (others => '0');

    -- AXI4-Lite Slave Handshake
    signal s_aw_latched   : std_logic := '0';
    signal s_w_latched    : std_logic := '0';
    signal s_awaddr_r     : std_logic_vector(7 downto 0) := (others => '0');
    signal s_wdata_r      : std_logic_vector(31 downto 0) := (others => '0');
    signal s_awready_r    : std_logic := '0';
    signal s_wready_r     : std_logic := '0';
    signal s_bvalid_r     : std_logic := '0';
    signal s_arready_r    : std_logic := '0';
    signal s_rvalid_r     : std_logic := '0';
    signal s_rdata_r      : std_logic_vector(31 downto 0) := (others => '0');

    ----------------------------------------------------------------------------
    -- On-Chip Scratchpad BRAMs (2-cycle synchronous read latency, OUT_REG=true)
    ----------------------------------------------------------------------------
    signal act_we         : std_logic := '0';
    signal act_waddr      : std_logic_vector(12 downto 0) := (others => '0');
    signal act_wdata      : std_logic_vector(63 downto 0) := (others => '0');
    signal act_raddr      : std_logic_vector(12 downto 0) := (others => '0');
    signal act_rdata      : std_logic_vector(63 downto 0);

    type slv8_t   is array (0 to 7) of std_logic;
    type wdata8_t is array (0 to 7) of std_logic_vector(63 downto 0);
    signal wgt_we         : slv8_t := (others => '0');
    signal wgt_waddr      : std_logic_vector(6 downto 0) := (others => '0');
    signal wgt_wdata      : std_logic_vector(63 downto 0) := (others => '0');
    signal wgt_raddr      : std_logic_vector(6 downto 0) := (others => '0');
    signal wgt_rdata      : wdata8_t;

    ----------------------------------------------------------------------------
    -- Per-Tile Parameter Registers (8 channels per tile)
    ----------------------------------------------------------------------------
    type i32_arr8_t is array (0 to 7) of signed(31 downto 0);
    type u6_arr8_t  is array (0 to 7) of unsigned(5 downto 0);
    signal tile_bias      : i32_arr8_t := (others => (others => '0'));
    signal tile_mult      : i32_arr8_t := (others => (others => '0'));
    signal tile_shift     : u6_arr8_t  := (others => to_unsigned(30, 6));

    ----------------------------------------------------------------------------
    -- Main Accelerator FSM & DMA Engine
    ----------------------------------------------------------------------------
    type main_state_t is (
        ST_IDLE,
        ST_ACT_AR,
        ST_ACT_R,
        ST_HDR_AR,
        ST_HDR_R,
        ST_WGT_AR,
        ST_WGT_R,
        ST_PIX_INIT,
        ST_PIX_PIPE,
        ST_RQ_PIPE,
        ST_WAIT_WR_SLOT,
        ST_RAW_WR_ISSUE,
        ST_DRAIN_WR,
        ST_DONE
    );
    signal state          : main_state_t := ST_IDLE;

    -- Layer / loop counters
    signal num_k8         : unsigned(7 downto 0)  := to_unsigned(1, 8);   -- K / 8 (1..128)
    signal num_ntiles     : unsigned(7 downto 0)  := to_unsigned(1, 8);   -- N / 8 (1..128)
    signal tile_idx       : unsigned(7 downto 0)  := (others => '0');     -- 0 .. num_ntiles-1
    signal m_idx          : unsigned(15 downto 0) := (others => '0');     -- 0 .. M-1
    signal m_act_base     : unsigned(12 downto 0) := (others => '0');     -- m_idx * num_k8
    signal m_out_offset   : unsigned(31 downto 0) := (others => '0');     -- m_idx * N (or * 4*N)

    -- AXI Read Burst tracking
    signal rd_curr_addr   : unsigned(31 downto 0) := (others => '0');
    signal rd_words_rem   : unsigned(15 downto 0) := (others => '0');     -- 64-bit words remaining
    signal rd_word_idx    : unsigned(15 downto 0) := (others => '0');     -- index within transfer
    signal rd_burst_len   : unsigned(7 downto 0)  := (others => '0');     -- arlen (beats - 1)
    signal wgt_stream_ptr : unsigned(31 downto 0) := (others => '0');

    signal m_araddr_r     : std_logic_vector(31 downto 0) := (others => '0');
    signal m_arlen_r      : std_logic_vector(7 downto 0)  := (others => '0');
    signal m_arvalid_r    : std_logic := '0';
    signal m_rready_r     : std_logic := '0';

    ----------------------------------------------------------------------------
    -- 64-MAC Compute Pipeline Signals (8 out-ch x 8 in-ch = 64 INT8 mults/clk)
    ----------------------------------------------------------------------------
    type prod64_t is array (0 to 63) of signed(15 downto 0);
    signal prod_s3        : prod64_t := (others => (others => '0'));
    attribute use_dsp : string;
    attribute keep    : string;
    attribute use_dsp of prod_s3 : signal is "yes";
    attribute keep    of prod_s3 : signal is "true";

    type sum8_arr_t is array (0 to 7) of signed(19 downto 0);
    signal sum8_s4        : sum8_arr_t := (others => (others => '0'));
    attribute use_dsp of sum8_s4 : signal is "no";
    signal acc_regs       : i32_arr8_t := (others => (others => '0'));

    signal pipe_step      : unsigned(8 downto 0) := (others => '0');
    signal vld_s1, vld_s2, vld_s3, vld_s4, vld_s5 : std_logic := '0';

    ----------------------------------------------------------------------------
    -- Shared 64-bit Requantizer Pipeline (5 stages for >100 MHz timing closure)
    ----------------------------------------------------------------------------
    signal rq_step        : unsigned(3 downto 0) := (others => '0'); -- 0..13
    signal rq_v1, rq_v2, rq_v3, rq_v4, rq_v5 : std_logic := '0';
    signal rq_acc_s1      : signed(31 downto 0) := (others => '0');
    signal rq_mult_s1     : signed(31 downto 0) := (others => '0');
    signal rq_sh_s1       : unsigned(5 downto 0) := to_unsigned(30, 6);

    -- 4 parallel 17x17 single-DSP48E1 partial products (avoids 4-DSP PCIN cascade)
    signal rq_p_ll        : signed(33 downto 0) := (others => '0');
    signal rq_p_lh        : signed(32 downto 0) := (others => '0');
    signal rq_p_hl        : signed(32 downto 0) := (others => '0');
    signal rq_p_hh        : signed(31 downto 0) := (others => '0');
    attribute use_dsp of rq_p_ll : signal is "yes";
    attribute use_dsp of rq_p_lh : signal is "yes";
    attribute use_dsp of rq_p_hl : signal is "yes";
    attribute use_dsp of rq_p_hh : signal is "yes";
    attribute keep    of rq_p_ll : signal is "true";
    attribute keep    of rq_p_lh : signal is "true";
    attribute keep    of rq_p_hl : signal is "true";
    attribute keep    of rq_p_hh : signal is "true";
    signal rq_rnd_s2      : signed(63 downto 0) := (others => '0');
    signal rq_sh_s2       : unsigned(5 downto 0) := to_unsigned(30, 6);

    signal rq_prod_s3     : signed(63 downto 0) := (others => '0');
    signal rq_rnd_s3      : signed(63 downto 0) := (others => '0');
    signal rq_sh_s3       : unsigned(5 downto 0) := to_unsigned(30, 6);

    signal rq_sum_s4      : signed(63 downto 0) := (others => '0');
    signal rq_sh_s4       : unsigned(5 downto 0) := to_unsigned(30, 6);

    signal rq_shifted_s5  : signed(63 downto 0) := (others => '0');
    signal out_pack64     : std_logic_vector(63 downto 0) := (others => '0');

    ----------------------------------------------------------------------------
    -- Overlapped AXI4 Write Master Engine (1-beat INT8 or 4-beat INT32)
    ----------------------------------------------------------------------------
    type wr_state_t is (WR_IDLE, WR_ACTIVE, WR_WAIT_B);
    signal wr_state       : wr_state_t := WR_IDLE;
    signal wr_req_pulse   : std_logic := '0';
    signal wr_req_addr    : unsigned(31 downto 0) := (others => '0');
    signal wr_req_beats   : unsigned(2 downto 0)  := (others => '0'); -- 0 = 1 beat, 3 = 4 beats
    type wr_buf4_t is array (0 to 3) of std_logic_vector(63 downto 0);
    signal wr_req_data    : wr_buf4_t := (others => (others => '0'));

    signal wr_aw_done     : std_logic := '0';
    signal wr_beat_idx    : unsigned(2 downto 0) := (others => '0');
    signal wr_beats_tot   : unsigned(2 downto 0) := (others => '0');
    signal wr_data_lat    : wr_buf4_t := (others => (others => '0'));
    signal m_awaddr_r     : std_logic_vector(31 downto 0) := (others => '0');
    signal m_awlen_r      : std_logic_vector(7 downto 0)  := (others => '0');
    signal m_awvalid_r    : std_logic := '0';
    signal m_wvalid_r     : std_logic := '0';
    signal m_bready_r     : std_logic := '0';
    signal wr_err_pulse   : std_logic := '0';

begin

    ----------------------------------------------------------------------------
    -- Static & Registered AXI Port Assignments
    ----------------------------------------------------------------------------
    s_axi_awready <= s_awready_r;
    s_axi_wready  <= s_wready_r;
    s_axi_bresp   <= "00";
    s_axi_bvalid  <= s_bvalid_r;
    s_axi_arready <= s_arready_r;
    s_axi_rdata   <= s_rdata_r;
    s_axi_rresp   <= "00";
    s_axi_rvalid  <= s_rvalid_r;

    m_axi_awaddr  <= m_awaddr_r;
    m_axi_awlen   <= m_awlen_r;
    m_axi_awsize  <= "011";  -- 8 bytes (64-bit)
    m_axi_awburst <= "01";   -- INCR
    m_axi_awlock  <= "0";
    m_axi_awcache <= "0011"; -- Normal Non-cacheable Bufferable
    m_axi_awprot  <= "000";
    m_axi_awqos   <= "0000";
    m_axi_awvalid <= m_awvalid_r;

    m_axi_wdata   <= wr_data_lat(to_integer(wr_beat_idx(1 downto 0)));
    m_axi_wstrb   <= X"FF";
    m_axi_wlast   <= '1' when (wr_beat_idx = wr_beats_tot) else '0';
    m_axi_wvalid  <= m_wvalid_r;
    m_axi_bready  <= m_bready_r;

    m_axi_araddr  <= m_araddr_r;
    m_axi_arlen   <= m_arlen_r;
    m_axi_arsize  <= "011";  -- 8 bytes (64-bit)
    m_axi_arburst <= "01";   -- INCR
    m_axi_arlock  <= "0";
    m_axi_arcache <= "0011";
    m_axi_arprot  <= "000";
    m_axi_arqos   <= "0000";
    m_axi_arvalid <= m_arvalid_r;
    m_axi_rready  <= m_rready_r;

    ----------------------------------------------------------------------------
    -- Scratchpad BRAM Instantiations
    ----------------------------------------------------------------------------
    u_act_ram : entity work.pw_sdp_ram
        generic map (
            ADDR_W  => 13,   -- 8192 x 64-bit = 64 KiB
            DATA_W  => 64,
            OUT_REG => true
        )
        port map (
            clk   => s_axi_aclk,
            we    => act_we,
            waddr => act_waddr,
            wdata => act_wdata,
            raddr => act_raddr,
            rdata => act_rdata
        );

    g_wgt_banks : for b in 0 to 7 generate
        u_wgt_ram : entity work.pw_sdp_ram
            generic map (
                ADDR_W  => 7,    -- 128 x 64-bit = 1 KiB per channel (up to K=1024)
                DATA_W  => 64,
                OUT_REG => true
            )
            port map (
                clk   => s_axi_aclk,
                we    => wgt_we(b),
                waddr => wgt_waddr,
                wdata => wgt_wdata,
                raddr => wgt_raddr,
                rdata => wgt_rdata(b)
            );
    end generate;

    ----------------------------------------------------------------------------
    -- AXI4-Lite Slave Interface (Control / Config / Perf Counters)
    ----------------------------------------------------------------------------
    process (s_axi_aclk)
    begin
        if rising_edge(s_axi_aclk) then
            start_pulse    <= '0';
            soft_rst_pulse <= '0';
            s_awready_r    <= '0';
            s_wready_r     <= '0';
            s_arready_r    <= '0';

            if s_axi_aresetn = '0' then
                s_aw_latched <= '0';
                s_w_latched  <= '0';
                s_bvalid_r   <= '0';
                s_rvalid_r   <= '0';
                s_rdata_r    <= (others => '0');
                reg_act_addr <= (others => '0');
                reg_wgt_addr <= (others => '0');
                reg_out_addr <= (others => '0');
                reg_dim_m    <= to_unsigned(1, 16);
                reg_dim_k    <= to_unsigned(8, 16);
                reg_dim_n    <= to_unsigned(8, 16);
                reg_out_zp   <= to_signed(-128, 8);
                reg_relu_en  <= '1';
                reg_raw_i32  <= '0';
            else
                -- Write Address & Write Data latching
                if s_bvalid_r = '0' then
                    if s_aw_latched = '0' and s_axi_awvalid = '1' then
                        s_aw_latched <= '1';
                        s_awaddr_r   <= s_axi_awaddr;
                        s_awready_r  <= '1';
                    end if;
                    if s_w_latched = '0' and s_axi_wvalid = '1' then
                        s_w_latched <= '1';
                        s_wdata_r   <= s_axi_wdata;
                        s_wready_r  <= '1';
                    end if;
                end if;

                if s_aw_latched = '1' and s_w_latched = '1' and s_bvalid_r = '0' then
                    case s_awaddr_r(7 downto 2) is
                        when "000000" => -- 0x00 CTRL
                            if s_wdata_r(0) = '1' and status_busy = '0' then
                                start_pulse <= '1';
                            end if;
                            if s_wdata_r(1) = '1' then
                                soft_rst_pulse <= '1';
                            end if;
                            reg_relu_en <= s_wdata_r(2);
                            reg_raw_i32 <= s_wdata_r(3);
                        when "000010" => -- 0x08 ACT_ADDR
                            reg_act_addr <= unsigned(s_wdata_r);
                        when "000011" => -- 0x0C WGT_ADDR
                            reg_wgt_addr <= unsigned(s_wdata_r);
                        when "000100" => -- 0x10 OUT_ADDR
                            reg_out_addr <= unsigned(s_wdata_r);
                        when "000101" => -- 0x14 DIM_MK
                            reg_dim_m <= unsigned(s_wdata_r(15 downto 0));
                            reg_dim_k <= unsigned(s_wdata_r(31 downto 16));
                        when "000110" => -- 0x18 DIM_N_ZP
                            reg_dim_n  <= unsigned(s_wdata_r(15 downto 0));
                            reg_out_zp <= signed(s_wdata_r(23 downto 16));
                        when others =>
                            null;
                    end case;
                    s_aw_latched <= '0';
                    s_w_latched  <= '0';
                    s_bvalid_r   <= '1';
                elsif s_bvalid_r = '1' and s_axi_bready = '1' then
                    s_bvalid_r <= '0';
                end if;

                -- Read Channel
                if s_rvalid_r = '0' and s_axi_arvalid = '1' and s_arready_r = '0' then
                    s_arready_r <= '1';
                    s_rvalid_r  <= '1';
                    case s_axi_araddr(7 downto 2) is
                        when "000000" =>
                            s_rdata_r <= (2 => reg_relu_en, 3 => reg_raw_i32, others => '0');
                        when "000001" =>
                            s_rdata_r <= (0 => status_busy, 1 => status_done, 2 => status_err, others => '0');
                        when "000010" =>
                            s_rdata_r <= std_logic_vector(reg_act_addr);
                        when "000011" =>
                            s_rdata_r <= std_logic_vector(reg_wgt_addr);
                        when "000100" =>
                            s_rdata_r <= std_logic_vector(reg_out_addr);
                        when "000101" =>
                            s_rdata_r <= std_logic_vector(reg_dim_k) & std_logic_vector(reg_dim_m);
                        when "000110" =>
                            s_rdata_r <= X"00" & std_logic_vector(reg_out_zp) & std_logic_vector(reg_dim_n);
                        when "000111" =>
                            s_rdata_r <= X"ACC64008";
                        when "001000" =>
                            s_rdata_r <= std_logic_vector(perf_total);
                        when "001001" =>
                            s_rdata_r <= std_logic_vector(perf_comp);
                        when "001010" =>
                            s_rdata_r <= std_logic_vector(perf_dma);
                        when "001011" =>
                            s_rdata_r <= std_logic_vector(perf_mac8);
                        when others =>
                            s_rdata_r <= (others => '0');
                    end case;
                elsif s_rvalid_r = '1' and s_axi_rready = '1' then
                    s_rvalid_r <= '0';
                end if;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- Background AXI4 Write Master FSM (Overlapped with Compute Pipeline)
    ----------------------------------------------------------------------------
    process (s_axi_aclk)
    begin
        if rising_edge(s_axi_aclk) then
            wr_err_pulse <= '0';
            if s_axi_aresetn = '0' or soft_rst_pulse = '1' then
                wr_state     <= WR_IDLE;
                m_awvalid_r  <= '0';
                m_wvalid_r   <= '0';
                m_bready_r   <= '0';
                wr_aw_done   <= '0';
                wr_beat_idx  <= (others => '0');
                wr_beats_tot <= (others => '0');
            else
                case wr_state is
                    when WR_IDLE =>
                        if wr_req_pulse = '1' then
                            m_awaddr_r   <= std_logic_vector(wr_req_addr);
                            m_awlen_r    <= "00000" & std_logic_vector(wr_req_beats);
                            m_awvalid_r  <= '1';
                            m_wvalid_r   <= '1';
                            wr_aw_done   <= '0';
                            wr_beat_idx  <= (others => '0');
                            wr_beats_tot <= wr_req_beats;
                            wr_data_lat  <= wr_req_data;
                            wr_state     <= WR_ACTIVE;
                        end if;

                    when WR_ACTIVE =>
                        if m_awvalid_r = '1' and m_axi_awready = '1' then
                            m_awvalid_r <= '0';
                            wr_aw_done  <= '1';
                        end if;

                        if m_wvalid_r = '1' and m_axi_wready = '1' then
                            if wr_beat_idx = wr_beats_tot then
                                m_wvalid_r <= '0';
                            else
                                wr_beat_idx <= wr_beat_idx + 1;
                            end if;
                        end if;

                        if ((wr_aw_done = '1') or (m_awvalid_r = '1' and m_axi_awready = '1')) and
                           ((m_wvalid_r = '0') or (m_axi_wready = '1' and wr_beat_idx = wr_beats_tot)) then
                            m_bready_r <= '1';
                            wr_state   <= WR_WAIT_B;
                        end if;

                    when WR_WAIT_B =>
                        if m_axi_bvalid = '1' then
                            m_bready_r <= '0';
                            if m_axi_bresp /= "00" then
                                wr_err_pulse <= '1';
                            end if;
                            wr_state <= WR_IDLE;
                        end if;
                end case;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- Main Accelerator Control, AXI4 Burst Read DMA, 64-MAC Array & Requantizer
    ----------------------------------------------------------------------------
    process (s_axi_aclk)
        -- Helper: compute burst length (1..16 beats) respecting 4 KB AXI boundary
        variable max_to_4k   : unsigned(9 downto 0);
        variable burst_words : unsigned(9 downto 0);
        variable hdr_ch      : integer range 0 to 7;
        variable wgt_bank    : integer range 0 to 7;
        variable act_b       : signed(7 downto 0);
        variable wgt_b       : signed(7 downto 0);
        variable s01, s23, s45, s67 : signed(17 downto 0);
        variable s03, s47    : signed(18 downto 0);
        variable rq_a_lo     : signed(16 downto 0);
        variable rq_a_hi     : signed(15 downto 0);
        variable rq_b_lo     : signed(16 downto 0);
        variable rq_b_hi     : signed(15 downto 0);
        variable rq_acc_v    : signed(31 downto 0);
        variable rq_with_zp  : signed(63 downto 0);
        variable rq_byte     : signed(7 downto 0);
        variable sh_int      : integer range 1 to 62;
    begin
        if rising_edge(s_axi_aclk) then
            -- Default single-cycle pulses
            act_we       <= '0';
            wgt_we       <= (others => '0');
            wr_req_pulse <= '0';

            if wr_err_pulse = '1' then
                status_err <= '1';
            end if;

            if s_axi_aresetn = '0' or soft_rst_pulse = '1' then
                state          <= ST_IDLE;
                status_busy    <= '0';
                status_done    <= '0';
                status_err     <= '0';
                m_arvalid_r    <= '0';
                m_rready_r     <= '0';
                vld_s1         <= '0';
                vld_s2         <= '0';
                vld_s3         <= '0';
                vld_s4         <= '0';
                vld_s5         <= '0';
                rq_v1          <= '0';
                rq_v2          <= '0';
                rq_v3          <= '0';
                rq_v4          <= '0';
                rq_v5          <= '0';
                perf_mac8      <= (others => '0');
            else
                -- Profiling counter while busy
                if status_busy = '1' then
                    perf_total <= perf_total + 1;
                end if;

                ----------------------------------------------------------------
                -- 64-MAC Datapath Pipeline (2-cycle BRAM OUT_REG + 3-stage MAC)
                ----------------------------------------------------------------
                vld_s2 <= vld_s1;
                vld_s3 <= vld_s2;
                vld_s4 <= vld_s3;
                vld_s5 <= vld_s4;

                -- Stage 3 (after 2-cycle BRAM read): 64 parallel 8x8 -> 16-bit mults
                if vld_s3 = '1' then
                    for j in 0 to 7 loop
                        for lane in 0 to 7 loop
                            act_b := signed(act_rdata(8 * lane + 7 downto 8 * lane));
                            wgt_b := signed(wgt_rdata(j)(8 * lane + 7 downto 8 * lane));
                            prod_s3(j * 8 + lane) <= act_b * wgt_b;
                        end loop;
                    end loop;
                    perf_mac8 <= perf_mac8 + 8; -- 64 MACs = 8 * 8
                end if;

                -- Stage 4: 8 parallel balanced binary 8-input LUT/CARRY4 adder trees
                if vld_s4 = '1' then
                    for j in 0 to 7 loop
                        s01 := resize(prod_s3(j * 8 + 0), 18) + resize(prod_s3(j * 8 + 1), 18);
                        s23 := resize(prod_s3(j * 8 + 2), 18) + resize(prod_s3(j * 8 + 3), 18);
                        s45 := resize(prod_s3(j * 8 + 4), 18) + resize(prod_s3(j * 8 + 5), 18);
                        s67 := resize(prod_s3(j * 8 + 6), 18) + resize(prod_s3(j * 8 + 7), 18);
                        s03 := resize(s01, 19) + resize(s23, 19);
                        s47 := resize(s45, 19) + resize(s67, 19);
                        sum8_s4(j) <= resize(s03, 20) + resize(s47, 20);
                    end loop;
                end if;

                -- Stage 5: 8 parallel 32-bit accumulators
                if vld_s5 = '1' then
                    for j in 0 to 7 loop
                        acc_regs(j) <= acc_regs(j) + resize(sum8_s4(j), 32);
                    end loop;
                end if;

                ----------------------------------------------------------------
                -- 64-bit Per-Channel Requantizer Pipeline (Stages RQ1..RQ5)
                ----------------------------------------------------------------
                rq_v2 <= rq_v1;
                rq_v3 <= rq_v2;
                rq_v4 <= rq_v3;
                rq_v5 <= rq_v4;

                -- Stage RQ1: 4 parallel single-DSP48E1 partial products + rounding mask
                if rq_v1 = '1' then
                    rq_a_lo := signed('0' & std_logic_vector(rq_acc_s1(15 downto 0)));
                    rq_a_hi := rq_acc_s1(31 downto 16);
                    rq_b_lo := signed('0' & std_logic_vector(rq_mult_s1(15 downto 0)));
                    rq_b_hi := rq_mult_s1(31 downto 16);
                    rq_p_ll <= rq_a_lo * rq_b_lo;
                    rq_p_lh <= rq_a_lo * rq_b_hi;
                    rq_p_hl <= rq_a_hi * rq_b_lo;
                    rq_p_hh <= rq_a_hi * rq_b_hi;
                    if rq_sh_s1 < 1 then
                        sh_int := 1;
                    elsif rq_sh_s1 > 62 then
                        sh_int := 62;
                    else
                        sh_int := to_integer(rq_sh_s1);
                    end if;
                    rq_sh_s2  <= to_unsigned(sh_int, 6);
                    rq_rnd_s2 <= shift_left(to_signed(1, 64), sh_int - 1);
                end if;

                -- Stage RQ2: Combine partial products into 64-bit product
                if rq_v2 = '1' then
                    rq_prod_s3 <= resize(rq_p_ll, 64) +
                                  shift_left(resize(rq_p_lh, 64) + resize(rq_p_hl, 64), 16) +
                                  shift_left(resize(rq_p_hh, 64), 32);
                    rq_rnd_s3  <= rq_rnd_s2;
                    rq_sh_s3   <= rq_sh_s2;
                end if;

                -- Stage RQ3: Dedicated 64-bit rounding addition
                if rq_v3 = '1' then
                    rq_sum_s4 <= rq_prod_s3 + rq_rnd_s3;
                    rq_sh_s4  <= rq_sh_s3;
                end if;

                -- Stage RQ4: Dedicated 64-bit arithmetic barrel right-shift
                if rq_v4 = '1' then
                    rq_shifted_s5 <= shift_right(rq_sum_s4, to_integer(rq_sh_s4));
                end if;

                -- Stage RQ5: Zero-point offset + [-128, 127] saturation + pack
                if rq_v5 = '1' then
                    rq_with_zp := rq_shifted_s5 + resize(reg_out_zp, 64);
                    if rq_with_zp > 127 then
                        rq_byte := to_signed(127, 8);
                    elsif rq_with_zp < -128 then
                        rq_byte := to_signed(-128, 8);
                    else
                        rq_byte := resize(rq_with_zp, 8);
                    end if;
                    -- Shift in from MSB so channel 0 lands at [7:0] and channel 7 at [63:56]
                    out_pack64 <= std_logic_vector(rq_byte) & out_pack64(63 downto 8);
                end if;

                ----------------------------------------------------------------
                -- Top-Level Layer Control State Machine
                ----------------------------------------------------------------
                case state is
                    when ST_IDLE =>
                        vld_s1 <= '0';
                        rq_v1  <= '0';
                        if start_pulse = '1' then
                            status_busy   <= '1';
                            status_done   <= '0';
                            perf_total    <= (others => '0');
                            perf_comp     <= (others => '0');
                            perf_dma      <= (others => '0');

                            num_k8        <= resize(reg_dim_k(15 downto 3), 8);
                            num_ntiles    <= resize(reg_dim_n(15 downto 3), 8);
                            tile_idx      <= (others => '0');
                            wgt_stream_ptr <= reg_wgt_addr;

                            -- Setup DMA of entire X[M, K] (M * (K/8) 64-bit words) into act_ram
                            rd_curr_addr  <= reg_act_addr;
                            rd_words_rem  <= resize(reg_dim_m * reg_dim_k(15 downto 3), 16);
                            rd_word_idx   <= (others => '0');
                            state         <= ST_ACT_AR;
                        end if;

                    ------------------------------------------------------------
                    -- 1. Burst-DMA Input Activations X[M, K] -> act_ram
                    ------------------------------------------------------------
                    when ST_ACT_AR =>
                        perf_dma <= perf_dma + 1;
                        -- 64-bit words until next 4 KB boundary: 512 - addr[11:3]
                        max_to_4k := to_unsigned(512, 10) - ('0' & rd_curr_addr(11 downto 3));
                        if rd_words_rem >= 16 and max_to_4k >= 16 then
                            burst_words := to_unsigned(16, 10);
                        elsif rd_words_rem < resize(max_to_4k, 16) then
                            burst_words := resize(rd_words_rem, 10);
                        else
                            burst_words := max_to_4k;
                        end if;
                        rd_burst_len <= resize(burst_words - 1, 8);
                        m_araddr_r   <= std_logic_vector(rd_curr_addr);
                        m_arlen_r    <= std_logic_vector(resize(burst_words - 1, 8));
                        m_arvalid_r  <= '1';
                        state        <= ST_ACT_R;

                    when ST_ACT_R =>
                        perf_dma <= perf_dma + 1;
                        if m_arvalid_r = '1' and m_axi_arready = '1' then
                            m_arvalid_r <= '0';
                            m_rready_r  <= '1';
                        end if;

                        if m_rready_r = '1' and m_axi_rvalid = '1' then
                            if m_axi_rresp /= "00" then
                                status_err <= '1';
                            end if;
                            act_we      <= '1';
                            act_waddr   <= std_logic_vector(rd_word_idx(12 downto 0));
                            act_wdata   <= m_axi_rdata;
                            rd_word_idx <= rd_word_idx + 1;

                            if m_axi_rlast = '1' then
                                m_rready_r   <= '0';
                                rd_curr_addr <= rd_curr_addr + ((resize(rd_burst_len, 32) + 1) sll 3);
                                if rd_words_rem <= (resize(rd_burst_len, 16) + 1) then
                                    -- Activations loaded! Start first N-tile header fetch
                                    rd_curr_addr <= wgt_stream_ptr;
                                    rd_words_rem <= to_unsigned(16, 16);
                                    rd_word_idx  <= (others => '0');
                                    state        <= ST_HDR_AR;
                                else
                                    rd_words_rem <= rd_words_rem - (resize(rd_burst_len, 16) + 1);
                                    state        <= ST_ACT_AR;
                                end if;
                            end if;
                        end if;

                    ------------------------------------------------------------
                    -- 2. Burst-DMA 16-word Tile Header (biases, mults, shifts)
                    ------------------------------------------------------------
                    when ST_HDR_AR =>
                        perf_dma     <= perf_dma + 1;
                        max_to_4k    := to_unsigned(512, 10) - ('0' & rd_curr_addr(11 downto 3));
                        if rd_words_rem <= resize(max_to_4k, 16) then
                            burst_words := resize(rd_words_rem, 10);
                        else
                            burst_words := max_to_4k;
                        end if;
                        rd_burst_len <= resize(burst_words - 1, 8);
                        m_araddr_r   <= std_logic_vector(rd_curr_addr);
                        m_arlen_r    <= std_logic_vector(resize(burst_words - 1, 8));
                        m_arvalid_r  <= '1';
                        state        <= ST_HDR_R;

                    when ST_HDR_R =>
                        perf_dma <= perf_dma + 1;
                        if m_arvalid_r = '1' and m_axi_arready = '1' then
                            m_arvalid_r <= '0';
                            m_rready_r  <= '1';
                        end if;

                        if m_rready_r = '1' and m_axi_rvalid = '1' then
                            if m_axi_rresp /= "00" then
                                status_err <= '1';
                            end if;
                            if rd_word_idx < 8 then
                                hdr_ch := to_integer(rd_word_idx(2 downto 0));
                                tile_bias(hdr_ch) <= signed(m_axi_rdata(31 downto 0));
                                tile_mult(hdr_ch) <= signed(m_axi_rdata(63 downto 32));
                            elsif rd_word_idx = 8 then
                                for j in 0 to 7 loop
                                    tile_shift(j) <= unsigned(m_axi_rdata(8 * j + 5 downto 8 * j));
                                end loop;
                            end if;
                            rd_word_idx <= rd_word_idx + 1;

                            if m_axi_rlast = '1' then
                                m_rready_r   <= '0';
                                rd_curr_addr <= rd_curr_addr + ((resize(rd_burst_len, 32) + 1) sll 3);
                                if rd_words_rem <= (resize(rd_burst_len, 16) + 1) then
                                    -- Header loaded! Now fetch 8*K bytes = K 64-bit words of weights
                                    rd_words_rem <= reg_dim_k;
                                    rd_word_idx  <= (others => '0');
                                    state        <= ST_WGT_AR;
                                else
                                    rd_words_rem <= rd_words_rem - (resize(rd_burst_len, 16) + 1);
                                    state        <= ST_HDR_AR;
                                end if;
                            end if;
                        end if;

                    ------------------------------------------------------------
                    -- 3. Burst-DMA 8 Weight Rows (K x 64-bit words) -> wgt_ram_0..7
                    ------------------------------------------------------------
                    when ST_WGT_AR =>
                        perf_dma  <= perf_dma + 1;
                        max_to_4k := to_unsigned(512, 10) - ('0' & rd_curr_addr(11 downto 3));
                        if rd_words_rem >= 16 and max_to_4k >= 16 then
                            burst_words := to_unsigned(16, 10);
                        elsif rd_words_rem < resize(max_to_4k, 16) then
                            burst_words := resize(rd_words_rem, 10);
                        else
                            burst_words := max_to_4k;
                        end if;
                        rd_burst_len <= resize(burst_words - 1, 8);
                        m_araddr_r   <= std_logic_vector(rd_curr_addr);
                        m_arlen_r    <= std_logic_vector(resize(burst_words - 1, 8));
                        m_arvalid_r  <= '1';
                        state        <= ST_WGT_R;

                    when ST_WGT_R =>
                        perf_dma <= perf_dma + 1;
                        if m_arvalid_r = '1' and m_axi_arready = '1' then
                            m_arvalid_r <= '0';
                            m_rready_r  <= '1';
                        end if;

                        if m_rready_r = '1' and m_axi_rvalid = '1' then
                            if m_axi_rresp /= "00" then
                                status_err <= '1';
                            end if;
                            -- Word idx = k8 * 8 + bank
                            wgt_bank         := to_integer(rd_word_idx(2 downto 0));
                            wgt_we(wgt_bank) <= '1';
                            wgt_waddr        <= std_logic_vector(rd_word_idx(9 downto 3));
                            wgt_wdata        <= m_axi_rdata;
                            rd_word_idx      <= rd_word_idx + 1;

                            if m_axi_rlast = '1' then
                                m_rready_r   <= '0';
                                rd_curr_addr <= rd_curr_addr + ((resize(rd_burst_len, 32) + 1) sll 3);
                                if rd_words_rem <= (resize(rd_burst_len, 16) + 1) then
                                    wgt_stream_ptr <= rd_curr_addr + ((resize(rd_burst_len, 32) + 1) sll 3);
                                    m_idx          <= (others => '0');
                                    m_act_base     <= (others => '0');
                                    m_out_offset   <= (others => '0');
                                    state          <= ST_PIX_INIT;
                                else
                                    rd_words_rem <= rd_words_rem - (resize(rd_burst_len, 16) + 1);
                                    state        <= ST_WGT_AR;
                                end if;
                            end if;
                        end if;

                    ------------------------------------------------------------
                    -- 4. Compute M Spatial Positions through the 64-MAC Pipeline
                    ------------------------------------------------------------
                    when ST_PIX_INIT =>
                        perf_comp <= perf_comp + 1;
                        for j in 0 to 7 loop
                            acc_regs(j) <= tile_bias(j);
                        end loop;
                        pipe_step <= (others => '0');
                        state     <= ST_PIX_PIPE;

                    when ST_PIX_PIPE =>
                        perf_comp <= perf_comp + 1;
                        if pipe_step < ('0' & num_k8) then
                            act_raddr <= std_logic_vector(m_act_base + resize(pipe_step, 13));
                            wgt_raddr <= std_logic_vector(pipe_step(6 downto 0));
                            vld_s1    <= '1';
                            pipe_step <= pipe_step + 1;
                        else
                            vld_s1 <= '0';
                            -- Wait 5 flush cycles so BRAM(2) + MAC(3) drain into acc_regs
                            if pipe_step = ('0' & num_k8) + 5 then
                                if reg_raw_i32 = '1' then
                                    state <= ST_RAW_WR_ISSUE;
                                else
                                    rq_step <= (others => '0');
                                    state   <= ST_RQ_PIPE;
                                end if;
                            else
                                pipe_step <= pipe_step + 1;
                            end if;
                        end if;

                    ------------------------------------------------------------
                    -- 5. Requantize 8 Accumulators -> 1 x 64-bit INT8 Word
                    ------------------------------------------------------------
                    when ST_RQ_PIPE =>
                        perf_comp <= perf_comp + 1;
                        if rq_step < 8 then
                            rq_acc_v := acc_regs(to_integer(rq_step(2 downto 0)));
                            if reg_relu_en = '1' and rq_acc_v < 0 then
                                rq_acc_s1 <= (others => '0');
                            else
                                rq_acc_s1 <= rq_acc_v;
                            end if;
                            rq_mult_s1 <= tile_mult(to_integer(rq_step(2 downto 0)));
                            rq_sh_s1   <= tile_shift(to_integer(rq_step(2 downto 0)));
                            rq_v1      <= '1';
                            rq_step    <= rq_step + 1;
                        else
                            rq_v1 <= '0';
                            if rq_step = 13 then
                                -- Wait 5 flush cycles for RQ1..RQ5 to complete out_pack64
                                state <= ST_WAIT_WR_SLOT;
                            else
                                rq_step <= rq_step + 1;
                            end if;
                        end if;

                    when ST_WAIT_WR_SLOT =>
                        if wr_state = WR_IDLE then
                            wr_req_addr    <= reg_out_addr + m_out_offset + (resize(tile_idx, 32) sll 3);
                            wr_req_beats   <= "000"; -- 1 beat = 8 bytes
                            wr_req_data(0) <= out_pack64;
                            wr_req_pulse   <= '1';

                            if m_idx + 1 < reg_dim_m then
                                m_idx        <= m_idx + 1;
                                m_act_base   <= m_act_base + resize(num_k8, 13);
                                m_out_offset <= m_out_offset + resize(reg_dim_n, 32);
                                state        <= ST_PIX_INIT;
                            elsif tile_idx + 1 < num_ntiles then
                                tile_idx     <= tile_idx + 1;
                                rd_curr_addr <= wgt_stream_ptr;
                                rd_words_rem <= to_unsigned(16, 16);
                                rd_word_idx  <= (others => '0');
                                state        <= ST_HDR_AR;
                            else
                                state        <= ST_DRAIN_WR;
                            end if;
                        else
                            perf_dma <= perf_dma + 1;
                        end if;

                    ------------------------------------------------------------
                    -- 5b. Raw INT32 Output Mode (4 x 64-bit beats = 8 x int32)
                    ------------------------------------------------------------
                    when ST_RAW_WR_ISSUE =>
                        if wr_state = WR_IDLE then
                            wr_req_addr    <= reg_out_addr + m_out_offset + (resize(tile_idx, 32) sll 5);
                            wr_req_beats   <= "011"; -- 4 beats = 32 bytes (8 x int32)
                            wr_req_data(0) <= std_logic_vector(acc_regs(1)) & std_logic_vector(acc_regs(0));
                            wr_req_data(1) <= std_logic_vector(acc_regs(3)) & std_logic_vector(acc_regs(2));
                            wr_req_data(2) <= std_logic_vector(acc_regs(5)) & std_logic_vector(acc_regs(4));
                            wr_req_data(3) <= std_logic_vector(acc_regs(7)) & std_logic_vector(acc_regs(6));
                            wr_req_pulse   <= '1';

                            if m_idx + 1 < reg_dim_m then
                                m_idx        <= m_idx + 1;
                                m_act_base   <= m_act_base + resize(num_k8, 13);
                                m_out_offset <= m_out_offset + (resize(reg_dim_n, 32) sll 2);
                                state        <= ST_PIX_INIT;
                            elsif tile_idx + 1 < num_ntiles then
                                tile_idx     <= tile_idx + 1;
                                rd_curr_addr <= wgt_stream_ptr;
                                rd_words_rem <= to_unsigned(16, 16);
                                rd_word_idx  <= (others => '0');
                                state        <= ST_HDR_AR;
                            else
                                state        <= ST_DRAIN_WR;
                            end if;
                        else
                            perf_dma <= perf_dma + 1;
                        end if;

                    when ST_DRAIN_WR =>
                        -- Ensure final posted write completes before raising done
                        if wr_req_pulse = '0' and wr_state = WR_IDLE then
                            state <= ST_DONE;
                        else
                            perf_dma <= perf_dma + 1;
                        end if;

                    when ST_DONE =>
                        status_busy <= '0';
                        status_done <= '1';
                        state       <= ST_IDLE;
                end case;
            end if;
        end if;
    end process;

end architecture rtl;
