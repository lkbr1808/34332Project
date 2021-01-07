

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY MixColumns IS
	PORT (
		clk : IN STD_LOGIC;
		state : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		state_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
END ENTITY MixColumns;
ARCHITECTURE rtl OF MixColumns IS
	SIGNAL newState : STD_LOGIC_VECTOR(127 DOWNTO 0);
	--signal output1, output2, output3, output4, output5, output6, output7, output8: std_logic_vector(7 downto 0);

	COMPONENT MixCalc IS
		PORT (
			clk : IN STD_LOGIC;
			state : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			state_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
	END COMPONENT MixCalc;

BEGIN

	U1 : MixCalc PORT MAP(clk, state(127 DOWNTO 96), newState(127 DOWNTO 96));
	U2 : MixCalc PORT MAP(clk, state(95 DOWNTO 64), newState(95 DOWNTO 64));
	U3 : MixCalc PORT MAP(clk, state(63 DOWNTO 32), newState(63 DOWNTO 32));
	U4 : MixCalc PORT MAP(clk, state(31 DOWNTO 0), newState(31 DOWNTO 0));
	
	PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			state_out <= newState;
		END IF;

	END PROCESS;

END;