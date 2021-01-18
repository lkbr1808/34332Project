LIBRARY ieee;
LIBRARY STD;
USE STD.textio.ALL;
USE ieee.std_logic_textio.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY KeyExpansion_TB IS
END ENTITY;

ARCHITECTURE KeyExpansion_TB_arc OF KeyExpansion_TB IS
	COMPONENT KeyExpansion IS
		PORT (
			clk, in_val : IN STD_LOGIC;
			key : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
			out_val : OUT STD_LOGIC;
			key_out : OUT STD_LOGIC_VECTOR(1407 DOWNTO 0));

	END COMPONENT;


	SIGNAL clk, in_val, out_val : STD_LOGIC;
	SIGNAL data_in_TB : STD_LOGIC_VECTOR(127 DOWNTO 0);
	SIGNAL data_out_TB : STD_LOGIC_VECTOR(1407 DOWNTO 0);

BEGIN
	stimulus : PROCESS
	BEGIN
		clk <= '0';
		WAIT FOR 5 ns;
		clk <= '1';
		WAIT FOR 5 ns;
	END PROCESS;

	DUT : KeyExpansion PORT MAP(clk, in_val, data_in_TB, out_val, data_out_TB);

	PROCESS BEGIN
		data_in_TB <= x"2b7e151628aed2a6abf7158809cf4f3c";
		in_val <= '1';
		WAIT FOR 50 ns;
	END PROCESS;

END ARCHITECTURE;