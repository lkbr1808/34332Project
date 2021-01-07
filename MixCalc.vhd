LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY MixCalc IS
	PORT (
		clk : IN STD_LOGIC;
		state : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		state_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY MixCalc;
ARCHITECTURE rtl OF MixCalc IS
	SIGNAL newState : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL double0, triple0, double1, triple1, double2, triple2, double3, triple3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL sig0, sig1, sig2, sig3 : STD_LOGIC_VECTOR(7 downto 0);

	COMPONENT moduloMultiplication
		PORT (
			clk : IN STD_LOGIC;
			const, input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;
BEGIN

	--Checksum verification

	sig0 <= state(31 DOWNTO 24);
	sig1 <= state(23 DOWNTO 16);
	sig2 <= state(15 DOWNTO 8);
	sig3 <= state(7 DOWNTO 0);

	U1 : moduloMultiplication PORT MAP(clk, x"02", state(31 DOWNTO 24), double0);
	U2 : moduloMultiplication PORT MAP(clk, x"03", state(31 DOWNTO 24), triple0);

	U3 : moduloMultiplication PORT MAP(clk, x"02", state(23 DOWNTO 16), double1);
	U4 : moduloMultiplication PORT MAP(clk, x"03", state(23 DOWNTO 16), triple1);

	U5 : moduloMultiplication PORT MAP(clk, x"02", state(15 DOWNTO 8), double2);
	U6 : moduloMultiplication PORT MAP(clk, x"03", state(15 DOWNTO 8), triple2);

	U7 : moduloMultiplication PORT MAP(clk, x"02", state(7 DOWNTO 0), double3);
	U8 : moduloMultiplication PORT MAP(clk, x"03", state(7 DOWNTO 0), triple3);

	newstate(31 DOWNTO 24) <= double0 xor triple1 xor sig2 xor sig3;
	newstate(23 DOWNTO 16) <= sig0 xor double1 xor triple2 xor sig3;
	newstate(15 DOWNTO 8) <= sig0 xor sig1 xor double2 xor triple3;
	newstate(7 DOWNTO 0) <= triple0 xor sig1 xor sig2 xor double3;

	PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			state_out <= newState;
		END IF;

	END PROCESS;

END;