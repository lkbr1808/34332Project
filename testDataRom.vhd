LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY dataROM IS
    PORT (
        clock, in_val : IN STD_LOGIC;
        address : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        out_val : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
END ENTITY;

ARCHITECTURE dataROM_ARC OF dataROM IS

    TYPE ROM_type IS ARRAY(0 TO 3) OF STD_LOGIC_VECTOR(127 DOWNTO 0);

    CONSTANT ROM : ROM_type := (
        0 => x"f34481ec3cc627bacd5dc3fb08f273e6",
        1 => x"00000000000000000000000000000000",
        2 => x"9798c4640bad75c7c3227db910174e72",
        3 => x"00000000000000000000000000000000");

BEGIN

    MEMORY : PROCESS (clock)
    BEGIN
        IF (rising_edge(clock)) THEN
            IF (in_val = '1') THEN
                data_out <= ROM(to_integer(unsigned(address)));
                out_val <= '1';
				ELSE 
					out_val <= '0';
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE;