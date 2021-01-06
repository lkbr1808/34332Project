LIBRARY ieee;
USE ieee.std_logic_textio.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY KeyGenerate IS
	PORT (
		clk : IN STD_LOGIC;
		key : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		rcon : in STD_LOGIC_VECTOR(31 downto 0);
		key_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));

END ENTITY;

ARCHITECTURE KeyGenerate_arc OF KeyGenerate IS

COMPONENT SubBytesWord IS
	PORT (
		clk      : IN STD_LOGIC;
		data_in  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		data_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));

END COMPONENT;

SIGNAL first_word, temp_word : STD_LOGIC_VECTOR(31 downto 0);
SIGNAL word1, word2, word3, word4 : STD_LOGIC_VECTOR(31 downto 0);

BEGIN

	U1 : SubBytesWord PORT MAP(clk, first_word, temp_word);

	first_word(31 downto 8) <= key(23 downto 0);
	first_word(7 downto 0) <= key(31 downto 24);

	word1 <= key(127 downto 96) xor temp_word xor rcon;
	word2 <= key(95 downto 64) xor word1;
	word3 <= key(63 downto 32) xor word2;
	word4 <= key(31 downto 0) xor word3;

	PROCESS (clk)
	BEGIN
		IF (RISING_EDGE(clk)) THEN
			key_out(127 downto 96) <= word1;
			key_out(95 downto 64) <= word2;
			key_out(63 downto 32) <= word3;
			key_out(31 downto 0) <= word4;
		END IF;

	END PROCESS;


END ARCHITECTURE;