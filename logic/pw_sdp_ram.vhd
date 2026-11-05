--------------------------------------------------------------------------------
-- pw_sdp_ram : simple-dual-port RAM (1 write port, 1 read port), same clock.
--   * inferred block RAM
--   * read latency = 1 (OUT_REG=false) or 2 (OUT_REG=true: extra output register
--     that Vivado absorbs into the BRAM output register / cascade mux timing)
--   * read-during-write to the same address returns the OLD data
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pw_sdp_ram is
    generic (
        ADDR_W  : integer := 8;
        DATA_W  : integer := 64;
        OUT_REG : boolean := true
    );
    port (
        clk   : in  std_logic;
        we    : in  std_logic;
        waddr : in  std_logic_vector(ADDR_W - 1 downto 0);
        wdata : in  std_logic_vector(DATA_W - 1 downto 0);
        raddr : in  std_logic_vector(ADDR_W - 1 downto 0);
        rdata : out std_logic_vector(DATA_W - 1 downto 0)
    );
end entity pw_sdp_ram;

architecture rtl of pw_sdp_ram is
    type ram_t is array (0 to 2 ** ADDR_W - 1) of std_logic_vector(DATA_W - 1 downto 0);
    signal ram : ram_t := (others => (others => '0'));
    attribute ram_style : string;
    attribute ram_style of ram : signal is "block";
    signal rd1 : std_logic_vector(DATA_W - 1 downto 0) := (others => '0');
    signal rd2 : std_logic_vector(DATA_W - 1 downto 0) := (others => '0');
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                ram(to_integer(unsigned(waddr))) <= wdata;
            end if;
            rd1 <= ram(to_integer(unsigned(raddr)));
            rd2 <= rd1;
        end if;
    end process;

    g_reg : if OUT_REG generate
        rdata <= rd2;
    end generate;
    g_noreg : if not OUT_REG generate
        rdata <= rd1;
    end generate;
end architecture rtl;

