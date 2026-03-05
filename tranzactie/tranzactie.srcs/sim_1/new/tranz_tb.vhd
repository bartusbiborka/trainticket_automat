library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tranzactie_tb is
end tranzactie_tb;

architecture Behavioral of tranzactie_tb is

    -- Signals for top-level ports
    signal clk : std_logic := '0';
    signal sel : std_logic;
    signal suma : std_logic_vector(7 downto 0);
    signal distanta : std_logic_vector(7 downto 0);
    signal afis : std_logic_vector(7 downto 0);
    signal nr_bcd : std_logic_vector(11 downto 0);
    signal suma_automat : std_logic_vector(7 downto 0);
    signal bilet_automat : std_logic;
    signal rest : std_logic_vector(7 downto 0);
    signal bilet : std_logic;
    signal warning_bilet : std_logic;
    signal warning_suma : std_logic;
    signal warning_rest : std_logic;
    signal cat : std_logic_vector(3 downto 0);
    signal an : std_logic_vector(3 downto 0);

    -- Component declarations
    component mux_2_1 is
        Port (
            a : in std_logic_vector(7 downto 0);
            b : in std_logic_vector(7 downto 0);
            sel : in std_logic;
            y : out std_logic_vector(7 downto 0)
        );
    end component;

    component binary_to_bcd is
        Port (
            bin : in std_logic_vector(7 downto 0);
            bcd : out std_logic_vector(11 downto 0)
        );
    end component;

    component afisare_1 is
        Port (
            clk : in std_logic;
            bcd : in std_logic_vector(11 downto 0);
            cat : out std_logic_vector(3 downto 0);
            an : out std_logic_vector(3 downto 0)
        );
    end component;

    component tranzactie is
        Port (
            sel : in std_logic;
            suma : in std_logic_vector(7 downto 0);
            distanta : in std_logic_vector(7 downto 0);
            suma_automat : in std_logic_vector(7 downto 0);
            bilet_automat : in std_logic;
            rest : out std_logic_vector(7 downto 0);
            bilet : out std_logic;
            warning_bilet : out std_logic;
            warning_suma : out std_logic;
            warning_rest : out std_logic
        );
    end component;

    -- Instantiate the top-level module
    a2: mux_2_1 port map (distanta, suma, sel, afis);
    a3: binary_to_bcd port map (afis, nr_bcd);
    a4: afisare_1 port map (clk, nr_bcd, cat, an);
    a5: tranzactie port map (sel, suma, distanta, suma_automat, bilet_automat, rest, bilet, warning_bilet, warning_suma, warning_rest);

    -- Clock generation process
    clk_process : process
    begin
        while True loop
            clk <= '0';
            wait for 10 ns;
            clk <= '1';
            wait for 10 ns;
        end loop;
    end process;

    -- Test stimulus process
    stimulus_process : process
    begin
        -- Initialize inputs
        sel <= '0';
        suma <= (others => '0');
        distanta <= (others => '0');
        suma_automat <= (others => '0');
        bilet_automat <= '0';

        -- Apply test stimulus
        wait for 20 ns;
        sel <= '1';
        suma <= "00000100"; -- Example value
        distanta <= "00000010"; -- Example value
        suma_automat <= "00000110"; -- Example value
        bilet_automat <= '1';

        wait for 40 ns;
        sel <= '0';
        suma <= "00001000"; -- Example value
        distanta <= "00000100"; -- Example value

        wait for 40 ns;
        -- Additional test cases can be added here

        -- End simulation
        wait;
    end process;

begin
    -- Optional: print output values
    process(clk)
    begin
        if rising_edge(clk) then
            report "rest = " & std_logic_vector'IMAGE(rest);
            report "bilet = " & std_logic'IMAGE(bilet);
            report "warning_bilet = " & std_logic'IMAGE(warning_bilet);
            report "warning_suma = " & std_logic'IMAGE(warning_suma);
            report "warning_rest = " & std_logic'IMAGE(warning_rest);
        end if;
    end process;

end Behavioral;
