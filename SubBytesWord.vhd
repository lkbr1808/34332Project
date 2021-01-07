LIBRARY ieee;
USE ieee.std_logic_textio.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY SubBytesWord IS
	PORT (
		clk      : IN STD_LOGIC;
		data_in  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		data_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));

END ENTITY;

ARCHITECTURE SubBytesWord_arc OF SubBytesWord IS

	COMPONENT SubBytesROM 
    	PORT (
        clock : IN STD_LOGIC;
        address : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;

	SIGNAL data_temp, index : STD_LOGIC_VECTOR(31 DOWNTO 0);

	BEGIN

	U1 : SubBytesROM PORT MAP(clk, index(31  downto 24),  data_temp(31  downto 24));
	U2 : SubBytesROM PORT MAP(clk, index(23  downto 16),  data_temp(23  downto 16));
	U3 : SubBytesROM PORT MAP(clk, index(15  downto 8),   data_temp(15  downto 8));
	U4 : SubBytesROM PORT MAP(clk, index(7   downto 0),   data_temp(7   downto 0)); 
	
	incrementer : PROCESS (clk)
	BEGIN
		IF (RISING_EDGE(clk)) THEN
			index <= data_in;
			data_out <= data_temp;
		END IF;

	END PROCESS;



END ARCHITECTURE;