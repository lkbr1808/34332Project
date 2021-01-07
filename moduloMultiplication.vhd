

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY moduloMultiplication IS
	PORT (
		clk : IN STD_LOGIC;
		const, input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY moduloMultiplication;

ARCHITECTURE rtl OF moduloMultiplication IS

	SIGNAL newVal : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL leftShift : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

	leftShift <= input(6 DOWNTO 0) & '0';

	newVal <= leftShift XOR x"1B" WHEN (const = (x"02") AND input(7) = '1') ELSE
		leftShift WHEN (const = (x"02") AND input(7) = '0') ELSE
		leftShift XOR x"1B" XOR input WHEN (const = (x"03") AND input(7) = '1') ELSE
		leftShift XOR input;

	PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			output <= newVal;

		END IF;

	END PROCESS;
END;