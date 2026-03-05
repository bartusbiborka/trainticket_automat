----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2024 09:05:51 PM
-- Design Name: 
-- Module Name: mux_8_1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_anod_1 is
    Port ( 
           sel : in STD_LOGIC_VECTOR(2 downto 0);
           anod_out : out STD_LOGIC_VECTOR(7 downto 0));
end mux_anod_1;

architecture Behavioral of mux_anod_1 is

begin

process(sel)
begin
    case sel is
        when "000" =>
                anod_out <= "11111110";
            when "001" =>
                anod_out <= "11111101";
            when "010" =>
                anod_out <= "11111011";
            when "011" =>
                anod_out <= "11110111";
            when "100" =>
                anod_out <= "11101111";
            when "101" =>
                anod_out <= "11011111";
            when "110" =>
                anod_out <= "10111111";
            when "111" =>
                anod_out <= "01111111";
            when others =>
                anod_out <= (others => '0'); 
         end case;
end process;

end Behavioral;