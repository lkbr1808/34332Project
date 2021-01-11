LIBRARY ieee;
USE ieee.std_logic_textio.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY SubBytes IS
	PORT (
		clk, in_val     : IN STD_LOGIC;
		data_in  : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		out_val : OUT STD_LOGIC;
		data_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));

END ENTITY;

ARCHITECTURE SubBytes_arc OF SubBytes IS

	COMPONENT SubBytesROM 
    	PORT (
        clock, in_val : IN STD_LOGIC;
        address : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	out_VAL : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;

	SIGNAL data_temp, index : STD_LOGIC_VECTOR(127 DOWNTO 0);
	SIGNAL vals : STD_LOGIC_VECTOR(15 downto 0) := x"0000";

	BEGIN

	Hubba1  : SubBytesROM PORT MAP(clk, in_val, index(127 downto 120), vals(0), data_temp(127 downto 120));
	Hubba2  : SubBytesROM PORT MAP(clk, in_val, index(119 downto 112), vals(1), data_temp(119 downto 112));
	Hubba3  : SubBytesROM PORT MAP(clk, in_val, index(111 downto 104), vals(2), data_temp(111 downto 104));
	Hubba4  : SubBytesROM PORT MAP(clk, in_val, index(103 downto 96),  vals(3), data_temp(103 downto 96));
	Hubba5  : SubBytesROM PORT MAP(clk, in_val, index(95  downto 88),  vals(4), data_temp(95  downto 88));
	Hubba6  : SubBytesROM PORT MAP(clk, in_val, index(87  downto 80),  vals(5), data_temp(87  downto 80));
	Hubba7  : SubBytesROM PORT MAP(clk, in_val, index(79  downto 72),  vals(6), data_temp(79  downto 72));
	Hubba8  : SubBytesROM PORT MAP(clk, in_val, index(71  downto 64),  vals(7), data_temp(71  downto 64));
 	Hubba9  : SubBytesROM PORT MAP(clk, in_val, index(63  downto 56),  vals(8), data_temp(63  downto 56));
	Hubba10 : SubBytesROM PORT MAP(clk, in_val, index(55  downto 48),  vals(9), data_temp(55  downto 48));
	Hubba11 : SubBytesROM PORT MAP(clk, in_val, index(47  downto 40),  vals(10), data_temp(47  downto 40));
	Hubba12 : SubBytesROM PORT MAP(clk, in_val, index(39  downto 32),  vals(11), data_temp(39  downto 32));
	Hubba13 : SubBytesROM PORT MAP(clk, in_val, index(31  downto 24),  vals(12), data_temp(31  downto 24));
	Hubba14 : SubBytesROM PORT MAP(clk, in_val, index(23  downto 16),  vals(13), data_temp(23  downto 16));
	Hubba15 : SubBytesROM PORT MAP(clk, in_val, index(15  downto 8),   vals(14), data_temp(15  downto 8));
	Hubba16 : SubBytesROM PORT MAP(clk, in_val, index(7   downto 0),   vals(15), data_temp(7   downto 0)); 
	
	incrementer : PROCESS (clk)
	BEGIN
		IF (RISING_EDGE(clk)) THEN
			IF (vals = x"ffff") THEN
				index <= data_in;
				data_out <= data_temp;
				out_val <= '1';
			END IF;
		END IF;

	END PROCESS;



END ARCHITECTURE;