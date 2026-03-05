library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb1 is
end tb1;

architecture Behavioral of tb1 is

    -- Signals for top-level ports
    signal clk : std_logic := '0';
    signal sel : std_logic;
    signal suma : std_logic_vector(7 downto 0);
    signal distanta : std_logic_vector(7 downto 0);
    signal afis : std_logic_vector(7 downto 0);
    signal nr_bcd : std_logic_vector(11 downto 0);
    signal cat : std_logic_vector(3 downto 0);
    signal an : std_logic_vector(3 downto 0);
    signal suma_automat : std_logic_vector(7 downto 0);
    signal bilet_automat : std_logic_vector(7 downto 0);
    signal rest : std_logic_vector(7 downto 0);
    signal bilet : std_logic_vector(7 downto 0);
    signal warning_bilet : std_logic;
    signal warning_suma : std_logic;
    signal warning_rest : std_logic;

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: entity work.top_module port map (
        clk => clk,
        sel => sel,
        suma => suma,
        distanta => distanta,
        afis => afis,
        nr_bcd => nr_bcd,
        cat => cat,
        an => an,
        suma_automat => suma_automat,
        bilet_automat => bilet_automat,
        rest => rest,
        bilet => bilet,
        warning_bilet => warning_bilet,
        warning_suma => warning_suma,
        warning_rest => warning_rest
    );

    -- Clock process definitions
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin		
        -- Initialize Inputs
        sel <= '0';
        suma <= "00000000";
        distanta <= "00000000";

        -- Wait for global reset to finish
        wait for 100 ns;
        
        -- Stimulate the inputs
        sel <= '1';
        suma <= "00001010";        -- Example value
        distanta <= "00000101";    -- Example value
        wait for clk_period * 10;

        sel <= '0';
        suma <= "00001111";        -- Example value
        distanta <= "00001010";    -- Example value
        wait for clk_period * 10;

        -- Add more test vectors as needed
        wait;
    end process;

end Behavioral;
