--------------------------------------------------------------------------------
-- File: axi_uart.vhd
-- Description: AXI4-Lite Slave UART Peripheral for Xilinx Zynq-7000 PL
-- Interfaces:
--   - AXI4-Lite Slave (32-bit data, memory mapped from PS via M_AXI_GP0)
--   - External UART pins: uart_txd (output), uart_rxd (input)
-- Default Baud Rate: 230400 bps (assuming 100 MHz FCLK_CLK0)
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity axi_uart is
    generic (
        C_S_AXI_DATA_WIDTH : integer := 32;
        C_S_AXI_ADDR_WIDTH : integer := 4;
        CLK_FREQ_HZ        : natural := 100_000_000;
        DEFAULT_BAUD       : natural := 230_400
    );
    port (
        -- Global AXI Clock and Reset
        s_axi_aclk    : in  std_logic;
        s_axi_aresetn : in  std_logic;

        -- AXI Write Address Channel
        s_axi_awaddr  : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
        s_axi_awprot  : in  std_logic_vector(2 downto 0);
        s_axi_awvalid : in  std_logic;
        s_axi_awready : out std_logic;

        -- AXI Write Data Channel
        s_axi_wdata   : in  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        s_axi_wstrb   : in  std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
        s_axi_wvalid  : in  std_logic;
        s_axi_wready  : out std_logic;

        -- AXI Write Response Channel
        s_axi_bresp   : out std_logic_vector(1 downto 0);
        s_axi_bvalid  : out std_logic;
        s_axi_bready  : in  std_logic;

        -- AXI Read Address Channel
        s_axi_araddr  : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
        s_axi_arprot  : in  std_logic_vector(2 downto 0);
        s_axi_arvalid : in  std_logic;
        s_axi_arready : out std_logic;

        -- AXI Read Data Channel
        s_axi_rdata   : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        s_axi_rresp   : out std_logic_vector(1 downto 0);
        s_axi_rvalid  : out std_logic;
        s_axi_rready  : in  std_logic;

        -- External Physical UART Interface
        uart_rxd      : in  std_logic;
        uart_txd      : out std_logic
    );
end entity axi_uart;

architecture rtl of axi_uart is

    attribute X_INTERFACE_INFO      : string;
    attribute X_INTERFACE_PARAMETER : string;
    attribute X_INTERFACE_INFO of s_axi_aclk    : signal is "xilinx.com:signal:clock:1.0 s_axi_aclk CLK";
    attribute X_INTERFACE_PARAMETER of s_axi_aclk : signal is "ASSOCIATED_BUSIF s_axi, ASSOCIATED_RESET s_axi_aresetn";
    attribute X_INTERFACE_INFO of s_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 s_axi_aresetn RST";
    attribute X_INTERFACE_PARAMETER of s_axi_aresetn : signal is "POLARITY ACTIVE_LOW";

    -- Constant for default 16x oversampling divisor
    -- e.g. 100MHz / (16 * 230400) = 27
    constant C_DEFAULT_DIV16 : unsigned(15 downto 0) := 
        to_unsigned(CLK_FREQ_HZ / (16 * DEFAULT_BAUD), 16);

    -- Internal Registers
    -- Address 0x00: DATA_REG
    -- Address 0x04: STATUS_REG
    -- Address 0x08: CTRL_REG
    -- Address 0x0C: BAUD_DIV_REG
    signal reg_ctrl      : std_logic_vector(31 downto 0) := (others => '0');
    signal reg_baud_div  : unsigned(15 downto 0) := C_DEFAULT_DIV16;

    -- Baud Rate Generator Signals
    signal baud_cnt16    : unsigned(15 downto 0) := (others => '0');
    signal baud_tick_16  : std_logic := '0';
    signal tx_div_cnt    : unsigned(3 downto 0) := (others => '0');
    signal baud_tick_1x  : std_logic := '0';

    -- UART TX Signals
    signal tx_start      : std_logic := '0';
    signal tx_data       : std_logic_vector(7 downto 0) := (others => '0');
    signal tx_busy       : std_logic;
    signal tx_done       : std_logic;
    signal raw_txd       : std_logic;

    -- UART RX Signals
    signal rx_data       : std_logic_vector(7 downto 0);
    signal rx_valid_pulse: std_logic;
    signal rx_busy       : std_logic;
    signal rx_error      : std_logic;
    signal rx_data_latched: std_logic_vector(7 downto 0) := (others => '0');
    signal rx_data_avail : std_logic := '0';
    signal rx_error_reg  : std_logic := '0';
    signal raw_rxd       : std_logic;

    -- AXI Handshake Signals
    signal axi_awready   : std_logic := '0';
    signal axi_wready    : std_logic := '0';
    signal axi_bvalid    : std_logic := '0';
    signal axi_arready   : std_logic := '0';
    signal axi_rvalid    : std_logic := '0';
    signal axi_rdata     : std_logic_vector(31 downto 0) := (others => '0');

    signal aw_en         : std_logic := '1';
    signal axi_awaddr_reg: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');

