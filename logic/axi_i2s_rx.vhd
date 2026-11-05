--------------------------------------------------------------------------------
-- File: axi_i2s_rx.vhd
-- Description: AXI4-Lite Controlled INMP441 I2S Master Receiver + 16K-Sample
--              BRAM FIFO + ARARA Board Peripherals (LEDs, Switches, LoRa Trig)
-- Target: Digilent Zybo Z7-10 (xc7z010clg400-1), 100 MHz FCLK_CLK0
-- Base Address: 0x43C20000 (M_AXI_GP0)
--
-- Register Map (32-bit aligned):
--   0x00 : CTRL_REG   [R/W] bit 0 = i2s_enable, bit 1 = fifo_clear (self-clearing),
--                           bit 2 = lora_trig_o (wake/trigger pin to B-L072Z-LRWAN1)
--   0x04 : STATUS_REG [R]   bit 0 = overrun (sticky), bit 1 = fifo_empty,
--                           bit 2 = fifo_full, bits[5:4] = switches_i[1:0]
--   0x08 : LEVEL_REG  [R]   number of 16-bit PCM samples currently in FIFO
--   0x0C : DATA_REG   [R]   pop 1 sample (16-bit signed PCM sign-extended to 32-bit;
--                           returns 0 without popping if empty)
--   0x10 : LEDS_REG   [R/W] bits[3:0] drive Zybo Z7-10 user LEDs
--   0x14 : ID_REG     [R]   constant 0x12250001 ("I2S v1")
--   0x18 : TOTAL_REG  [R]   total samples captured since enable/clear
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity axi_i2s_rx is
    generic (
        CLK_HZ     : integer := 100000000;
        FS_HZ      : integer := 16000;
        FIFO_ADDR_W: integer := 14   -- 2^14 = 16384 samples (1.024 s @ 16 kHz, 8 BRAM36)
    );
    port (
        -- AXI4-Lite Slave Interface
        s_axi_aclk    : in  std_logic;
        s_axi_aresetn : in  std_logic;
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

        -- INMP441 Digital MEMS Microphone Interface (Pmod JC)
        i2s_sck       : out std_logic;
        i2s_ws        : out std_logic;
        i2s_sd        : in  std_logic;
        i2s_lr_sel    : out std_logic; -- Tied '0' (selects Left slot on INMP441)

        -- B-L072Z-LRWAN1 Trigger & Board User I/O
        lora_trig_o   : out std_logic;
        switches_i    : in  std_logic_vector(1 downto 0);
        leds_o        : out std_logic_vector(3 downto 0)
    );
end entity axi_i2s_rx;

