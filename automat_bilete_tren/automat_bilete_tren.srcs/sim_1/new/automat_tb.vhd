library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity automat_tb is
end automat_tb;

architecture Behavioral of automat_tb is
    -- Component under test
    component automat_bilete_tren
        Port (  distanta: in std_logic_vector(7 downto 0);
                suma: in std_logic_vector(7 downto 0);
                enter: in std_logic;
                renuntare: in std_logic;
                clk: in std_logic;
                
                restituire_bani: out std_logic;
                cat  : out std_logic_vector(6 downto 0);
                an   : out std_logic_vector(7 downto 0);
                warning_bilet: out std_logic;
                warning_rest: out std_logic;
                warning_suma: out std_logic;
                rest: out std_logic_vector(7 downto 0);    
                bilet: out std_logic
        );
    end component;

    -- Testbench signals
    signal distanta_tb: std_logic_vector(7 downto 0) := (others => '0');
    signal suma_tb: std_logic_vector(7 downto 0) := (others => '0');
    signal enter_tb: std_logic := '0';
    signal renuntare_tb: std_logic := '0';
    signal clk_tb: std_logic := '0';
    
    signal restituire_bani_tb: std_logic;
    signal cat_tb: std_logic_vector(6 downto 0);
    signal an_tb: std_logic_vector(7 downto 0);
    signal warning_bilet_tb: std_logic;
    signal warning_rest_tb: std_logic;
    signal warning_suma_tb: std_logic;
    signal rest_tb: std_logic_vector(7 downto 0);
    signal bilet_tb: std_logic;

begin
    -- Clock generation
    clk_process :process
    begin
        clk_tb <= '0';
        wait for 10 ns;
        clk_tb <= '1';
        wait for 10 ns;
    end process;
    
    -- Instantiate the Unit Under Test (UUT)
    UUT: automat_bilete_tren
        port map (
            distanta => distanta_tb,
            suma => suma_tb,
            enter => enter_tb,
            renuntare => renuntare_tb,
            clk => clk_tb,
            restituire_bani => restituire_bani_tb,
            cat => cat_tb,
            an => an_tb,
            warning_bilet => warning_bilet_tb,
            warning_rest => warning_rest_tb,
            warning_suma => warning_suma_tb,
            rest => rest_tb,
            bilet => bilet_tb
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize inputs
        distanta_tb <= "00001010";  -- example distance
        suma_tb <= "00010000";      -- example sum
        enter_tb <= '1';
        wait for 20 ns;
        enter_tb <= '0';
        
        -- Add more test cases as needed
        wait;
    end process;

end Behavioral;
