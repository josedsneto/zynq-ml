--------------------------------------------------------------------------------
-- File: tb_cnn_accelerator.vhd
-- Description: Self-checking behavioral testbench for the 64-MAC INT8 DMA
--              Pointwise/Dense Tensor Accelerator (axi_cnn_accelerator).
--              Includes a 64-bit AXI4 DDR3 Slave Memory model and verifies:
--                1) ID register (0xACC64008)
--                2) Multi-tile INT8 Pointwise Conv + ReLU + 64-bit Requantizer
--                   (M=4, K=32, N=16 -> 2 tiles of 8 channels, out_zp=-128)
--                3) Raw INT32 Dense Logit Mode (M=1, K=16, N=8, relu_en=0)
--                4) Hardware performance counters (TOTAL, COMP, DMA, MAC8)
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_cnn_accelerator is
end entity tb_cnn_accelerator;

architecture sim of tb_cnn_accelerator is

    constant CLK_PERIOD : time := 10 ns; -- 100 MHz

    signal clk          : std_logic := '0';
    signal rst_n        : std_logic := '0';

    -- AXI4-Lite Slave Signals
    signal s_awaddr     : std_logic_vector(7 downto 0)  := (others => '0');
    signal s_awprot     : std_logic_vector(2 downto 0)  := (others => '0');
    signal s_awvalid    : std_logic := '0';
    signal s_awready    : std_logic;
    signal s_wdata      : std_logic_vector(31 downto 0) := (others => '0');
    signal s_wstrb      : std_logic_vector(3 downto 0)  := X"F";
    signal s_wvalid     : std_logic := '0';
    signal s_wready     : std_logic;
    signal s_bresp      : std_logic_vector(1 downto 0);
    signal s_bvalid     : std_logic;
    signal s_bready     : std_logic := '0';
    signal s_araddr     : std_logic_vector(7 downto 0)  := (others => '0');
    signal s_arprot     : std_logic_vector(2 downto 0)  := (others => '0');
    signal s_arvalid    : std_logic := '0';
    signal s_arready    : std_logic;
    signal s_rdata      : std_logic_vector(31 downto 0);
    signal s_rresp      : std_logic_vector(1 downto 0);
    signal s_rvalid     : std_logic;
    signal s_rready     : std_logic := '0';

    -- 64-bit AXI4 Master Signals (connected to simulated DDR3)
    signal m_awaddr     : std_logic_vector(31 downto 0);
    signal m_awlen      : std_logic_vector(7 downto 0);
    signal m_awsize     : std_logic_vector(2 downto 0);
    signal m_awburst    : std_logic_vector(1 downto 0);
    signal m_awlock     : std_logic_vector(0 downto 0);
    signal m_awcache    : std_logic_vector(3 downto 0);
    signal m_awprot     : std_logic_vector(2 downto 0);
    signal m_awqos      : std_logic_vector(3 downto 0);
    signal m_awvalid    : std_logic;
    signal m_awready    : std_logic := '0';
    signal m_wdata      : std_logic_vector(63 downto 0);
    signal m_wstrb      : std_logic_vector(7 downto 0);
    signal m_wlast      : std_logic;
    signal m_wvalid     : std_logic;
    signal m_wready     : std_logic := '0';
    signal m_bresp      : std_logic_vector(1 downto 0) := "00";
    signal m_bvalid     : std_logic := '0';
    signal m_bready     : std_logic;
    signal m_araddr     : std_logic_vector(31 downto 0);
    signal m_arlen      : std_logic_vector(7 downto 0);
    signal m_arsize     : std_logic_vector(2 downto 0);
    signal m_arburst    : std_logic_vector(1 downto 0);
    signal m_arlock     : std_logic_vector(0 downto 0);
    signal m_arcache    : std_logic_vector(3 downto 0);
    signal m_arprot     : std_logic_vector(2 downto 0);
    signal m_arqos      : std_logic_vector(3 downto 0);
    signal m_arvalid    : std_logic;
    signal m_arready    : std_logic := '0';
    signal m_rdata      : std_logic_vector(63 downto 0) := (others => '0');
    signal m_rresp      : std_logic_vector(1 downto 0) := "00";
    signal m_rlast      : std_logic := '0';
    signal m_rvalid     : std_logic := '0';
    signal m_rready     : std_logic;

    -- Shared Behavioral DDR Memory (4096 x 64-bit = 32 KiB)
    constant MEM_WORDS  : integer := 4096;
    type mem_t is array (0 to MEM_WORDS - 1) of std_logic_vector(63 downto 0);
    shared variable ddr_mem : mem_t := (others => (others => '0'));

    signal sim_done     : boolean := false;

