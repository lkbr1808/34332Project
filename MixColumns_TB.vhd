LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MixColumns_TB IS
END MixColumns_TB;

ARCHITECTURE Behavioral OF MixColumns_TB IS

    SIGNAL input, output : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL clk : STD_LOGIC;

    COMPONENT MixColumns IS
        PORT (
            clk : IN STD_LOGIC;
            state : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
            state_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
    END COMPONENT;

BEGIN
    DUT : MixColumns PORT MAP(clk, input, output);
    -- Klokkekontrol
    PROCESS BEGIN
        clk <= '1';
        WAIT FOR 5 ns;
        clk <= '0';
        WAIT FOR 5 ns;
    END PROCESS;
    -- Input stimulering 
    PROCESS BEGIN
        input <= x"d4bf5d30e0b452aeb84111f11e2798e5";
        WAIT FOR 40 ns;

    END PROCESS;
END Behavioral;