LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY invMixColumns IS
	PORT (
		clk, in_val : IN STD_LOGIC;
		state : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		out_val : OUT STD_LOGIC;
		state_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
END ENTITY invMixColumns;

ARCHITECTURE rtl OF invMixColumns IS

	SIGNAL newState : STD_LOGIC_VECTOR(127 DOWNTO 0);
	SIGNAL vals : STD_LOGIC_VECTOR(3 DOWNTO 0) := x"0";

	COMPONENT invMixCalc IS
		PORT (
			clk, in_val : IN STD_LOGIC;
			state : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			out_val : OUT STD_LOGIC;
			state_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
	END COMPONENT invMixCalc;

BEGIN

	U1 : invMixCalc PORT MAP(clk, in_val, state(127 DOWNTO 96), vals(0), newState(127 DOWNTO 96));
	U2 : invMixCalc PORT MAP(clk, in_val, state(95 DOWNTO 64), vals(1), newState(95 DOWNTO 64));
	U3 : invMixCalc PORT MAP(clk, in_val, state(63 DOWNTO 32), vals(2), newState(63 DOWNTO 32));
	U4 : invMixCalc PORT MAP(clk, in_val, state(31 DOWNTO 0), vals(3), newState(31 DOWNTO 0));

	PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF (vals = x"f") THEN
				state_out <= newState;
				out_val <= '1';
			END IF;
		END IF;

	END PROCESS;

END;