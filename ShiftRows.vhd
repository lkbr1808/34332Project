library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity ShiftRows is
	
	port(
			
			input : in std_logic_vector(127 downto 0);
			output : out std_logic_vector(127 downto 0);
			);
			
end entity;



--=======================================================
-- Architecture declaration
--=======================================================

architecture ShiftRows_arch of ShiftRows is

begin 

	output(127 downto 120) <= input(95 downto 88);
	output(119 downto 112) <= input(55 downto 48);
	output(111 downto 104) <= input(15 downto 8);
	output(103 downto 96) <= input(103 downto 96);
	output(95 downto 88) <= input(63 downto 56);
	output(87 downto 80) <= input(23 downto 16);
	output(79 downto 72) <= input(111 downto 104);
	output(71 downto 64) <= input(71 downto 64);
	output(63 downto 56) <= input(31 downto 24);
	output(55 downto 48) <= input(119 downto 112);
	output(47 downto 40) <= input(79 downto 72);
	output(39 downto 32) <= input(39 downto 32);
	output(31 downto 24) <= input(127 downto 120);
	output(23 downto 16) <= input(87 downto 80);
	output(15 downto 8) <= input(47 downto 40);
	output(7 downto 0) <= input(7 downto 0);


end architecture;
