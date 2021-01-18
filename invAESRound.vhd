LIBRARY ieee;
USE ieee.std_logic_textio.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY invAESRound IS
	PORT (
		clk, in_val : IN STD_LOGIC;
		key : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		in_data : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		out_val : OUT STD_LOGIC;
		out_data : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
END ENTITY;

ARCHITECTURE invAESRound_arc OF invAESRound IS

	COMPONENT invSubBytes IS
		PORT (
			clk, in_val : IN STD_LOGIC;
			data_in : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
			out_val : OUT STD_LOGIC;
			data_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
	END COMPONENT;

	COMPONENT invShiftRows IS
		PORT (
			clk, in_val : IN STD_LOGIC;
			input : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
			out_val : OUT STD_LOGIC;
			out_data : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
	END COMPONENT;

	COMPONENT invMixColumns IS
		PORT (
			clk, in_val : IN STD_LOGIC;
			state : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
			out_val : OUT STD_LOGIC;
			state_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
	END COMPONENT;

	COMPONENT AddKey IS
		PORT (
			clk, in_val : IN STD_LOGIC;
			state : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
			key : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
			out_val : OUT STD_LOGIC;
			newState : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
	END COMPONENT;

	SIGNAL state1, state2, state3, state4 : STD_LOGIC_VECTOR(127 DOWNTO 0);
	SIGNAL val1, val2, val3, val4 : STD_LOGIC := '0';
BEGIN

	U1 : invShiftRows PORT MAP(clk, in_val, in_data, val1, state1);
	U2 : invSubBytes PORT MAP(clk, val1, state1, val2, state2);
	U3 : AddKey PORT MAP(clk, val2, state2, key, val3, state3);
	U4 : invMixColumns PORT MAP(clk, val3, state3, val4, state4);
	PROCESS (clk)
	BEGIN
		IF (RISING_EDGE(clk)) THEN
			IF (val4 = '1') THEN
				out_val <= '1';
				out_data <= state4;
			ELSE
				out_val <= '0';
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE;