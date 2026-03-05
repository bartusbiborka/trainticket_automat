library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_8_1 is
    Port ( d_1 : in STD_LOGIC_VECTOR(3 downto 0);
           d_2: in std_logic_vector(3 downto 0);
           d_3: in std_logic_vector(3 downto 0);
           sel : in STD_LOGIC_VECTOR(2 downto 0);
           outp : out STD_LOGIC_VECTOR(3 downto 0));
end mux_8_1;

architecture Behavioral of mux_8_1 is

begin

process(sel, d_1, d_2, d_3)
begin
    case sel is
        when "000" => 
            outp <= d_1;
        when "001" =>
            outp <= d_2;
        when "010" =>
            outp <= d_3;
        when others =>
            outp <= (others => '0');
         end case;
end process;

end Behavioral;