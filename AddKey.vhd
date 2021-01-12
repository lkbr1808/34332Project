LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY AddKey IS
	PORT (
		clk, in_val : IN STD_LOGIC;
		state : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		key : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		out_val : OUT STD_LOGIC;
		newState : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
END ENTITY AddKey;

ARCHITECTURE rtl OF AddKey IS
	SIGNAL addition : STD_LOGIC_VECTOR(127 DOWNTO 0);
	SIGNAL val1 : STD_LOGIC := '0';

BEGIN
	addition(127 DOWNTO 120) <= state(127 DOWNTO 120) XOR key(127 DOWNTO 120);
	addition(119 DOWNTO 112) <= state(119 DOWNTO 112) XOR key(119 DOWNTO 112);
	addition(111 DOWNTO 104) <= state(111 DOWNTO 104) XOR key(111 DOWNTO 104);
	addition(103 DOWNTO 96) <= state(103 DOWNTO 96) XOR key(103 DOWNTO 96);
	addition(95 DOWNTO 88) <= state(95 DOWNTO 88) XOR key(95 DOWNTO 88);
	addition(87 DOWNTO 80) <= state(87 DOWNTO 80) XOR key(87 DOWNTO 80);
	addition(79 DOWNTO 72) <= state(79 DOWNTO 72) XOR key(79 DOWNTO 72);
	addition(71 DOWNTO 64) <= state(71 DOWNTO 64) XOR key(71 DOWNTO 64);
	addition(63 DOWNTO 56) <= state(63 DOWNTO 56) XOR key(63 DOWNTO 56);
	addition(55 DOWNTO 48) <= state(55 DOWNTO 48) XOR key(55 DOWNTO 48);
	addition(47 DOWNTO 40) <= state(47 DOWNTO 40) XOR key(47 DOWNTO 40);
	addition(39 DOWNTO 32) <= state(39 DOWNTO 32) XOR key(39 DOWNTO 32);
	addition(31 DOWNTO 24) <= state(31 DOWNTO 24) XOR key(31 DOWNTO 24);
	addition(23 DOWNTO 16) <= state(23 DOWNTO 16) XOR key(23 DOWNTO 16);
	addition(17 DOWNTO 8) <= state(17 DOWNTO 8) XOR key(17 DOWNTO 8);
	addition(7 DOWNTO 0) <= state(7 DOWNTO 0) XOR key(7 DOWNTO 0);

	clock : PROCESS (clk)
	BEGIN
		IF (rising_edge(clk)) THEN
			IF (in_val = '1') THEN
				val1 <= '1';
			END IF;
			IF (val1 = '1') THEN
				newState <= addition;
				out_val <= '1';
			END IF;
		END IF;
	END PROCESS;

END;