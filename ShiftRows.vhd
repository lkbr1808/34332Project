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

	--Shifting 1st row
	output(127 downto 120) <= input(127 downto 120);
	output(95 downto 88) <= input(95 downto 88);
	output(63 downto 56) <= input(63 downto 56);
	output(31 downto 24) <= input(31 downto 24);
	
	--Shifting 2nd row
	output(119 downto 112) <= input(23 downto 16);
	output(87 downto 80) <= input(119 downto 112);
	output(55 downto 48) <= input(87 downto 80);
	output(23 downto 16) <= input(55 downto 48);
	--Shifting 3rd row
	output(111 downto 104) <= input(47 downto 40);
	output(79 downto 72) <= input(15 downto 8);
	output(47 downto 40) <= input(111 downto 104);
	output(15 downto 8) <= input(79 downto 72);
	--Shifting 4th row
	output(103 downto 96) <= input(71 downto 64);
	output(71 downto 64) <= input(39 downto 32);
	output(39 downto 32) <= input(7 downto 0);
	output(7 downto 0) <= input(103 downto 96);

	-- Shifting 1st row
	--output(127 DOWNTO 96) <= input(127 DOWNTO 96);

	-- Shifting 2nd row
	--output(95 DOWNTO 88) <= input(87 DOWNTO 80);
	--output(87 DOWNTO 80) <= input(79 DOWNTO 72);
	--output(79 DOWNTO 72) <= input(71 DOWNTO 64);
	--output(71 DOWNTO 64) <= input(95 DOWNTO 88);

	-- Shifting 3rd row
	--output(63 DOWNTO 56) <= input(47 DOWNTO 40);
	--output(55 DOWNTO 48) <= input(39 DOWNTO 32);
	--output(47 DOWNTO 40) <= input(63 DOWNTO 56);
	--output(39 DOWNTO 32) <= input(55 DOWNTO 48);

	-- Shifting 4th row
	--output(31 DOWNTO 24) <= input(7 DOWNTO 0);
	--output(23 DOWNTO 16) <= input(31 DOWNTO 24);
	--output(15 DOWNTO 8) <= input(23 DOWNTO 16);
	--output(7 DOWNTO 0) <= input(15 DOWNTO 8);
END ARCHITECTURE;