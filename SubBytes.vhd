LIBRARY ieee;
USE ieee.std_logic_textio.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY SubBytes IS
	PORT (
		clk      : IN STD_LOGIC;
		data_in  : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		data_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));

END ENTITY;

ARCHITECTURE SubBytes_arc OF SubBytes IS

	COMPONENT SubBytesROM 
    	PORT (
        clock : IN STD_LOGIC;
        address : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;

	SIGNAL data_temp, index : STD_LOGIC_VECTOR(127 DOWNTO 0);

	BEGIN

	U1  : SubBytesROM PORT MAP(clk, index(127 downto 120), data_temp(127 downto 120));
	U2  : SubBytesROM PORT MAP(clk, index(119 downto 112), data_temp(119 downto 112));
	U3  : SubBytesROM PORT MAP(clk, index(111 downto 104), data_temp(111 downto 104));
	U4  : SubBytesROM PORT MAP(clk, index(103 downto 96),  data_temp(103 downto 96));
	U5  : SubBytesROM PORT MAP(clk, index(95  downto 88),  data_temp(95  downto 88));
	U6  : SubBytesROM PORT MAP(clk, index(87  downto 80),  data_temp(87  downto 80));
	U7  : SubBytesROM PORT MAP(clk, index(79  downto 72),  data_temp(79  downto 72));
	U8  : SubBytesROM PORT MAP(clk, index(71  downto 64),  data_temp(71  downto 64));
 	U9  : SubBytesROM PORT MAP(clk, index(63  downto 56),  data_temp(63  downto 56));
	U10 : SubBytesROM PORT MAP(clk, index(55  downto 48),  data_temp(55  downto 48));
	U11 : SubBytesROM PORT MAP(clk, index(47  downto 40),  data_temp(47  downto 40));
	U12 : SubBytesROM PORT MAP(clk, index(39  downto 32),  data_temp(39  downto 32));
	U13 : SubBytesROM PORT MAP(clk, index(31  downto 24),  data_temp(31  downto 24));
	U14 : SubBytesROM PORT MAP(clk, index(23  downto 16),  data_temp(23  downto 16));
	U15 : SubBytesROM PORT MAP(clk, index(15  downto 8),   data_temp(15  downto 8));
	U16 : SubBytesROM PORT MAP(clk, index(7   downto 0),   data_temp(7   downto 0)); 
	
	incrementer : PROCESS (clk)
	BEGIN
		IF (RISING_EDGE(clk)) THEN
			index <= data_in;
			data_out <= data_temp;
		END IF;

	END PROCESS;



END ARCHITECTURE;