--------------------------------------------------------------------------------
-- File: tb_axi_i2s_rx.vhd
-- Description: Self-checking testbench for axi_i2s_rx (INMP441 I2S Master RX,
--              BRAM FIFO, LoRa trigger GPIO, switches & LEDs).
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_axi_i2s_rx is
end entity tb_axi_i2s_rx;

architecture sim of tb_axi_i2s_rx is

    constant CLK_PERIOD : time := 10 ns; -- 100 MHz

    signal clk          : std_logic := '0';
    signal rst_n        : std_logic := '0';

    signal awaddr       : std_logic_vector(7 downto 0)  := (others => '0');
    signal awprot       : std_logic_vector(2 downto 0)  := (others => '0');
    signal awvalid      : std_logic := '0';
    signal awready      : std_logic;
    signal wdata        : std_logic_vector(31 downto 0) := (others => '0');
    signal wstrb        : std_logic_vector(3 downto 0)  := X"F";
    signal wvalid       : std_logic := '0';
    signal wready       : std_logic;
    signal bresp        : std_logic_vector(1 downto 0);
    signal bvalid       : std_logic;
    signal bready       : std_logic := '0';
    signal araddr       : std_logic_vector(7 downto 0)  := (others => '0');
    signal arprot       : std_logic_vector(2 downto 0)  := (others => '0');
    signal arvalid      : std_logic := '0';
    signal arready      : std_logic;
    signal rdata        : std_logic_vector(31 downto 0);
    signal rresp        : std_logic_vector(1 downto 0);
    signal rvalid       : std_logic;
    signal rready       : std_logic := '0';

    signal i2s_sck      : std_logic;
    signal i2s_ws       : std_logic;
    signal i2s_sd       : std_logic := '0';
    signal i2s_lr_sel   : std_logic;
    signal lora_trig_o  : std_logic;
    signal switches_i   : std_logic_vector(1 downto 0) := "10";
    signal leds_o       : std_logic_vector(3 downto 0);

    signal sim_done     : boolean := false;

    function sample_pattern(idx : integer) return signed is
    begin
        -- Deterministic signed 16-bit ramp with alternating sign
        if (idx mod 2) = 0 then
            return to_signed(1000 + idx * 257, 16);
        else
            return to_signed(-2000 - idx * 131, 16);
        end if;
    end function;