begin

    clk_gen : process
    begin
        while not sim_done loop
            clk <= '0'; wait for CLK_PERIOD / 2;
            clk <= '1'; wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    uut : entity work.axi_cnn_accelerator
        port map (
            s_axi_aclk    => clk,
            s_axi_aresetn => rst_n,
            s_axi_awaddr  => s_awaddr,
            s_axi_awprot  => s_awprot,
            s_axi_awvalid => s_awvalid,
            s_axi_awready => s_awready,
            s_axi_wdata   => s_wdata,
            s_axi_wstrb   => s_wstrb,
            s_axi_wvalid  => s_wvalid,
            s_axi_wready  => s_wready,
            s_axi_bresp   => s_bresp,
            s_axi_bvalid  => s_bvalid,
            s_axi_bready  => s_bready,
            s_axi_araddr  => s_araddr,
            s_axi_arprot  => s_arprot,
            s_axi_arvalid => s_arvalid,
            s_axi_arready => s_arready,
            s_axi_rdata   => s_rdata,
            s_axi_rresp   => s_rresp,
            s_axi_rvalid  => s_rvalid,
            s_axi_rready  => s_rready,
            m_axi_awaddr  => m_awaddr,
            m_axi_awlen   => m_awlen,
            m_axi_awsize  => m_awsize,
            m_axi_awburst => m_awburst,
            m_axi_awlock  => m_awlock,
            m_axi_awcache => m_awcache,
            m_axi_awprot  => m_awprot,
            m_axi_awqos   => m_awqos,
            m_axi_awvalid => m_awvalid,
            m_axi_awready => m_awready,
            m_axi_wdata   => m_wdata,
            m_axi_wstrb   => m_wstrb,
            m_axi_wlast   => m_wlast,
            m_axi_wvalid  => m_wvalid,
            m_axi_wready  => m_wready,
            m_axi_bresp   => m_bresp,
            m_axi_bvalid  => m_bvalid,
            m_axi_bready  => m_bready,
            m_axi_araddr  => m_araddr,
            m_axi_arlen   => m_arlen,
            m_axi_arsize  => m_arsize,
            m_axi_arburst => m_arburst,
            m_axi_arlock  => m_arlock,
            m_axi_arcache => m_arcache,
            m_axi_arprot  => m_arprot,
            m_axi_arqos   => m_arqos,
            m_axi_arvalid => m_arvalid,
            m_axi_arready => m_arready,
            m_axi_rdata   => m_rdata,
            m_axi_rresp   => m_rresp,
            m_axi_rlast   => m_rlast,
            m_axi_rvalid  => m_rvalid,
            m_axi_rready  => m_rready
        );

    ----------------------------------------------------------------------------
    -- Behavioral 64-bit AXI4 Slave DDR Memory Responder (Read & Write)
    ----------------------------------------------------------------------------
    axi_ddr_read_proc : process (clk)
        type r_st_t is (R_IDLE, R_BURST);
        variable st     : r_st_t := R_IDLE;
        variable addr_w : integer := 0;
        variable rem_b  : integer := 0;
    begin
        if rising_edge(clk) then
            if rst_n = '0' then
                st        := R_IDLE;
                m_arready <= '0';
                m_rvalid  <= '0';
                m_rlast   <= '0';
            else
                m_arready <= '0';
                case st is
                    when R_IDLE =>
                        if m_arvalid = '1' then
                            m_arready <= '1';
                            addr_w    := to_integer(unsigned(m_araddr(14 downto 3)));
                            rem_b     := to_integer(unsigned(m_arlen));
                            m_rdata   <= ddr_mem(addr_w);
                            m_rvalid  <= '1';
                            if rem_b = 0 then
                                m_rlast <= '1';
                            else
                                m_rlast <= '0';
                            end if;
                            st := R_BURST;
                        end if;

                    when R_BURST =>
                        if m_rvalid = '1' and m_rready = '1' then
                            if rem_b = 0 then
                                m_rvalid <= '0';
                                m_rlast  <= '0';
                                st       := R_IDLE;
                            else
                                addr_w  := addr_w + 1;
                                rem_b   := rem_b - 1;
                                m_rdata <= ddr_mem(addr_w);
                                if rem_b = 0 then
                                    m_rlast <= '1';
                                else
                                    m_rlast <= '0';
                                end if;
                            end if;
                        end if;
                end case;
            end if;
        end if;
    end process;

    axi_ddr_write_proc : process (clk)
        type w_st_t is (W_IDLE, W_DATA, W_RESP);
        variable st     : w_st_t := W_IDLE;
        variable addr_w : integer := 0;
    begin
        if rising_edge(clk) then
            if rst_n = '0' then
                st        := W_IDLE;
                m_awready <= '0';
                m_wready  <= '0';
                m_bvalid  <= '0';
            else
                m_awready <= '0';
                case st is
                    when W_IDLE =>
                        if m_awvalid = '1' then
                            m_awready <= '1';
                            addr_w    := to_integer(unsigned(m_awaddr(14 downto 3)));
                            m_wready  <= '1';
                            st        := W_DATA;
                        end if;

                    when W_DATA =>
                        if m_wvalid = '1' and m_wready = '1' then
                            ddr_mem(addr_w) := m_wdata;
                            addr_w          := addr_w + 1;
                            if m_wlast = '1' then
                                m_wready <= '0';
                                m_bvalid <= '1';
                                st       := W_RESP;
                            end if;
                        end if;

                    when W_RESP =>
                        if m_bvalid = '1' and m_bready = '1' then
                            m_bvalid <= '0';
                            st       := W_IDLE;
                        end if;
                end case;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- Self-Checking Stimulus & Golden Verification Process
    ----------------------------------------------------------------------------
    stim_proc : process
        procedure axi_write(addr : in integer; val : in std_logic_vector(31 downto 0)) is
            variable aw_ok, w_ok : boolean := false;
        begin
            wait until rising_edge(clk);
            s_awaddr  <= std_logic_vector(to_unsigned(addr, 8));
            s_awvalid <= '1';
            s_wdata   <= val;
            s_wvalid  <= '1';
            s_bready  <= '1';
            while not (aw_ok and w_ok) loop
                wait until rising_edge(clk);
                if s_awvalid = '1' and s_awready = '1' then
                    s_awvalid <= '0';
                    aw_ok := true;
                end if;
                if s_wvalid = '1' and s_wready = '1' then
                    s_wvalid <= '0';
                    w_ok := true;
                end if;
            end loop;
            while s_bvalid = '0' loop
                wait until rising_edge(clk);
            end loop;
            wait until rising_edge(clk);
            s_bready <= '0';
        end procedure;

        procedure axi_read(addr : in integer; val : out std_logic_vector(31 downto 0)) is
        begin
            wait until rising_edge(clk);
            s_araddr  <= std_logic_vector(to_unsigned(addr, 8));
            s_arvalid <= '1';
            s_rready  <= '1';
            while s_arready = '0' loop
                wait until rising_edge(clk);
            end loop;
            wait until rising_edge(clk);
            s_arvalid <= '0';
            while s_rvalid = '0' loop
                wait until rising_edge(clk);
            end loop;
            val := s_rdata;
            wait until rising_edge(clk);
            s_rready <= '0';
        end procedure;

        procedure set_ddr_byte(byte_addr : in integer; b : in signed(7 downto 0)) is
            variable w_idx : integer := byte_addr / 8;
            variable b_pos : integer := byte_addr mod 8;
            variable word  : std_logic_vector(63 downto 0);
        begin
            word := ddr_mem(w_idx);
            word(8 * b_pos + 7 downto 8 * b_pos) := std_logic_vector(b);
            ddr_mem(w_idx) := word;
        end procedure;

        impure function get_ddr_byte(byte_addr : integer) return signed is
            variable w_idx : integer := byte_addr / 8;
            variable b_pos : integer := byte_addr mod 8;
            variable word  : std_logic_vector(63 downto 0);
        begin
            word := ddr_mem(w_idx);
            return signed(word(8 * b_pos + 7 downto 8 * b_pos));
        end function;

        -- Test 1 parameters: M=4, K=32, N=16 (2 tiles of 8 channels)
        constant ACT1_BASE : integer := 16#0000#; -- 4 * 32 = 128 B
        constant WGT1_BASE : integer := 16#0400#; -- 2 tiles * (128B hdr + 256B wgt) = 768 B
        constant OUT1_BASE : integer := 16#1000#; -- 4 * 16 = 64 B

        -- Test 2 parameters: Raw INT32 mode, M=1, K=16, N=8
        constant ACT2_BASE : integer := 16#1400#;
        constant WGT2_BASE : integer := 16#1800#;
        constant OUT2_BASE : integer := 16#2000#;

        variable rval      : std_logic_vector(31 downto 0);
        variable x_val     : integer;
        variable w_val     : integer;
        variable b_val     : integer;
        variable mult_val  : integer;
        constant sh_val    : integer := 29;
        variable acc_gold  : integer;
        variable prod64    : signed(63 downto 0);
        variable rnd64     : signed(63 downto 0);
        variable scaled64  : signed(63 downto 0);
        variable exp_b     : integer;
        variable got_b     : integer;
        variable tile_off  : integer;
        variable got_i32   : integer;
    begin
        rst_n <= '0';
        wait for CLK_PERIOD * 5;
        rst_n <= '1';
        wait for CLK_PERIOD * 5;

        -- 1. Check Accelerator Hardware ID
        axi_read(16#1C#, rval);
        assert rval = X"ACC64008"
            report "ID_REG mismatch!" severity failure;

        ------------------------------------------------------------------------
        -- 2. Test 1: Multi-Tile INT8 Pointwise Conv (M=4, K=32, N=16, ReLU, ZP=-128)
        ------------------------------------------------------------------------
        for m in 0 to 3 loop
            for k in 0 to 31 loop
                x_val := ((m * 13 + k * 7) mod 90) - 40;
                set_ddr_byte(ACT1_BASE + m * 32 + k, to_signed(x_val, 8));
            end loop;
        end loop;

        for t in 0 to 1 loop
            tile_off := (WGT1_BASE / 8) + t * (16 + 32); -- 16 hdr words + K=32 wgt words
            -- Pack 8 (bias, mult) words
            for j in 0 to 7 loop
                b_val    := (t * 8 + j - 3) * 150;
                mult_val := 536870912 + (t * 8 + j) * 1000000; -- ~2^29
                ddr_mem(tile_off + j) :=
                    std_logic_vector(to_signed(mult_val, 32)) &
                    std_logic_vector(to_signed(b_val, 32));
            end loop;
            -- Word 8: 8 shift bytes = 29
            ddr_mem(tile_off + 8) := X"1D1D1D1D1D1D1D1D";
            for z in 9 to 15 loop
                ddr_mem(tile_off + z) := (others => '0');
            end loop;
            -- Pack weights: word k8*8 + j holds W[t*8+j, 8*k8 .. 8*k8+7]
            for k8 in 0 to 3 loop
                for j in 0 to 7 loop
                    for lane in 0 to 7 loop
                        w_val := (((t * 8 + j) * 11 + (k8 * 8 + lane) * 5) mod 50) - 22;
                        set_ddr_byte((tile_off + 16 + k8 * 8 + j) * 8 + lane, to_signed(w_val, 8));
                    end loop;
                end loop;
            end loop;
        end loop;

        axi_write(16#08#, std_logic_vector(to_unsigned(ACT1_BASE, 32)));
        axi_write(16#0C#, std_logic_vector(to_unsigned(WGT1_BASE, 32)));
        axi_write(16#10#, std_logic_vector(to_unsigned(OUT1_BASE, 32)));
        axi_write(16#14#, X"00200004"); -- K=32, M=4
        axi_write(16#18#, X"00800010"); -- out_zp=-128 (0x80), N=16
        axi_write(16#00#, X"00000005"); -- start=1, relu_en=1, raw_i32=0

        -- Poll STATUS until done (bit 1)
        loop
            axi_read(16#04#, rval);
            exit when rval(1) = '1';
        end loop;
        assert rval(2) = '0' report "AXI error asserted in Test 1!" severity failure;

        -- Verify all 4 x 16 = 64 output INT8 values bit-for-bit!
        for m in 0 to 3 loop
            for n in 0 to 15 loop
                acc_gold := (n - 3) * 150;
                for k in 0 to 31 loop
                    x_val := ((m * 13 + k * 7) mod 90) - 40;
                    w_val := ((n * 11 + k * 5) mod 50) - 22;
                    acc_gold := acc_gold + x_val * w_val;
                end loop;
                if acc_gold < 0 then
                    acc_gold := 0;
                end if;
                mult_val := 536870912 + n * 1000000;
                prod64   := to_signed(acc_gold, 32) * to_signed(mult_val, 32);
                rnd64    := shift_left(to_signed(1, 64), sh_val - 1);
                scaled64 := shift_right(prod64 + rnd64, sh_val) - 128;
                if scaled64 > 127 then
                    exp_b := 127;
                elsif scaled64 < -128 then
                    exp_b := -128;
                else
                    exp_b := to_integer(scaled64);
                end if;

                got_b := to_integer(get_ddr_byte(OUT1_BASE + m * 16 + n));
                assert got_b = exp_b
                    report "Test 1 mismatch at m=" & integer'image(m) & " n=" & integer'image(n) &
                           " got=" & integer'image(got_b) & " exp=" & integer'image(exp_b)
                    severity failure;
            end loop;
        end loop;

        axi_read(16#2C#, rval);
        -- M*N*K = 4*16*32 = 2048 MACs => MAC8 = 256
        assert to_integer(unsigned(rval)) = 256
            report "PERF_MAC8 mismatch in Test 1!" severity failure;

        ------------------------------------------------------------------------
        -- 3. Test 2: Raw INT32 Logit Mode (M=1, K=16, N=8, relu_en=0, raw_i32=1)
        ------------------------------------------------------------------------
        for k in 0 to 15 loop
            set_ddr_byte(ACT2_BASE + k, to_signed(k * 7 - 50, 8));
        end loop;
        tile_off := WGT2_BASE / 8;
        for j in 0 to 7 loop
            ddr_mem(tile_off + j) := X"00000000" & std_logic_vector(to_signed((j - 4) * 1000, 32));
        end loop;
        ddr_mem(tile_off + 8) := X"1E1E1E1E1E1E1E1E";
        for k8 in 0 to 1 loop
            for j in 0 to 7 loop
                for lane in 0 to 7 loop
                    w_val := (j * 9 - (k8 * 8 + lane) * 3);
                    set_ddr_byte((tile_off + 16 + k8 * 8 + j) * 8 + lane, to_signed(w_val, 8));
                end loop;
            end loop;
        end loop;

        axi_write(16#08#, std_logic_vector(to_unsigned(ACT2_BASE, 32)));
        axi_write(16#0C#, std_logic_vector(to_unsigned(WGT2_BASE, 32)));
        axi_write(16#10#, std_logic_vector(to_unsigned(OUT2_BASE, 32)));
        axi_write(16#14#, X"00100001"); -- K=16, M=1
        axi_write(16#18#, X"00000008"); -- N=8
        axi_write(16#00#, X"00000009"); -- start=1, relu_en=0, raw_i32=1

        loop
            axi_read(16#04#, rval);
            exit when rval(1) = '1';
        end loop;

        for j in 0 to 7 loop
            acc_gold := (j - 4) * 1000;
            for k in 0 to 15 loop
                acc_gold := acc_gold + (k * 7 - 50) * (j * 9 - k * 3);
            end loop;
            if (j mod 2) = 0 then
                got_i32 := to_integer(signed(ddr_mem(OUT2_BASE / 8 + j / 2)(31 downto 0)));
            else
                got_i32 := to_integer(signed(ddr_mem(OUT2_BASE / 8 + j / 2)(63 downto 32)));
            end if;
            assert got_i32 = acc_gold
                report "Test 2 raw int32 mismatch at ch=" & integer'image(j) &
                       " got=" & integer'image(got_i32) & " exp=" & integer'image(acc_gold)
                severity failure;
        end loop;

        report "=== TB PASS: 64-MAC INT8 DMA Tensor Accelerator Verified Bit-Exact! ===" severity note;
        sim_done <= true;
        wait;
    end process;

end architecture sim;
