----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2024 12:52:44 PM
-- Design Name: 
-- Module Name: Hex_to_7seg - Behavioral
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

entity digit_to_7seg is           -- cele 7 segmente in sensul invers accelor de ceasorinic se numesc a,b,c,d,e,f si sunt in logica negativa
    Port ( hex : in STD_LOGIC_VECTOR (3 downto 0);    --      a   
           cat : out STD_LOGIC_VECTOR (6 downto 0)--      __
          );                    --     f|   |b
end digit_to_7seg;                                   --       ---
                                                   --     e| g |c
architecture Behavioral of digit_to_7seg is          --       ---  
                                                    --       d
begin
    cat <=  "1000000" when hex="0000" else
            "1111001" when hex="0001" else
            "0100100" when hex="0010" else
            "0110000" when hex="0011" else
            "0011001" when hex="0100" else
            "0010010" when hex="0101" else
            "0000010" when hex="0110" else
            "1111000" when hex="0111" else
            "0000000" when hex="1000" else
            "0010000" when hex="1001" else
            "0001000" when hex="1010" else
            "0000011" when hex="1011" else
            "1000110" when hex="1100" else
            "0100001" when hex="1101" else
            "0000110" when hex="1110" else
            "0001110" when hex="1111" else
            "1111111";
   

end Behavioral;