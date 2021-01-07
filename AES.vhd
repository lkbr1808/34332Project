
LIBRARY ieee;
USE ieee.std_logic_textio.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY AES IS
	PORT (
		clk : IN STD_LOGIC;
		key : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		in_val : IN STD_LOGIC;
		in_data : IN STD_LOGIC_VECTOR(127 downto 0);
		out_val : OUT STD_LOGIC;
		out_data : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));

END ENTITY;

ARCHITECTURE AES_arc OF AES IS

	COMPONENT AddKey IS
	PORT (
		clk : IN STD_LOGIC;
		state : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		key : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		newState : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
	END COMPONENT AddKey;

	COMPONENT KeyExpansion IS
	PORT (
		clk : IN STD_LOGIC;
		key : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		key_out : OUT STD_LOGIC_VECTOR(1407 DOWNTO 0));
	END COMPONENT;

	COMPONENT AESRound IS
	PORT (
		clk : IN STD_LOGIC;
		key : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		in_data : IN STD_LOGIC_VECTOR(127 downto 0);
		out_data : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
	END COMPONENT;

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

	SIGNAL state1, state2, state3, state4, state5 : STD_LOGIC_VECTOR(127 downto 0);
	SIGNAL state6, state7, state8, state9, state10 : STD_LOGIC_VECTOR(127 downto 0);
	SIGNAL state11, state12, state13, state14 : STD_LOGIC_VECTOR(127 downto 0);
	SIGNAL roundkeys : STD_LOGIC_VECTOR(1407 downto 0);
BEGIN

	U1 : AddKey PORT MAP(clk, in_data, key, state1); -- round 0
	U2 : KeyExpansion PORT MAP(clk, key, roundkeys);
	U3 : AESRound PORT MAP(clk, roundkeys(1279 downto 1152), state1, state2); --round 1
	U4 : AESRound PORT MAP(clk, roundkeys(1151 downto 1024), state2, state3); --round 2
	U5 : AESRound PORT MAP(clk, roundkeys(1023 downto 896), state3, state4); --round 3
	U6 : AESRound PORT MAP(clk, roundkeys(895 downto 768), state4, state5); --round 4
	U7 : AESRound PORT MAP(clk, roundkeys(767 downto 640), state5, state6); --round 5
	U8 : AESRound PORT MAP(clk, roundkeys(639 downto 512), state6, state7); --round 6
	U9 : AESRound PORT MAP(clk, roundkeys(511 downto 384), state7, state8); --round 7
	U10 : AESRound PORT MAP(clk, roundkeys(383 downto 256), state8, state9); --round 8
	U11 : AESRound PORT MAP(clk, roundkeys(255 downto 128), state9, state10); --round 9
	U12 : SubBytes PORT MAP(clk, state10, state11); --round 10
	U13 : ShiftRows PORT MAP(clk, state11, state12); --round 10
	U14 : AddKey PORT MAP(clk, state12, roundkeys(127 downto 0), state13); --round 10

	PROCESS (clk)
	BEGIN
		IF (RISING_EDGE(clk)) THEN
		out_data <= state14;

		END IF;

	END PROCESS;
	

END ARCHITECTURE;