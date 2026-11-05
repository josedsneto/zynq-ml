--------------------------------------------------------------------------------
-- File: tb_axi_uart.vhd
-- Description: Self-checking testbench for axi_uart (AXI4-Lite UART Core)
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_axi_uart is
end entity tb_axi_uart;

architecture sim of tb_axi_uart is

    constant CLK_PERIOD : time := 10 ns; -- 100 MHz clock
    signal clk          : std_logic := '0';
    signal rst_n        : std_logic := '0';

    -- AXI signals
    signal s_axi_awaddr  : std_logic_vector(3 downto 0) := (others => '0');
    signal s_axi_awprot  : std_logic_vector(2 downto 0) := (others => '0');
    signal s_axi_awvalid : std_logic := '0';
    signal s_axi_awready : std_logic;

    signal s_axi_wdata   : std_logic_vector(31 downto 0) := (others => '0');
    signal s_axi_wstrb   : std_logic_vector(3 downto 0) := "1111";
    signal s_axi_wvalid  : std_logic := '0';
    signal s_axi_wready  : std_logic;

    signal s_axi_bresp   : std_logic_vector(1 downto 0);
    signal s_axi_bvalid  : std_logic;
    signal s_axi_bready  : std_logic := '0';

    signal s_axi_araddr  : std_logic_vector(3 downto 0) := (others => '0');
    signal s_axi_arprot  : std_logic_vector(2 downto 0) := (others => '0');
    signal s_axi_arvalid : std_logic := '0';
    signal s_axi_arready : std_logic;

    signal s_axi_rdata   : std_logic_vector(31 downto 0);
    signal s_axi_rresp   : std_logic_vector(1 downto 0);
    signal s_axi_rvalid  : std_logic;
    signal s_axi_rready  : std_logic := '0';

    signal uart_rxd      : std_logic := '1';
    signal uart_txd      : std_logic;

    -- Helper procedure: AXI-Lite Write
    procedure axi_write(
        addr : in std_logic_vector(3 downto 0);
        data : in std_logic_vector(31 downto 0);
        signal awaddr  : out std_logic_vector(3 downto 0);
        signal awvalid : out std_logic;
        signal awready : in  std_logic;
        signal wdata   : out std_logic_vector(31 downto 0);
        signal wvalid  : out std_logic;
        signal wready  : in  std_logic;
        signal bvalid  : in  std_logic;
        signal bready  : out std_logic
    ) is
    begin
        wait until rising_edge(clk);
        awaddr  <= addr;
        awvalid <= '1';
        wdata   <= data;
        wvalid  <= '1';
        bready  <= '1';

        wait until rising_edge(clk) and awready = '1' and wready = '1';
        awvalid <= '0';
        wvalid  <= '0';

        wait until rising_edge(clk) and bvalid = '1';
        bready  <= '0';
    end procedure;

    -- Helper procedure: AXI-Lite Read
    procedure axi_read(
        addr : in  std_logic_vector(3 downto 0);
        data : out std_logic_vector(31 downto 0);
        signal araddr  : out std_logic_vector(3 downto 0);
        signal arvalid : out std_logic;
        signal arready : in  std_logic;
        signal rdata   : in  std_logic_vector(31 downto 0);
        signal rvalid  : in  std_logic;
        signal rready  : out std_logic
    ) is
    begin
        wait until rising_edge(clk);
        araddr  <= addr;
        arvalid <= '1';
        rready  <= '1';

        wait until rising_edge(clk) and arready = '1';
        arvalid <= '0';

        wait until rising_edge(clk) and rvalid = '1';
        data    := rdata;
        rready  <= '0';
    end procedure;

begin

    -- Clock generation
    clk_process: process
    begin
        clk <= '0';
        wait for CLK_PERIOD / 2;
        clk <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- Device Under Test
    dut: entity work.axi_uart
        generic map (
            C_S_AXI_DATA_WIDTH => 32,
            C_S_AXI_ADDR_WIDTH => 4,
            CLK_FREQ_HZ        => 100_000_000,
            DEFAULT_BAUD       => 230_400
        )
        port map (
            s_axi_aclk    => clk,
            s_axi_aresetn => rst_n,
            s_axi_awaddr  => s_axi_awaddr,
            s_axi_awprot  => s_axi_awprot,
            s_axi_awvalid => s_axi_awvalid,
            s_axi_awready => s_axi_awready,
            s_axi_wdata   => s_axi_wdata,
            s_axi_wstrb   => s_axi_wstrb,
            s_axi_wvalid  => s_axi_wvalid,
            s_axi_wready  => s_axi_wready,
            s_axi_bresp   => s_axi_bresp,
            s_axi_bvalid  => s_axi_bvalid,
            s_axi_bready  => s_axi_bready,
            s_axi_araddr  => s_axi_araddr,
            s_axi_arprot  => s_axi_arprot,
            s_axi_arvalid => s_axi_arvalid,
            s_axi_arready => s_axi_arready,
            s_axi_rdata   => s_axi_rdata,
            s_axi_rresp   => s_axi_rresp,
            s_axi_rvalid  => s_axi_rvalid,
            s_axi_rready  => s_axi_rready,
            uart_rxd      => uart_rxd,
            uart_txd      => uart_txd
        );

    -- Simulation stimulus
    stim_proc: process
        variable read_val : std_logic_vector(31 downto 0);
    begin
        -- Reset sequence
        rst_n <= '0';
        wait for 100 ns;
        rst_n <= '1';
        wait for 50 ns;

        -- 1. Read default baud rate divisor (offset 0x0C)
        axi_read("1100", read_val, s_axi_araddr, s_axi_arvalid, s_axi_arready, s_axi_rdata, s_axi_rvalid, s_axi_rready);
        report "Default Baud Divisor read: " & integer'image(to_integer(unsigned(read_val(15 downto 0))));

        -- 2. Configure smaller divisor (div=2) for fast testbench simulation
        axi_write("1100", X"00000002", s_axi_awaddr, s_axi_awvalid, s_axi_awready, s_axi_wdata, s_axi_wvalid, s_axi_wready, s_axi_bvalid, s_axi_bready);

        -- 3. Enable Loopback Mode (CTRL_REG bit 1 = '1', offset 0x08)
        axi_write("1000", X"00000002", s_axi_awaddr, s_axi_awvalid, s_axi_awready, s_axi_wdata, s_axi_wvalid, s_axi_wready, s_axi_bvalid, s_axi_bready);

        -- 4. Transmit byte 0x55 (offset 0x00)
        axi_write("0000", X"00000055", s_axi_awaddr, s_axi_awvalid, s_axi_awready, s_axi_wdata, s_axi_wvalid, s_axi_wready, s_axi_bvalid, s_axi_bready);

        -- 5. Poll status register until RX_VALID (bit 1) is high
        loop
            axi_read("0100", read_val, s_axi_araddr, s_axi_arvalid, s_axi_arready, s_axi_rdata, s_axi_rvalid, s_axi_rready);
            exit when read_val(1) = '1';
            wait for 200 ns;
        end loop;

        -- 6. Read received data (offset 0x00)
        axi_read("0000", read_val, s_axi_araddr, s_axi_arvalid, s_axi_arready, s_axi_rdata, s_axi_rvalid, s_axi_rready);
        assert read_val(7 downto 0) = X"55"
            report "Loopback verification FAILED! Expected 0x55" severity error;

        report "SUCCESS: Loopback test verified successfully!" severity note;

        wait for 1 us;
        wait;
    end process;

end architecture sim;
