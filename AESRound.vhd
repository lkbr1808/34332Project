
LIBRARY ieee;
USE ieee.std_logic_textio.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY AESRound IS
	PORT (
		clk : IN STD_LOGIC;
		key : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		in_data : IN STD_LOGIC_VECTOR(127 downto 0);
		out_data : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
END ENTITY;

ARCHITECTURE AESRound_arc OF AESRound IS

	COMPONENT SubBytes IS
	PORT (
		clk      : IN STD_LOGIC;
		data_in  : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		data_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
	END COMPONENT;

	COMPONENT ShiftRows IS
	PORT (
		clk : IN STD_LOGIC;
		input : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		out_data : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
	END COMPONENT;

	COMPONENT MixColumns IS
	PORT (
		clk : IN STD_LOGIC;
		state : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		state_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
	END COMPONENT MixColumns;

	COMPONENT AddKey IS
	PORT (
		clk : IN STD_LOGIC;
		state : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		key : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		newState : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
	END COMPONENT AddKey;

	signal state1, state2, state3, state4 : STD_LOGIC_VECTOR(127 downto 0);


BEGIN

	U1 : SubBytes PORT MAP(clk, in_data, state1);
	U2 : ShiftRows PORT MAP(clk, state1, state2);
	U3 : MixColumns PORT MAP(clk, state2, state3);
	U4 : AddKey PORT MAP(clk, state3, key, state4);

	PROCESS (clk)
	BEGIN
		IF (RISING_EDGE(clk)) THEN

		out_data <= state4;
		END IF;

	END PROCESS;
	

END ARCHITECTURE;