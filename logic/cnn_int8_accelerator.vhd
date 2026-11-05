--------------------------------------------------------------------------------
-- File: cnn_int8_accelerator.vhd
-- Description: Synthesizable INT8 Quantized CNN Processing Engine (PE)
-- Features:
--   * 4 parallel 8-bit signed multipliers (DSP48E1 friendly)
--   * 32-bit accumulator with bias addition
--   * Hardware ReLU activation unit
--   * Arithmetic shift & saturation requantization
--   * Execution cycle counter for hardware profiling
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cnn_int8_accelerator is
    port (
        clk         : in  std_logic;
        rst_n       : in  std_logic;

        -- Control & Configuration
        start       : in  std_logic;
        accum_clear : in  std_logic;
        relu_en     : in  std_logic;
        shift_val   : in  unsigned(4 downto 0);
        bias_in     : in  signed(31 downto 0);

        -- Parallel 4-lane INT8 inputs
        act_0       : in  signed(7 downto 0);
        act_1       : in  signed(7 downto 0);
        act_2       : in  signed(7 downto 0);
        act_3       : in  signed(7 downto 0);

        w_0         : in  signed(7 downto 0);
        w_1         : in  signed(7 downto 0);
        w_2         : in  signed(7 downto 0);
        w_3         : in  signed(7 downto 0);

        -- Status & Results
        busy        : out std_logic;
        done        : out std_logic;
        result_acc  : out signed(31 downto 0);
        result_int8 : out signed(7 downto 0);
        perf_cycles : out unsigned(31 downto 0)
    );
end entity cnn_int8_accelerator;

architecture rtl of cnn_int8_accelerator is

    type state_t is (ST_IDLE, ST_MAC, ST_BIAS, ST_QUANT, ST_DONE);
    signal state : state_t := ST_IDLE;

    -- Internal registers
    signal r_acc         : signed(31 downto 0) := (others => '0');
    signal r_prod_sum    : signed(31 downto 0) := (others => '0');
    signal r_cycles      : unsigned(31 downto 0) := (others => '0');
    signal r_quant_res   : signed(7 downto 0) := (others => '0');

begin

    result_acc  <= r_acc;
    result_int8 <= r_quant_res;
    perf_cycles <= r_cycles;

    process(clk, rst_n)
        variable p0, p1, p2, p3 : signed(15 downto 0);
        variable v_sum          : signed(31 downto 0);
        variable v_shifted      : signed(31 downto 0);
        variable v_clamped      : signed(7 downto 0);
    begin
        if rst_n = '0' then
            state       <= ST_IDLE;
            r_acc       <= (others => '0');
            r_prod_sum  <= (others => '0');
            r_cycles    <= (others => '0');
            r_quant_res <= (others => '0');
            busy        <= '0';
            done        <= '0';

        elsif rising_edge(clk) then
            case state is
                when ST_IDLE =>
                    done <= '0';
                    if start = '1' then
                        busy     <= '1';
                        r_cycles <= (others => '0');

                        if accum_clear = '1' then
                            r_acc <= (others => '0');
                        end if;

                        -- 4 parallel INT8 multiplications
                        p0 := act_0 * w_0;
                        p1 := act_1 * w_1;
                        p2 := act_2 * w_2;
                        p3 := act_3 * w_3;

                        -- Adder tree
                        v_sum := resize(p0, 32) + resize(p1, 32) +
                                 resize(p2, 32) + resize(p3, 32);
                        r_prod_sum <= v_sum;
                        state      <= ST_MAC;
                    else
                        busy <= '0';
                    end if;

                when ST_MAC =>
                    r_cycles <= r_cycles + 1;
                    r_acc    <= r_acc + r_prod_sum;
                    state    <= ST_BIAS;

                when ST_BIAS =>
                    r_cycles <= r_cycles + 1;
                    v_sum := r_acc + bias_in;
                    r_acc <= v_sum;
                    state <= ST_QUANT;

                when ST_QUANT =>
                    r_cycles <= r_cycles + 1;
                    v_sum := r_acc;

                    -- ReLU activation
                    if relu_en = '1' and v_sum < 0 then
                        v_sum := (others => '0');
                    end if;

                    -- Fixed-point arithmetic shift
                    v_shifted := shift_right(v_sum, to_integer(shift_val));

                    -- Saturation clamp to [-128, 127]
                    if v_shifted > 127 then
                        v_clamped := to_signed(127, 8);
                    elsif v_shifted < -128 then
                        v_clamped := to_signed(-128, 8);
                    else
                        v_clamped := resize(v_shifted, 8);
                    end if;

                    r_quant_res <= v_clamped;
                    state       <= ST_DONE;

                when ST_DONE =>
                    busy  <= '0';
                    done  <= '1';
                    state <= ST_IDLE;

                when others =>
                    state <= ST_IDLE;
            end case;
        end if;
    end process;

end architecture rtl;
