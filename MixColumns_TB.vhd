LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MixColumns_TB IS
END MixColumns_TB;

ARCHITECTURE Behavioral OF MixColumns_TB IS

    SIGNAL input, output, output2 : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL clk, in_val_TB, out_val_TB, out_val_TB2 : STD_LOGIC;

    COMPONENT MixColumns IS
        PORT (
            clk, in_val : IN STD_LOGIC;
            state : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
            out_val : OUT STD_LOGIC;
            state_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
    END COMPONENT;

    COMPONENT invMixColumns IS
        PORT (
            clk, in_val : IN STD_LOGIC;
            state : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
            out_val : OUT STD_LOGIC;
            state_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
    END COMPONENT invMixColumns;

BEGIN

    DUT : MixColumns PORT MAP(clk, in_val_TB, input, out_val_TB, output);
    DUT2 : invMixColumns PORT MAP(clk, out_val_TB, output, out_val_TB2, output2);

    -- Klokkekontrol
    stimulus : PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
    END PROCESS;
    -- Input stimulering 
    PROCESS BEGIN
        input <= x"d4bf5d30e0b452aeb84111f11e2798e5";
        in_val_TB <= '1';
        WAIT FOR 40 ns;

    END PROCESS;
END Behavioral;