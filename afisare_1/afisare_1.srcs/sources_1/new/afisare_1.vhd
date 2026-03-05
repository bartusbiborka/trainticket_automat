library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity afisare_1 is
    Port (
        clk  : in std_logic;
        cost : in STD_LOGIC_vector(11 downto 0);
        cat  : out STD_LOGIC_vector(6 downto 0);
        an   : out STD_LOGIC_vector(7 downto 0)
    );
end afisare_1;

architecture Behavioral of afisare_1 is

signal count:std_logic_vector(16 downto 0);
signal digit: std_logic_vector(3 downto 0);

component mux_8_1 is
    Port ( d_1 : in STD_LOGIC_VECTOR(3 downto 0);
    d_2: in std_logic_vector(3 downto 0);
    d_3: in std_logic_vector(3 downto 0);
           sel : in STD_LOGIC_VECTOR(2 downto 0);
           outp : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component mux_anod_1 is
    Port (
           sel : in STD_LOGIC_VECTOR(2 downto 0);
           anod_out : out STD_LOGIC_VECTOR(7 downto 0));
end component;

component digit_to_7seg is          
    Port ( hex : in STD_LOGIC_VECTOR (3 downto 0);    
           cat : out STD_LOGIC_VECTOR (6 downto 0)
          );                    
end component;    
begin


--divizor de frecventa pentru afisare
process(clk)
    begin
        if rising_edge(clk) then
            if count = "11111111111111111" then
                count <= (others => '0');
            else
                count <= count + 1;
            end if;
        end if;
end process;


C1: mux_8_1 port map ( cost(3 downto 0),cost(7 downto 4),cost(11 downto 8), count(16 downto 14), digit);   --mux pentru digit
C2: mux_anod_1 port map(count(16 downto 14), an);   --mux pentru afisor
C3: digit_to_7seg port map(digit, cat);    -- afisor 7 segmente

end Behavioral;