begin

    clk_gen : process
    begin
        while not sim_done loop
            clk <= '0'; wait for CLK_PERIOD / 2;
            clk <= '1'; wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Use fast FS_HZ = 250000 in TB (still fractional NCO!) & FIFO_ADDR_W = 3 (depth 8)
    -- so we verify 12+ frames + FIFO overrun in < 80 us of sim time!
    uut : entity work.axi_i2s_rx
        generic map (
            CLK_HZ      => 100000000,
            FS_HZ       => 250000,
            FIFO_ADDR_W => 3
        )
        port map (
            s_axi_aclk    => clk,
            s_axi_aresetn => rst_n,
            s_axi_awaddr  => awaddr,
            s_axi_awprot  => awprot,
            s_axi_awvalid => awvalid,
            s_axi_awready => awready,
            s_axi_wdata   => wdata,
            s_axi_wstrb   => wstrb,
            s_axi_wvalid  => wvalid,
            s_axi_wready  => wready,
            s_axi_bresp   => bresp,
            s_axi_bvalid  => bvalid,
            s_axi_bready  => bready,
            s_axi_araddr  => araddr,
            s_axi_arprot  => arprot,
            s_axi_arvalid => arvalid,
            s_axi_arready => arready,
            s_axi_rdata   => rdata,
            s_axi_rresp   => rresp,
            s_axi_rvalid  => rvalid,
            s_axi_rready  => rready,
            i2s_sck       => i2s_sck,
            i2s_ws        => i2s_ws,
            i2s_sd        => i2s_sd,
            i2s_lr_sel    => i2s_lr_sel,
            lora_trig_o   => lora_trig_o,
            switches_i    => switches_i,
            leds_o        => leds_o
        );

    ----------------------------------------------------------------------------
    -- Behavioral INMP441 I2S Slave (drives 24-bit Left-slot data on SCK falling)
    ----------------------------------------------------------------------------
    inmp441_model : process
        variable prev_ws    : std_logic := '0';
        variable slot_bit   : integer   := -1;
        variable frame_idx  : integer   := 0;
        variable word24     : std_logic_vector(23 downto 0) := (others => '0');
        variable in_left    : boolean   := false;
    begin
        wait until rst_n = '1';
        -- Wait for I2S enable (first SCK rising edge)
        wait until rising_edge(i2s_sck);
        -- At startup, core begins at bit_cnt=0 with ws='0' (Left slot MSB delay slot!).
        in_left   := (i2s_ws = '0');
        prev_ws   := i2s_ws;
        word24    := std_logic_vector(sample_pattern(0)) & X"A5";
        slot_bit  := 24;

        while not sim_done loop
            wait until falling_edge(i2s_sck);
            wait for 1 ns; -- allow ws_reg update after SCK falling edge
            if i2s_ws /= prev_ws then
                prev_ws := i2s_ws;
                if i2s_ws = '0' then
                    -- Just entered Left slot (bit_cnt=0): next rising SCK is 1-clk delay!
                    in_left  := true;
                    slot_bit := 24; -- 24 = delay slot, 23..0 = MSB..LSB
                    word24   := std_logic_vector(sample_pattern(frame_idx)) & X"5A";
                else
                    in_left   := false;
                    frame_idx := frame_idx + 1;
                    i2s_sd    <= '1'; -- junk on right channel (must be ignored!)
                end if;
            end if;

            if in_left then
                if slot_bit = 24 then
                    i2s_sd   <= '0';
                    slot_bit := 23;
                elsif slot_bit >= 0 then
                    i2s_sd   <= word24(slot_bit);
                    slot_bit := slot_bit - 1;
                else
                    i2s_sd <= '0';
                end if;
            end if;
        end loop;
        wait;
    end process;

    ----------------------------------------------------------------------------
    -- AXI4-Lite Verification Stimulus
    ----------------------------------------------------------------------------
    stim : process
        procedure axi_write(addr : in integer; val : in std_logic_vector(31 downto 0)) is
            variable aw_ok, w_ok : boolean := false;
        begin
            wait until rising_edge(clk);
            awaddr  <= std_logic_vector(to_unsigned(addr, 8));
            awvalid <= '1';
            wdata   <= val;
            wvalid  <= '1';
            bready  <= '1';
            while not (aw_ok and w_ok) loop
                wait until rising_edge(clk);
                if awvalid = '1' and awready = '1' then awvalid <= '0'; aw_ok := true; end if;
                if wvalid  = '1' and wready  = '1' then wvalid  <= '0'; w_ok  := true; end if;
            end loop;
            while bvalid = '0' loop wait until rising_edge(clk); end loop;
            wait until rising_edge(clk);
            bready <= '0';
        end procedure;

        procedure axi_read(addr : in integer; val : out std_logic_vector(31 downto 0)) is
        begin
            wait until rising_edge(clk);
            araddr  <= std_logic_vector(to_unsigned(addr, 8));
            arvalid <= '1';
            rready  <= '1';
            while arready = '0' loop wait until rising_edge(clk); end loop;
            wait until rising_edge(clk);
            arvalid <= '0';
            while rvalid = '0' loop wait until rising_edge(clk); end loop;
            val := rdata;
            wait until rising_edge(clk);
            rready <= '0';
        end procedure;

        variable rval : std_logic_vector(31 downto 0);
        variable exp  : integer;
        variable got  : integer;
    begin
        rst_n <= '0';
        wait for CLK_PERIOD * 5;
        rst_n <= '1';
        wait for CLK_PERIOD * 5;

        -- 1. Check ID & empty DATA read
        axi_read(16#14#, rval);
        assert rval = X"12250001" report "ID mismatch" severity failure;
        assert i2s_lr_sel = '0' report "i2s_lr_sel must be 0" severity failure;

        axi_read(16#0C#, rval);
        assert rval = X"00000000" report "Empty FIFO must return 0" severity failure;

        -- 2. Check LEDs, switches, and LoRa trigger GPIO
        axi_write(16#10#, X"0000000A");
        wait for CLK_PERIOD * 3;
        assert leds_o = "1010" report "LEDs mismatch" severity failure;

        axi_read(16#04#, rval);
        assert rval(5 downto 4) = "10" report "Switches mismatch" severity failure;

        -- 3. Enable I2S + lora_trig_o=1 and capture 5 samples (each 4 us @ 250 kHz)
        axi_write(16#00#, X"00000005");
        wait for CLK_PERIOD * 2;
        assert lora_trig_o = '1' report "lora_trig_o mismatch" severity failure;

        wait for 22 us;
        axi_read(16#08#, rval);
        assert to_integer(unsigned(rval)) >= 5 report "Expected >= 5 samples in FIFO" severity failure;

        for k in 0 to 4 loop
            axi_read(16#0C#, rval);
            got := to_integer(signed(rval));
            exp := to_integer(sample_pattern(k));
            assert got = exp
                report "I2S sample " & integer'image(k) & " mismatch: got=" &
                       integer'image(got) & " exp=" & integer'image(exp)
                severity failure;
        end loop;

        -- 4. Let FIFO (depth 8) overflow and check OVERRUN sticky flag + fifo_clear
        wait for 40 us;
        axi_read(16#04#, rval);
        assert rval(0) = '1' and rval(2) = '1'
            report "Expected OVERRUN=1 and FULL=1" severity failure;

        -- Clear FIFO
        axi_write(16#00#, X"00000002"); -- fifo_clear=1, enable=0
        wait for CLK_PERIOD * 4;
        axi_read(16#04#, rval);
        assert rval(0) = '0' and rval(1) = '1'
            report "Expected OVERRUN=0 and EMPTY=1 after fifo_clear" severity failure;

        report "=== TB PASS: INMP441 I2S Master Receiver + BRAM FIFO Verified! ===" severity note;
        sim_done <= true;
        wait;
    end process;

end architecture sim;
