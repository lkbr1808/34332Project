library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library STD;
use STD.textio.all;
use IEEE.std_logic_textio.all;


LIBRARY STD;
USE STD.textio.all;

entity ShiftRows_TB is
end entity;

architecture ShiftRows_TB_arch of ShiftRows_TB is

component ShiftRows_TB
	port (input : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
			output : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
			
			end component;
			
	signal input_TB, output_TB : STD_LOGIC_VECTOR(127 DOWNTO 0);

	begin

DUT: ShiftRows port map (input => input_TB,
								 output => output_TB);
								 
end architecture;