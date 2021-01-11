
LIBRARY ieee;
USE ieee.std_logic_textio.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY InverseSubBytes IS
	PORT (
		clk, in_val     : IN STD_LOGIC;
		data_in  : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		out_val : OUT STD_LOGIC;
		data_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));

END ENTITY;

ARCHITECTURE InverseSubBytes_arc OF InverseSubBytes IS

	COMPONENT InverseSubBytesROM 
    	PORT (
        clock, in_val : IN STD_LOGIC;
        address : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	out_VAL : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;

	SIGNAL data_temp : STD_LOGIC_VECTOR(127 DOWNTO 0);
	SIGNAL vals : STD_LOGIC_VECTOR(15 downto 0) := x"0000";

	BEGIN
	
	--IF (in_val = '1') THEN
		Hubba1  : InverseSubBytesROM PORT MAP(clk, in_val, data_in(127 downto 120), vals(0), data_temp(127 downto 120));
		Hubba2  : InverseSubBytesROM PORT MAP(clk, in_val, data_in(119 downto 112), vals(1), data_temp(119 downto 112));
		Hubba3  : InverseSubBytesROM PORT MAP(clk, in_val, data_in(111 downto 104), vals(2), data_temp(111 downto 104));
		Hubba4  : InverseSubBytesROM PORT MAP(clk, in_val, data_in(103 downto 96),  vals(3), data_temp(103 downto 96));
		Hubba5  : InverseSubBytesROM PORT MAP(clk, in_val, data_in(95  downto 88),  vals(4), data_temp(95  downto 88));
		Hubba6  : InverseSubBytesROM PORT MAP(clk, in_val, data_in(87  downto 80),  vals(5), data_temp(87  downto 80));
		Hubba7  : InverseSubBytesROM PORT MAP(clk, in_val, data_in(79  downto 72),  vals(6), data_temp(79  downto 72));
		Hubba8  : InverseSubBytesROM PORT MAP(clk, in_val, data_in(71  downto 64),  vals(7), data_temp(71  downto 64));
 		Hubba9  : InverseSubBytesROM PORT MAP(clk, in_val, data_in(63  downto 56),  vals(8), data_temp(63  downto 56));
		Hubba10 : InverseSubBytesROM PORT MAP(clk, in_val, data_in(55  downto 48),  vals(9), data_temp(55  downto 48));
		Hubba11 : InverseSubBytesROM PORT MAP(clk, in_val, data_in(47  downto 40),  vals(10), data_temp(47  downto 40));
		Hubba12 : InverseSubBytesROM PORT MAP(clk, in_val, data_in(39  downto 32),  vals(11), data_temp(39  downto 32));
		Hubba13 : InverseSubBytesROM PORT MAP(clk, in_val, data_in(31  downto 24),  vals(12), data_temp(31  downto 24));
		Hubba14 : InverseSubBytesROM PORT MAP(clk, in_val, data_in(23  downto 16),  vals(13), data_temp(23  downto 16));
		Hubba15 : InverseSubBytesROM PORT MAP(clk, in_val, data_in(15  downto 8),   vals(14), data_temp(15  downto 8));
		Hubba16 : InverseSubBytesROM PORT MAP(clk, in_val, data_in(7   downto 0),   vals(15), data_temp(7   downto 0)); 
	--END IF;

	incrementer : PROCESS (clk)
	BEGIN
		IF (RISING_EDGE(clk)) THEN
			IF (vals = x"ffff") THEN
				data_out <= data_temp;
				out_val <= '1';
			END IF;
		END IF;

	END PROCESS;



END ARCHITECTURE;