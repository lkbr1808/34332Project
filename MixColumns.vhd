LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY MixColumns IS
	PORT (
		clk, in_val : IN STD_LOGIC;
		state : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		out_val : OUT STD_LOGIC;
		state_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
END ENTITY MixColumns;

ARCHITECTURE rtl OF MixColumns IS
	SIGNAL newState : STD_LOGIC_VECTOR(127 DOWNTO 0);
	--signal output1, output2, output3, output4, output5, output6, output7, output8: std_logic_vector(7 downto 0);
	SIGNAL val1, val2, val3, val4 : STD_LOGIC := '0';

	COMPONENT MixCalc IS
		PORT (
			clk, in_val : IN STD_LOGIC;
			state : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			out_val : OUT STD_LOGIC;
			state_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
	END COMPONENT MixCalc;

BEGIN

	U1 : MixCalc PORT MAP(clk, in_val, state(127 DOWNTO 96), val1, newState(127 DOWNTO 96));
	U2 : MixCalc PORT MAP(clk, val1, state(95 DOWNTO 64), val2, newState(95 DOWNTO 64));
	U3 : MixCalc PORT MAP(clk, val2, state(63 DOWNTO 32), val3, newState(63 DOWNTO 32));
	U4 : MixCalc PORT MAP(clk, val3, state(31 DOWNTO 0), val4, newState(31 DOWNTO 0));
	
	PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF (val4 = '1') THEN
				state_out <= newState;
				out_val <= '1';
			END IF;
		END IF;

	END PROCESS;

END;