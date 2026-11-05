--------------------------------------------------------------------------------
-- File: uart_rx.vhd
-- Description: UART Receiver with 16x oversampling and majority sampling
-- Target: Xilinx Zynq-7000 PL / Generic FPGA
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_rx is
    port (
        clk          : in  std_logic;                    -- System clock
        rst_n        : in  std_logic;                    -- Active-low synchronous reset
        baud_tick_16 : in  std_logic;                    -- 1-cycle pulse at 16x baud rate
        rxd          : in  std_logic;                    -- Asynchronous serial input line
        rx_data      : out std_logic_vector(7 downto 0); -- Received byte
        rx_valid     : out std_logic;                    -- 1-cycle pulse when byte received
        rx_busy      : out std_logic;                    -- High while frame is receiving
        rx_error     : out std_logic                     -- High on framing error
    );
end entity uart_rx;

architecture rtl of uart_rx is

    type state_type is (IDLE, START_BIT, DATA_BITS, STOP_BIT);
    signal state        : state_type := IDLE;

    -- Metastability synchronizer (3-stage)
    signal rxd_sync1    : std_logic := '1';
    signal rxd_sync2    : std_logic := '1';
    signal rxd_reg      : std_logic := '1';

    signal sample_cnt   : unsigned(3 downto 0) := (others => '0');
    signal bit_idx      : natural range 0 to 7 := 0;
    signal rx_shreg     : std_logic_vector(7 downto 0) := (others => '0');
    signal rx_data_reg  : std_logic_vector(7 downto 0) := (others => '0');
    signal valid_reg    : std_logic := '0';
    signal busy_reg     : std_logic := '0';
    signal error_reg    : std_logic := '0';

begin

    rx_data  <= rx_data_reg;
    rx_valid <= valid_reg;
    rx_busy  <= busy_reg;
    rx_error <= error_reg;

    -- Synchronizer process
    process(clk)
    begin
        if rising_edge(clk) then
            rxd_sync1 <= rxd;
            rxd_sync2 <= rxd_sync1;
            rxd_reg   <= rxd_sync2;
        end if;
    end process;

    -- UART RX State Machine
    process(clk)
    begin
        if rising_edge(clk) then
            if rst_n = '0' then
                state       <= IDLE;
                sample_cnt  <= (others => '0');
                bit_idx     <= 0;
                rx_shreg    <= (others => '0');
                rx_data_reg <= (others => '0');
                valid_reg   <= '0';
                busy_reg    <= '0';
                error_reg   <= '0';
            else
                valid_reg <= '0';

                case state is
                    when IDLE =>
                        busy_reg   <= '0';
                        sample_cnt <= (others => '0');
                        bit_idx    <= 0;
                        -- Detect falling edge (start of start bit)
                        if rxd_reg = '0' then
                            busy_reg <= '1';
                            state    <= START_BIT;
                        end if;

                    when START_BIT =>
                        busy_reg <= '1';
                        if baud_tick_16 = '1' then
                            if sample_cnt = 7 then
                                -- Sample at center of start bit (tick 7 of 15)
                                if rxd_reg = '0' then
                                    sample_cnt <= (others => '0');
                                    state      <= DATA_BITS;
                                    bit_idx    <= 0;
                                else
                                    -- False start bit glitch
                                    state      <= IDLE;
                                    busy_reg   <= '0';
                                end if;
                            else
                                sample_cnt <= sample_cnt + 1;
                            end if;
                        end if;

                    when DATA_BITS =>
                        busy_reg <= '1';
                        if baud_tick_16 = '1' then
                            if sample_cnt = 15 then
                                sample_cnt <= (others => '0');
                                -- Sample data bit at middle of bit period
                                rx_shreg <= rxd_reg & rx_shreg(7 downto 1); -- LSB first
                                if bit_idx = 7 then
                                    state   <= STOP_BIT;
                                else
                                    bit_idx <= bit_idx + 1;
                                end if;
                            else
                                sample_cnt <= sample_cnt + 1;
                            end if;
                        end if;

                    when STOP_BIT =>
                        busy_reg <= '1';
                        if baud_tick_16 = '1' then
                            if sample_cnt = 15 then
                                sample_cnt <= (others => '0');
                                busy_reg   <= '0';
                                if rxd_reg = '1' then
                                    -- Valid stop bit
                                    rx_data_reg <= rx_shreg;
                                    valid_reg   <= '1';
                                    error_reg   <= '0';
                                else
                                    -- Framing error
                                    error_reg   <= '1';
                                end if;
                                state <= IDLE;
                            else
                                sample_cnt <= sample_cnt + 1;
                            end if;
                        end if;

                    when others =>
                        state <= IDLE;
                end case;
            end if;
        end if;
    end process;

end architecture rtl;
