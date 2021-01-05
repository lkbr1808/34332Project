LIBRARY ieee;
LIBRARY STD;
USE STD.textio.ALL;
USE ieee.std_logic_textio.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY SubBytes_TB IS
END ENTITY;

ARCHITECTURE SubBytes_TB_arc OF SubBytes_TB IS


	COMPONENT SubBytes IS
	PORT (
		clk      : IN STD_LOGIC;
		data_in  : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		data_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));

	END COMPONENT;

	SIGNAL clk : STD_LOGIC;
	SIGNAL data_in_TB, data_out_TB : STD_LOGIC_VECTOR(127 DOWNTO 0);

BEGIN
	stimulus : PROCESS
	BEGIN
		clk <= '0';
		WAIT FOR 5 ns;
		clk <= '1';
		WAIT FOR 5 ns;
	END PROCESS;

	DUT : SubBytes PORT MAP(clk, data_in_TB, data_out_TB);

	PROCESS BEGIN
	data_in_TB <= x"193de3bea0f4e22b9ac68d2ae9f84808"; wait for 30 ns;
	END PROCESS;

END ARCHITECTURE;