architecture rtl of axi_i2s_rx is

    attribute X_INTERFACE_INFO      : string;
    attribute X_INTERFACE_PARAMETER : string;
    attribute X_INTERFACE_INFO of s_axi_aclk    : signal is "xilinx.com:signal:clock:1.0 s_axi_aclk CLK";
    attribute X_INTERFACE_PARAMETER of s_axi_aclk : signal is "ASSOCIATED_BUSIF s_axi, ASSOCIATED_RESET s_axi_aresetn";
    attribute X_INTERFACE_INFO of s_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 s_axi_aresetn RST";
    attribute X_INTERFACE_PARAMETER of s_axi_aresetn : signal is "POLARITY ACTIVE_LOW";

    constant FIFO_DEPTH : integer := 2 ** FIFO_ADDR_W;

    -- NCO increment for 2 * BCLK = 2 * 64 * FS_HZ toggles/sec.
    -- Computed with 64-bit integer scaling via real conversion at elaboration time:
    -- For CLK_HZ=100e6, FS_HZ=16000: round(2^32 * 2048000 / 100000000) = 87960930.
    constant NCO_INC_INT : integer := integer(
        (real(2 * 64 * FS_HZ) / real(CLK_HZ)) * 4294967296.0
    );
    constant NCO_INC : unsigned(31 downto 0) := to_unsigned(NCO_INC_INT, 32);

    -- Simple dual-port BRAM for 16-bit audio FIFO
    type fifo_ram_t is array (0 to FIFO_DEPTH - 1) of std_logic_vector(15 downto 0);
    signal fifo_ram : fifo_ram_t := (others => (others => '0'));
    attribute ram_style : string;
    attribute ram_style of fifo_ram : signal is "block";

    signal ram_we    : std_logic := '0';
    signal ram_waddr : unsigned(FIFO_ADDR_W - 1 downto 0) := (others => '0');
    signal ram_wdata : std_logic_vector(15 downto 0) := (others => '0');
    signal ram_raddr : unsigned(FIFO_ADDR_W - 1 downto 0) := (others => '0');
    signal ram_rdata : std_logic_vector(15 downto 0) := (others => '0');

    -- FIFO pointers and status
    signal wr_ptr      : unsigned(FIFO_ADDR_W - 1 downto 0) := (others => '0');
    signal rd_ptr      : unsigned(FIFO_ADDR_W - 1 downto 0) := (others => '0');
    signal fifo_count  : unsigned(FIFO_ADDR_W downto 0)     := (others => '0');
    signal overrun_reg : std_logic := '0';
    signal total_cnt   : unsigned(31 downto 0) := (others => '0');

    -- Control registers
    signal i2s_en      : std_logic := '0';
    signal fifo_clr    : std_logic := '0';
    signal lora_trig_r : std_logic := '0';
    signal leds_reg    : std_logic_vector(3 downto 0) := (others => '0');

    -- Input synchronisers
    signal sd_sync1, sd_sync2 : std_logic := '0';
    signal sw_sync1, sw_sync2 : std_logic_vector(1 downto 0) := (others => '0');

    -- I2S Master clock & shifter
    signal nco_acc     : unsigned(31 downto 0) := (others => '0');
    signal sck_reg     : std_logic := '0';
    signal ws_reg      : std_logic := '0';
    signal bit_cnt     : unsigned(5 downto 0)  := (others => '0'); -- 0..63
    signal shift_reg   : std_logic_vector(23 downto 0) := (others => '0');
    signal sample_push : std_logic := '0';
    signal sample_data : std_logic_vector(15 downto 0) := (others => '0');

    -- AXI4-Lite Write FSM
    signal aw_latched  : std_logic := '0';
    signal w_latched   : std_logic := '0';
    signal awaddr_reg  : std_logic_vector(7 downto 0) := (others => '0');
    signal wdata_reg   : std_logic_vector(31 downto 0) := (others => '0');
    signal awready_r   : std_logic := '0';
    signal wready_r    : std_logic := '0';
    signal bvalid_r    : std_logic := '0';

    -- AXI4-Lite Read FSM (2-cycle BRAM read path)
    type rd_state_t is (RD_IDLE, RD_BRAM_WAIT, RD_RESP);
    signal rd_state     : rd_state_t := RD_IDLE;
    signal arready_r    : std_logic := '0';
    signal rvalid_r     : std_logic := '0';
    signal rdata_r      : std_logic_vector(31 downto 0) := (others => '0');
    signal araddr_reg   : std_logic_vector(7 downto 0) := (others => '0');
    signal pop_nonempty : std_logic := '0';
    signal pop_pulse    : std_logic := '0';