begin

    s_axi_awready <= axi_awready;
    s_axi_wready  <= axi_wready;
    s_axi_bresp   <= "00"; -- OKAY response
    s_axi_bvalid  <= axi_bvalid;
    s_axi_arready <= axi_arready;
    s_axi_rdata   <= axi_rdata;
    s_axi_rresp   <= "00"; -- OKAY response
    s_axi_rvalid  <= axi_rvalid;

    -- Physical / Loopback Routing
    uart_txd <= raw_txd;
    -- reg_ctrl(1) = Loopback mode
    raw_rxd  <= raw_txd when (reg_ctrl(1) = '1') else uart_rxd;

    ----------------------------------------------------------------------------
    -- Baud Rate Generator (16x oversampling tick and 1x TX tick)
    ----------------------------------------------------------------------------
    process(s_axi_aclk)
    begin
        if rising_edge(s_axi_aclk) then
            if s_axi_aresetn = '0' then
                baud_cnt16   <= (others => '0');
                baud_tick_16 <= '0';
                tx_div_cnt   <= (others => '0');
                baud_tick_1x <= '0';
            else
                baud_tick_16 <= '0';
                baud_tick_1x <= '0';

                if baud_cnt16 >= (reg_baud_div - 1) then
                    baud_cnt16   <= (others => '0');
                    baud_tick_16 <= '1';

                    -- 16x divider for 1x TX baud tick
                    if tx_div_cnt = 15 then
                        tx_div_cnt   <= (others => '0');
                        baud_tick_1x <= '1';
                    else
                        tx_div_cnt <= tx_div_cnt + 1;
                    end if;
                else
                    baud_cnt16 <= baud_cnt16 + 1;
                end if;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- Instantiation of UART TX
    ----------------------------------------------------------------------------
    inst_uart_tx: entity work.uart_tx
        port map (
            clk       => s_axi_aclk,
            rst_n     => s_axi_aresetn,
            baud_tick => baud_tick_1x,
            tx_start  => tx_start,
            tx_data   => tx_data,
            txd       => raw_txd,
            tx_busy   => tx_busy,
            tx_done   => tx_done
        );

    ----------------------------------------------------------------------------
    -- Instantiation of UART RX
    ----------------------------------------------------------------------------
    inst_uart_rx: entity work.uart_rx
        port map (
            clk          => s_axi_aclk,
            rst_n        => s_axi_aresetn,
            baud_tick_16 => baud_tick_16,
            rxd          => raw_rxd,
            rx_data      => rx_data,
            rx_valid     => rx_valid_pulse,
            rx_busy      => rx_busy,
            rx_error     => rx_error
        );

    ----------------------------------------------------------------------------
    -- RX Latch & Status Tracking
    ----------------------------------------------------------------------------
    process(s_axi_aclk)
    begin
        if rising_edge(s_axi_aclk) then
            if s_axi_aresetn = '0' or reg_ctrl(0) = '1' then
                rx_data_latched <= (others => '0');
                rx_data_avail   <= '0';
                rx_error_reg    <= '0';
            else
                if rx_valid_pulse = '1' then
                    rx_data_latched <= rx_data;
                    rx_data_avail   <= '1';
                    rx_error_reg    <= rx_error;
                elsif (s_axi_arvalid = '1' and axi_arready = '1' and s_axi_araddr(3 downto 2) = "00") then
                    -- Reading from DATA_REG (offset 0x00) clears the data available flag
                    rx_data_avail <= '0';
                end if;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- AXI Write Channel State & Register Updates
    ----------------------------------------------------------------------------
    process(s_axi_aclk)
    begin
        if rising_edge(s_axi_aclk) then
            if s_axi_aresetn = '0' then
                axi_awready    <= '0';
                axi_wready     <= '0';
                axi_bvalid     <= '0';
                aw_en          <= '1';
                tx_start       <= '0';
                tx_data        <= (others => '0');
                reg_ctrl       <= (others => '0');
                reg_baud_div   <= C_DEFAULT_DIV16;
            else
                tx_start <= '0';

                -- AWREADY generation
                if (s_axi_awvalid = '1' and s_axi_wvalid = '1' and aw_en = '1') then
                    axi_awready <= '1';
                    axi_wready  <= '1';
                    aw_en       <= '0';
                    axi_awaddr_reg <= s_axi_awaddr;

                    -- Decode register address (bits 3 downto 2)
                    case s_axi_awaddr(3 downto 2) is
                        when "00" => -- DATA_REG (0x00)
                            if tx_busy = '0' then
                                tx_data  <= s_axi_wdata(7 downto 0);
                                tx_start <= '1';
                            end if;
                        when "01" => -- STATUS_REG (0x04) - Read only
                            null;
                        when "10" => -- CTRL_REG (0x08)
                            reg_ctrl <= s_axi_wdata;
                        when "11" => -- BAUD_DIV_REG (0x0C)
                            if unsigned(s_axi_wdata(15 downto 0)) > 1 then
                                reg_baud_div <= unsigned(s_axi_wdata(15 downto 0));
                            end if;
                        when others =>
                            null;
                    end case;
                else
                    axi_awready <= '0';
                    axi_wready  <= '0';
                end if;

                -- BVALID generation
                if (axi_awready = '1' and axi_wready = '1' and axi_bvalid = '0') then
                    axi_bvalid <= '1';
                elsif (s_axi_bready = '1' and axi_bvalid = '1') then
                    axi_bvalid <= '0';
                    aw_en      <= '1';
                end if;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- AXI Read Channel Handling
    ----------------------------------------------------------------------------
    process(s_axi_aclk)
        variable status_word : std_logic_vector(31 downto 0);
    begin
        if rising_edge(s_axi_aclk) then
            if s_axi_aresetn = '0' then
                axi_arready <= '0';
                axi_rvalid  <= '0';
                axi_rdata   <= (others => '0');
            else
                -- ARREADY generation
                if (s_axi_arvalid = '1' and axi_arready = '0') then
                    axi_arready <= '1';
                    
                    -- Prepare Read Data
                    case s_axi_araddr(3 downto 2) is
                        when "00" => -- DATA_REG (0x00): Read received byte
                            axi_rdata <= X"000000" & rx_data_latched;

                        when "01" => -- STATUS_REG (0x04)
                            status_word := (others => '0');
                            status_word(0) := tx_busy;             -- 1: Busy, 0: Idle
                            status_word(1) := rx_data_avail;       -- 1: Data available to read
                            status_word(2) := rx_error_reg;        -- 1: Framing error
                            status_word(3) := not tx_busy;         -- 1: Ready to transmit
                            axi_rdata      <= status_word;

                        when "10" => -- CTRL_REG (0x08)
                            axi_rdata <= reg_ctrl;

                        when "11" => -- BAUD_DIV_REG (0x0C)
                            axi_rdata <= X"0000" & std_logic_vector(reg_baud_div);

                        when others =>
                            axi_rdata <= (others => '0');
                    end case;
                else
                    axi_arready <= '0';
                end if;

                -- RVALID generation
                if (axi_arready = '1' and s_axi_arvalid = '1' and axi_rvalid = '0') then
                    axi_rvalid <= '1';
                elsif (s_axi_rready = '1' and axi_rvalid = '1') then
                    axi_rvalid <= '0';
                end if;
            end if;
        end if;
    end process;

end architecture rtl;
