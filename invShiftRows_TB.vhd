LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY invShiftRows_TB IS
END ENTITY;

ARCHITECTURE invShiftRows_TB_Arch OF invShiftRows_TB IS
	COMPONENT invShiftRows
		PORT (
			clk, in_val : IN STD_LOGIC;
			input : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
			out_val : OUT STD_LOGIC;
			out_data : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
	END COMPONENT;
	SIGNAL clk : STD_LOGIC;
	SIGNAL input_TB, output_TB : STD_LOGIC_VECTOR(127 DOWNTO 0);
	SIGNAL in_val_TB, out_val_TB : STD_LOGIC;

BEGIN

	stimulus : PROCESS
	BEGIN
		clk <= '1';
		WAIT FOR 10 ns;
		clk <= '0';
		WAIT FOR 10 ns;
	END PROCESS;

	DUT : invShiftRows PORT MAP(clk, in_val_TB, input_TB, out_val_TB, output_TB);

	PROCESS BEGIN
		input_TB <= x"d4bf5d30e0b452aeb84111f11e2798e5";
		in_val_TB <= '1';
		WAIT FOR 30 ns;

	END PROCESS;

END ARCHITECTURE;