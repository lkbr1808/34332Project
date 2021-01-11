LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY MixCalc IS
	PORT (
		clk, in_val : IN STD_LOGIC;
		state : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_val : OUT STD_LOGIC;
		state_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY MixCalc;

ARCHITECTURE rtl OF MixCalc IS

	COMPONENT moduloMultiplication IS
	PORT (
		clk, in_val : IN STD_LOGIC;
		const, input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		out_val : OUT STD_LOGIC;
		output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT moduloMultiplication;

	SIGNAL newState : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL double0, triple0, double1, triple1, double2, triple2, double3, triple3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL sig0, sig1, sig2, sig3 : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL vals : STD_LOGIC_VECTOR(7 downto 0) := x"00";
	SIGNAL val1, val2, val3, val4, val5, val6, val7, val8 : STD_LOGIC := '0';

BEGIN

	sig0 <= state(31 DOWNTO 24);
	sig1 <= state(23 DOWNTO 16);
	sig2 <= state(15 DOWNTO 8);
	sig3 <= state(7 DOWNTO 0);

	U1 : moduloMultiplication PORT MAP(clk, in_val, x"02", state(31 DOWNTO 24), vals(0), double0);
	U2 : moduloMultiplication PORT MAP(clk, in_val,  x"03", state(31 DOWNTO 24), vals(1), triple0);

	U3 : moduloMultiplication PORT MAP(clk, in_val,  x"02", state(23 DOWNTO 16), vals(2), double1);
	U4 : moduloMultiplication PORT MAP(clk, in_val,  x"03", state(23 DOWNTO 16), vals(3), triple1);

	U5 : moduloMultiplication PORT MAP(clk, in_val,  x"02", state(15 DOWNTO 8), vals(4), double2);
	U6 : moduloMultiplication PORT MAP(clk, in_val,  x"03", state(15 DOWNTO 8), vals(5), triple2);

	U7 : moduloMultiplication PORT MAP(clk, in_val,  x"02", state(7 DOWNTO 0), vals(6), double3);
	U8 : moduloMultiplication PORT MAP(clk, in_val,  x"03", state(7 DOWNTO 0), vals(7), triple3);

	newstate(31 DOWNTO 24) <= double0 xor triple1 xor sig2 xor sig3;
	newstate(23 DOWNTO 16) <= sig0 xor double1 xor triple2 xor sig3;
	newstate(15 DOWNTO 8) <= sig0 xor sig1 xor double2 xor triple3;
	newstate(7 DOWNTO 0) <= triple0 xor sig1 xor sig2 xor double3;

	PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF (vals = x"ff") THEN
				state_out <= newState;
				out_val <= '1';
			END IF;
		END IF;

	END PROCESS;

END;