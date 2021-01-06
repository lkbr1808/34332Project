LIBRARY ieee;
USE ieee.std_logic_textio.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY KEY_GENERATE IS
	PORT (
		clk : IN STD_LOGIC;
		key : STD_LOGIC_VECTOR(127 DOWNTO 0);
		rcon : OUT STD_LOGIC_VECTOR(31 downto 0);
		key_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));

END ENTITY;

ARCHITECTURE KEY_GENERATE_arc OF KEY_GENERATE IS

SIGNAL key_temp : STD_LOGIC_VECTOR(127 downto 0);

BEGIN

key_temp(127 downto 96) <= key(23 downto 0) @ key(31 downto 24)
	

END ARCHITECTURE;