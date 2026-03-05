library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity automat_bilete_tren is
    Port (  distanta: in std_logic_vector(7 downto 0);
            suma: in std_logic_vector(6 downto 0);
            enter: in std_logic;
            renuntare: in std_logic;
            clk: in std_logic;
            
            restituire_bani: out std_logic;
            cat  : out STD_LOGIC_vector(6 downto 0);
            an   : out STD_LOGIC_vector(7 downto 0);
            warning_bilet: out std_logic;
            warning_rest: out std_logic;
            warning_suma: out std_logic;
            rest: out std_logic_vector(7 downto 0)  ;    
            bilet: out std_logic
    );
end automat_bilete_tren;

architecture Behavioral of automat_bilete_tren is

--incarcare initiala suma
constant suma_automat: std_logic_vector(7 downto 0) := "11111111";
--incarcare initiala bilete
constant bilet_automat: std_logic_vector(7 downto 0) := "00001000";

component MPG is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           en : out STD_LOGIC);
end component;

component afisare_1 is
    Port (
        clk  : in std_logic;
        cost : in STD_LOGIC_vector(11 downto 0);
        cat  : out STD_LOGIC_vector(6 downto 0);
        an   : out STD_LOGIC_vector(7 downto 0)
    );
end component;

component binary_to_bcd is
    port (
        bin:    in  std_logic_vector (7 downto 0);
        bcd:    out std_logic_vector (11 downto 0)
    );
end component;

component mux_2_1 is
    Port ( in1 : in STD_LOGIC_vector(7 downto 0);
        in2 : in STD_LOGIC_vector(7 downto 0);
         sel: in std_logic;
        out1: out std_logic_vector(7 downto 0)
    );
end component;

component tranzactie is
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
end component;

signal nr_bcd: std_logic_vector(11 downto 0);
signal afis: std_logic_vector(7 downto 0);
signal renuntare_s: std_logic;
signal suma_s: std_logic_vector(7 downto 0);
begin

restituire_bani <= '0';

process(enter)
begin
    if(enter = '1') then
        afis <= '0' & suma;
        suma_s <= '0' & suma;
    else
        afis <= distanta;
    end if;
end process;

a1: mpg port map (renuntare, clk, renuntare_s);

process(renuntare_s)
begin
    if renuntare_s = '1' then
        restituire_bani <= '1';
    end if;
end process;

a2: binary_to_bcd port map (afis, nr_bcd);
a3: afisare_1 port map (clk, nr_bcd, cat, an);
a4: tranzactie port map (enter, suma_s, distanta, suma_automat, bilet_automat, rest, bilet, warning_bilet, warning_suma, warning_rest);

end Behavioral;