--------------------------------------------------------------------------------
-- File: uart_tx.vhd
-- Description: UART Transmitter (8N1: 8 data bits, no parity, 1 stop bit)
-- Target: Xilinx Zynq-7000 PL / Generic FPGA
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_tx is
    port (
        clk       : in  std_logic;                    -- System clock
        rst_n     : in  std_logic;                    -- Active-low synchronous reset
        baud_tick : in  std_logic;                    -- 1-cycle pulse at baud rate
        tx_start  : in  std_logic;                    -- Strobe to start transmission
        tx_data   : in  std_logic_vector(7 downto 0); -- Byte to transmit
        txd       : out std_logic;                    -- Serial TX line (idle high)
        tx_busy   : out std_logic;                    -- High while transmission is active
        tx_done   : out std_logic                     -- 1-cycle pulse upon completion
    );
end entity uart_tx;

architecture rtl of uart_tx is

    type state_type is (IDLE, START_BIT, DATA_BITS, STOP_BIT);
    signal state      : state_type := IDLE;
    signal shreg      : std_logic_vector(7 downto 0) := (others => '0');
    signal bit_idx    : natural range 0 to 7 := 0;
    signal txd_reg    : std_logic := '1';
    signal busy_reg   : std_logic := '0';
    signal done_reg   : std_logic := '0';

begin

    txd     <= txd_reg;
    tx_busy <= busy_reg;
    tx_done <= done_reg;

    process(clk)
    begin
        if rising_edge(clk) then
            if rst_n = '0' then
                state    <= IDLE;
                txd_reg  <= '1';
                busy_reg <= '0';
                done_reg <= '0';
                shreg    <= (others => '0');
                bit_idx  <= 0;
            else
                done_reg <= '0';

                case state is
                    when IDLE =>
                        txd_reg  <= '1';
                        busy_reg <= '0';
                        bit_idx  <= 0;
                        if tx_start = '1' then
                            shreg    <= tx_data;
                            busy_reg <= '1';
                            state    <= START_BIT;
                        end if;

                    when START_BIT =>
                        busy_reg <= '1';
                        if baud_tick = '1' then
                            txd_reg <= '0'; -- Start bit is 0
                            state   <= DATA_BITS;
                            bit_idx <= 0;
                        end if;

                    when DATA_BITS =>
                        busy_reg <= '1';
                        if baud_tick = '1' then
                            txd_reg <= shreg(0);
                            shreg   <= '0' & shreg(7 downto 1); -- Shift LSB first
                            if bit_idx = 7 then
                                state <= STOP_BIT;
                            else
                                bit_idx <= bit_idx + 1;
                            end if;
                        end if;

                    when STOP_BIT =>
                        busy_reg <= '1';
                        if baud_tick = '1' then
                            txd_reg  <= '1'; -- Stop bit is 1
                            busy_reg <= '0';
                            done_reg <= '1';
                            state    <= IDLE;
                        end if;

                    when others =>
                        state <= IDLE;
                end case;
            end if;
        end if;
    end process;

end architecture rtl;
