library ieee;
use ieee.std_logic_1164.all;

entity AddKey is
 port(
	clk: in std_logic;
	state: in std_logic_vector(127 downto 0);
	key: in std_logic_vector(127 downto 0);
	newState: out std_logic_vector(127 downto 0));
end entity AddKey;

architecture rtl of AddKey is
	signal addition : std_logic_vector(127 downto 0);


--------------------------------------------------------------------------------------

	begin 
	clock : process (clk)
		begin
		if (rising_edge(Clock)) then 
			newState <= addition;
		end if;
	end process;

	addition(127 downto 120) <= state(127 downto 120) xor key(127 downto 120);
	addition(119 downto 112) <= state(127 downto 120) xor key(127 downto 120);
	addition(111 downto 104) <= state(127 downto 120) xor key(127 downto 120);
	addition(103 downto 96) <= state(127 downto 120) xor key(127 downto 120);
	addition(103 downto 96) <= state(127 downto 120) xor key(127 downto 120);
	addition(103 downto 96) <= state(127 downto 120) xor key(127 downto 120);
	addition(103 downto 96) <= state(127 downto 120) xor key(127 downto 120);
	addition(103 downto 96) <= state(127 downto 120) xor key(127 downto 120);
	addition(103 downto 96) <= state(127 downto 120) xor key(127 downto 120);

					 
end;





