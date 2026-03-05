library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_2_1 is
    Port ( in1 : in STD_LOGIC_vector(7 downto 0);
        in2 : in STD_LOGIC_vector(7 downto 0);
         sel: in std_logic;
        out1: out std_logic_vector(7 downto 0)
    );
end mux_2_1;

architecture Behavioral of mux_2_1 is

begin

process(sel)
begin
    case sel is
        when '0' => out1 <= in1;
        when others => out1 <= in2;
    end case;
end process;

end Behavioral;
