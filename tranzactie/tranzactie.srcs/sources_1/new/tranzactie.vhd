library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

entity tranzactie is
    Port (
        sel : in STD_LOGIC;
        suma : in std_logic_vector(7 downto 0);
        distanta : in std_logic_vector(7 downto 0);
        suma_automat : in std_logic_vector(7 downto 0);
        bilete_automat : in std_logic_vector(7 downto 0);
        
        rest : out std_logic_vector(7 downto 0);
        bilet : out std_logic;
        warning_bilet : out std_logic;
        warning_suma : out std_logic;
        warning_rest : out std_logic
    );
end tranzactie;

architecture Behavioral of tranzactie is
signal semnal: std_logic := '0';
begin
process(sel, bilete_automat, suma_automat, suma, distanta)
begin
    rest <= (others => '0');
    warning_bilet <= '0';
    warning_suma <= '0';
    warning_rest <= '0';
    semnal <= '0';
    bilet <= '0';
    
    if sel = '1' then
        if bilete_automat > "00000000" then
            if suma < distanta then
                warning_suma <= '1';
                semnal <= '1';
            else
                 if ((std_logic_vector(unsigned(suma) - unsigned(distanta)) > suma_automat) and semnal = '0') then
                   warning_rest <= '1';
                 elsif (semnal = '0') then
                   rest <= std_logic_vector(unsigned(suma) - unsigned(distanta));
                    bilet <= '1';
                 end if;
            end if;
            else
                warning_bilet <= '1';
        end if;
    end if;
end process;
end Behavioral;
