LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY ShiftRows IS

	PORT (

		input : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		output : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
	);

END ENTITY;

--=======================================================
-- Architecture declaration
--=======================================================

ARCHITECTURE ShiftRows_arch OF ShiftRows IS

BEGIN

	output(8 * 16 - 1 DOWNTO 8 * 15) <= input(8 * 12 - 1 DOWNTO 8 * 11);
	output(8 * 15 - 1 DOWNTO 8 * 14) <= input(8 * 7 - 1 DOWNTO 8 * 6);
	output(8 * 14 - 1 DOWNTO 8 * 13) <= input(8 * 2 - 1 DOWNTO 8 * 1);
	output(8 * 13 - 1 DOWNTO 8 * 12) <= input(8 * 13 - 1 DOWNTO 8 * 12);
	output(8 * 12 - 1 DOWNTO 8 * 11) <= input(8 * 8 - 1 DOWNTO 8 * 7);
	output(8 * 11 - 1 DOWNTO 8 * 10) <= input(8 * 3 - 1 DOWNTO 8 * 2);
	output(8 * 10 - 1 DOWNTO 8 * 9) <= input(8 * 14 - 1 DOWNTO 8 * 13);
	output(8 * 9 - 1 DOWNTO 8 * 8) <= input(8 * 9 - 1 DOWNTO 8 * 8);
	output(8 * 8 - 1 DOWNTO 8 * 7) <= input(8 * 4 - 1 DOWNTO 8 * 3);
	output(8 * 7 - 1 DOWNTO 8 * 6) <= input(8 * 15 - 1 DOWNTO 8 * 14);
	output(8 * 6 - 1 DOWNTO 8 * 5) <= input(8 * 10 - 1 DOWNTO 8 * 9);
	output(8 * 5 - 1 DOWNTO 8 * 4) <= input(8 * 5 - 1 DOWNTO 8 * 4);
	output(8 * 4 - 1 DOWNTO 8 * 3) <= input(8 * 16 - 1 DOWNTO 8 * 15);
	output(8 * 3 - 1 DOWNTO 8 * 2) <= input(8 * 11 - 1 DOWNTO 8 * 10);
	output(8 * 2 - 1 DOWNTO 8 * 1) <= input(8 * 6 - 1 DOWNTO 8 * 5);
	output(8 * 1 - 1 DOWNTO 8 * 0) <= input(8 * 1 - 1 DOWNTO 8 * 0);
END ARCHITECTURE;