begin

    i2s_sck      <= sck_reg;
    i2s_ws       <= ws_reg;
    i2s_lr_sel   <= '0';
    lora_trig_o  <= lora_trig_r;
    leds_o       <= leds_reg;

    s_axi_awready <= awready_r;
    s_axi_wready  <= wready_r;
    s_axi_bresp   <= "00";
    s_axi_bvalid  <= bvalid_r;
    s_axi_arready <= arready_r;
    s_axi_rdata   <= rdata_r;
    s_axi_rresp   <= "00";
    s_axi_rvalid  <= rvalid_r;

    ----------------------------------------------------------------------------
    -- Synchronous Simple Dual-Port Block RAM
    ----------------------------------------------------------------------------
    process (s_axi_aclk)
    begin
        if rising_edge(s_axi_aclk) then
            if ram_we = '1' then
                fifo_ram(to_integer(ram_waddr)) <= ram_wdata;
            end if;
            ram_rdata <= fifo_ram(to_integer(ram_raddr));
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- 2-FF Synchronizers for Asynchronous External Inputs
    ----------------------------------------------------------------------------
    process (s_axi_aclk)
    begin
        if rising_edge(s_axi_aclk) then
            if s_axi_aresetn = '0' then
                sd_sync1 <= '0';
                sd_sync2 <= '0';
                sw_sync1 <= (others => '0');
                sw_sync2 <= (others => '0');
            else
                sd_sync1 <= i2s_sd;
                sd_sync2 <= sd_sync1;
                sw_sync1 <= switches_i;
                sw_sync2 <= sw_sync1;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- I2S Master Clock Generator & 24-bit Philips I2S Receiver
    ----------------------------------------------------------------------------
    process (s_axi_aclk)
        variable sum33     : unsigned(32 downto 0);
        variable next_b    : unsigned(5 downto 0);
        variable next_sh   : std_logic_vector(23 downto 0);
    begin
        if rising_edge(s_axi_aclk) then
            sample_push <= '0';
            if s_axi_aresetn = '0' or i2s_en = '0' then
                nco_acc   <= (others => '0');
                sck_reg   <= '0';
                ws_reg    <= '0';
                bit_cnt   <= to_unsigned(63, 6); -- First falling edge wraps to 0 (Left MSB delay slot)
                shift_reg <= (others => '0');
            else
                sum33   := ('0' & nco_acc) + ('0' & NCO_INC);
                nco_acc <= sum33(31 downto 0);

                if sum33(32) = '1' then
                    if sck_reg = '0' then
                        -- Rising edge of SCK: sample SD during Left slot bits 1..24
                        sck_reg <= '1';
                        if bit_cnt >= 1 and bit_cnt <= 24 then
                            next_sh   := shift_reg(22 downto 0) & sd_sync2;
                            shift_reg <= next_sh;
                            if bit_cnt = 24 then
                                sample_data <= next_sh(23 downto 8);
                                sample_push <= '1';
                            end if;
                        end if;
                    else
                        -- Falling edge of SCK: advance slot bit counter and update WS
                        sck_reg <= '0';
                        if bit_cnt = 63 then
                            next_b := (others => '0');
                        else
                            next_b := bit_cnt + 1;
                        end if;
                        bit_cnt <= next_b;
                        if next_b < 32 then
                            ws_reg <= '0'; -- Left channel
                        else
                            ws_reg <= '1'; -- Right channel
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- FIFO Pointer & Count Management
    ----------------------------------------------------------------------------
    ram_waddr <= wr_ptr;
    ram_wdata <= sample_data;
    ram_we    <= '1' when (sample_push = '1' and fifo_clr = '0' and fifo_count < FIFO_DEPTH) else '0';

    process (s_axi_aclk)
        variable do_push : boolean;
        variable do_pop  : boolean;
    begin
        if rising_edge(s_axi_aclk) then
            if s_axi_aresetn = '0' or fifo_clr = '1' then
                wr_ptr      <= (others => '0');
                rd_ptr      <= (others => '0');
                fifo_count  <= (others => '0');
                overrun_reg <= '0';
                total_cnt   <= (others => '0');
            else
                if sample_push = '1' then
                    total_cnt <= total_cnt + 1;
                end if;

                do_push := (sample_push = '1') and (fifo_count < FIFO_DEPTH);
                do_pop  := (pop_pulse = '1') and (fifo_count > 0);

                if (sample_push = '1') and (fifo_count = FIFO_DEPTH) and (not do_pop) then
                    overrun_reg <= '1';
                elsif (sample_push = '1') and (fifo_count = FIFO_DEPTH) and do_pop then
                    -- Simultaneous pop when full: allow overwrite/push or mark overrun conservatively
                    overrun_reg <= '1';
                end if;

                if do_push then
                    wr_ptr <= wr_ptr + 1;
                end if;
                if do_pop then
                    rd_ptr <= rd_ptr + 1;
                end if;

                if do_push and (not do_pop) then
                    fifo_count <= fifo_count + 1;
                elsif (not do_push) and do_pop then
                    fifo_count <= fifo_count - 1;
                end if;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- AXI4-Lite Write Channel (Accepts AW and W independently)
    ----------------------------------------------------------------------------
    process (s_axi_aclk)
    begin
        if rising_edge(s_axi_aclk) then
            fifo_clr  <= '0';
            awready_r <= '0';
            wready_r  <= '0';

            if s_axi_aresetn = '0' then
                aw_latched  <= '0';
                w_latched   <= '0';
                bvalid_r    <= '0';
                i2s_en      <= '0';
                lora_trig_r <= '0';
                leds_reg    <= (others => '0');
            else
                if bvalid_r = '0' then
                    if aw_latched = '0' and s_axi_awvalid = '1' then
                        aw_latched <= '1';
                        awaddr_reg <= s_axi_awaddr;
                        awready_r  <= '1';
                    end if;
                    if w_latched = '0' and s_axi_wvalid = '1' then
                        w_latched <= '1';
                        wdata_reg <= s_axi_wdata;
                        wready_r  <= '1';
                    end if;
                end if;

                -- Commit once both AW and W are latched
                if aw_latched = '1' and w_latched = '1' and bvalid_r = '0' then
                    case awaddr_reg(7 downto 2) is
                        when "000000" => -- 0x00 CTRL
                            i2s_en      <= wdata_reg(0);
                            fifo_clr    <= wdata_reg(1);
                            lora_trig_r <= wdata_reg(2);
                        when "000100" => -- 0x10 LEDS
                            leds_reg    <= wdata_reg(3 downto 0);
                        when others =>
                            null;
                    end case;
                    aw_latched <= '0';
                    w_latched  <= '0';
                    bvalid_r   <= '1';
                elsif bvalid_r = '1' and s_axi_bready = '1' then
                    bvalid_r <= '0';
                end if;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- AXI4-Lite Read Channel (2-Cycle Synchronous BRAM Access)
    ----------------------------------------------------------------------------
    ram_raddr <= rd_ptr;

    process (s_axi_aclk)
        variable status_v : std_logic_vector(31 downto 0);
        variable empty_f  : std_logic;
        variable full_f   : std_logic;
    begin
        if rising_edge(s_axi_aclk) then
            arready_r <= '0';
            pop_pulse <= '0';

            if s_axi_aresetn = '0' then
                rd_state     <= RD_IDLE;
                rvalid_r     <= '0';
                rdata_r      <= (others => '0');
                araddr_reg   <= (others => '0');
                pop_nonempty <= '0';
            else
                case rd_state is
                    when RD_IDLE =>
                        if s_axi_arvalid = '1' then
                            arready_r  <= '1';
                            araddr_reg <= s_axi_araddr;
                            if s_axi_araddr(7 downto 2) = "000011" then -- 0x0C DATA
                                if fifo_count > 0 then
                                    pop_nonempty <= '1';
                                    pop_pulse    <= '1'; -- Advance rd_ptr AFTER ram_raddr sampled this cycle!
                                else
                                    pop_nonempty <= '0';
                                end if;
                                rd_state <= RD_BRAM_WAIT;
                            else
                                rd_state <= RD_BRAM_WAIT;
                            end if;
                        end if;

                    when RD_BRAM_WAIT =>
                        -- Cycle in which ram_rdata holds fifo_ram(old rd_ptr)
                        if fifo_count = 0 then
                            empty_f := '1';
                        else
                            empty_f := '0';
                        end if;
                        if fifo_count = FIFO_DEPTH then
                            full_f := '1';
                        else
                            full_f := '0';
                        end if;

                        case araddr_reg(7 downto 2) is
                            when "000000" => -- 0x00 CTRL
                                rdata_r <= (0 => i2s_en, 2 => lora_trig_r, others => '0');
                            when "000001" => -- 0x04 STATUS
                                status_v := (others => '0');
                                status_v(0) := overrun_reg;
                                status_v(1) := empty_f;
                                status_v(2) := full_f;
                                status_v(5 downto 4) := sw_sync2;
                                rdata_r <= status_v;
                            when "000010" => -- 0x08 LEVEL
                                rdata_r <= std_logic_vector(resize(fifo_count, 32));
                            when "000011" => -- 0x0C DATA
                                if pop_nonempty = '1' then
                                    rdata_r <= std_logic_vector(resize(signed(ram_rdata), 32));
                                else
                                    rdata_r <= (others => '0');
                                end if;
                            when "000100" => -- 0x10 LEDS
                                rdata_r <= X"0000000" & leds_reg;
                            when "000101" => -- 0x14 ID
                                rdata_r <= X"12250001";
                            when "000110" => -- 0x18 TOTAL
                                rdata_r <= std_logic_vector(total_cnt);
                            when others =>
                                rdata_r <= (others => '0');
                        end case;
                        rvalid_r <= '1';
                        rd_state <= RD_RESP;

                    when RD_RESP =>
                        if s_axi_rready = '1' then
                            rvalid_r <= '0';
                            rd_state <= RD_IDLE;
                        end if;
                end case;
            end if;
        end if;
    end process;

end architecture rtl;
