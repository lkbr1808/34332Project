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

	-- Shifting 1st row
    output(127 downto 96) <= input(127 downto 96);

    -- Shifting 2nd row
    output(95 downto 88) <= input(87 downto 80);
    output(87 downto 80) <= input(79 downto 72);
    output(79 downto 72) <= input(71 downto 64);
    output(71 downto 64) <= input(95 downto 88);

    -- Shifting 3rd row
    output(63 downto 56) <= input(47 downto 40);
    output(55 downto 48) <= input(39 downto 32);
    output(47 downto 40) <= input(63 downto 56);
    output(39 downto 32) <= input(55 downto 48);

    -- Shifting 4th row
    output(31 downto 24) <= input(7 downto 0);
    output(23 downto 16) <= input(31 downto 24);
    output(15 downto 8) <= input(23 downto 16);
    output(7 downto 0) <= input(15 downto 8);


end architecture;
