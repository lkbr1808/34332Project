LIBRARY ieee;
USE ieee.std_logic_textio.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY KeyExpansion IS
	PORT (
		clk : IN STD_LOGIC;
		key : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		key_out : OUT STD_LOGIC_VECTOR(1407 DOWNTO 0));

END ENTITY;

ARCHITECTURE KeyExpansion_arc OF KeyExpansion IS

	COMPONENT KeyGenerate IS
	PORT (
		clk : IN STD_LOGIC;
		key : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		rcon : IN STD_LOGIC_VECTOR(31 downto 0);
		key_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));

	END COMPONENT;

	SIGNAL key1, key2, key3, key4 : STD_LOGIC_VECTOR(127 downto 0);
	SIGNAL key5, key6, key7, key8 : STD_LOGIC_VECTOR(127 downto 0);
	SIGNAL key9, key10, key11 : STD_LOGIC_VECTOR(127 downto 0);

BEGIN

	U1 : KeyGenerate PORT MAP(clk, key,  x"01000000", key1);
	U2 : KeyGenerate PORT MAP(clk, key1, x"02000000", key2);
	U3 : KeyGenerate PORT MAP(clk, key2, x"04000000", key3);
	U4 : KeyGenerate PORT MAP(clk, key3, x"08000000", key4);
	U5 : KeyGenerate PORT MAP(clk, key4, x"10000000", key5);
	U6 : KeyGenerate PORT MAP(clk, key5, x"20000000", key6);
	U7 : KeyGenerate PORT MAP(clk, key6, x"40000000", key7);	
	U8 : KeyGenerate PORT MAP(clk, key7, x"80000000", key8);
	U9 : KeyGenerate PORT MAP(clk, key8, x"1b000000", key9);
	U10 : KeyGenerate PORT MAP(clk, key9, x"36000000", key10);

	PROCESS (clk)
	BEGIN
		IF (RISING_EDGE(clk)) THEN
			key_out(1407 downto 1280) <= key;
			key_out(1279 downto 1152) <= key1;
			key_out(1151 downto 1024) <= key2;
			key_out(1023 downto 896) <= key3;
			key_out(895 downto 768) <= key4;
			key_out(767 downto 640) <= key5;
			key_out(639 downto 512) <= key6;
			key_out(511 downto 384) <= key7;
			key_out(383 downto 256) <= key8;
			key_out(255 downto 128) <= key9;
			key_out(127 downto 0) <= key10;

		END IF;

	END PROCESS;
	

END ARCHITECTURE;