LIBRARY ieee;
LIBRARY STD;
USE STD.textio.ALL;
USE ieee.std_logic_textio.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY AddKey_TB IS
END ENTITY;

ARCHITECTURE AddKey_TB_arc OF AddKey_TB IS


	COMPONENT AddKey IS
	PORT (
		clk      : IN STD_LOGIC;
		state, key  : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		newState : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));

	END COMPONENT;

	SIGNAL clk : STD_LOGIC;
	SIGNAL data_in_TB, data_out_TB, key_TB : STD_LOGIC_VECTOR(127 DOWNTO 0);

BEGIN
	stimulus : PROCESS
	BEGIN
		clk <= '0';
		WAIT FOR 5 ns;
		clk <= '1';
		WAIT FOR 5 ns;
	END PROCESS;

	DUT : AddKey PORT MAP(clk, data_in_TB, key_TB, data_out_TB);

	PROCESS BEGIN
	data_in_TB <= x"046681e5e0cb199a48f8d37a2806264c"; 
	key_TB <= x"a0fafe1788542cb123a339392a6c7605";
	wait for 30 ns;
	END PROCESS;

END ARCHITECTURE;