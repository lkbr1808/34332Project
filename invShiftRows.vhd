LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY invShiftRows IS

	PORT (
		clk, in_val : IN STD_LOGIC;
		input : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		out_val : OUT STD_LOGIC;
		out_data : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
END ENTITY;

--=======================================================
-- Architecture declaration
--=======================================================

ARCHITECTURE invShiftRows_arch OF invShiftRows IS
	SIGNAL output : STD_LOGIC_VECTOR(127 downto 0);
	SIGNAL val1 : STD_LOGIC := '0';
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

	PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF (in_val = '1') THEN
				val1 <= '1';
			END IF;
			
			
			IF (val1 = '1') THEN
				out_data <= output;
				out_val <= '1';
				val1 <= '0';
			ELSE 
				out_val <= '0';
			END IF;
		END IF;

	END PROCESS;


END ARCHITECTURE;