LIBRARY ieee;
LIBRARY STD;
USE STD.textio.ALL;
USE ieee.std_logic_textio.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY invSubBytes_TB IS
END ENTITY;

ARCHITECTURE invSubBytes_TB_arc OF invSubBytes_TB IS
	COMPONENT invSubBytes IS
		PORT (
			clk, in_val : IN STD_LOGIC;
			data_in : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
			out_val : OUT STD_LOGIC;
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

	DUT : invSubBytes PORT MAP(clk, in_val_TB, data_in_TB, out_val_TB, data_out_TB);

	PROCESS BEGIN
		data_in_TB <= x"10a58869d74be5a374cf867cfb473859";
		in_val_TB <= '1';
		WAIT FOR 30 ns;
	END PROCESS;

END ARCHITECTURE;