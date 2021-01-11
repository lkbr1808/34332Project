
LIBRARY ieee;
LIBRARY STD;
USE STD.textio.ALL;
USE ieee.std_logic_textio.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY InverseSubBytes_TB IS
END ENTITY;

ARCHITECTURE InverseSubBytes_TB_arc OF InverseSubBytes_TB IS


	COMPONENT InverseSubBytes IS
	PORT (
		clk, in_val      : IN STD_LOGIC;
		data_in  : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		out_val  : OUT STD_LOGIC;
		data_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));

	END COMPONENT;

	SIGNAL clk, in_val_TB, out_val_TB : STD_LOGIC;
	SIGNAL data_in_TB, data_out_TB : STD_LOGIC_VECTOR(127 DOWNTO 0);

BEGIN
	stimulus : PROCESS
	BEGIN
		clk <= '0';
		WAIT FOR 5 ns;
		clk <= '1';
		WAIT FOR 5 ns;
	END PROCESS;

	DUT : InverseSubBytes PORT MAP(clk, in_val_TB, data_in_TB, out_val_TB, data_out_TB);

	PROCESS BEGIN
	data_in_TB <= x"10a58869d74be5a374cf867cfb473859";
	in_val_TB <= '1';
	wait for 30 ns;
	END PROCESS;

END ARCHITECTURE;