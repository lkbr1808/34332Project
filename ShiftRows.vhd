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

	-- Shifting 1st row
	output(127 DOWNTO 96) <= input(127 DOWNTO 96);

	-- Shifting 2nd row
	output(95 DOWNTO 88) <= input(87 DOWNTO 80);
	output(87 DOWNTO 80) <= input(79 DOWNTO 72);
	output(79 DOWNTO 72) <= input(71 DOWNTO 64);
	output(71 DOWNTO 64) <= input(95 DOWNTO 88);

	-- Shifting 3rd row
	output(63 DOWNTO 56) <= input(47 DOWNTO 40);
	output(55 DOWNTO 48) <= input(39 DOWNTO 32);
	output(47 DOWNTO 40) <= input(63 DOWNTO 56);
	output(39 DOWNTO 32) <= input(55 DOWNTO 48);

	-- Shifting 4th row
	output(31 DOWNTO 24) <= input(7 DOWNTO 0);
	output(23 DOWNTO 16) <= input(31 DOWNTO 24);
	output(15 DOWNTO 8) <= input(23 DOWNTO 16);
	output(7 DOWNTO 0) <= input(15 DOWNTO 8);
END ARCHITECTURE;