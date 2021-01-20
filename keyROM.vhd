LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY keyROM IS
    PORT (
        clock, in_val : IN STD_LOGIC;
        address : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        out_val : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
END ENTITY;

ARCHITECTURE keyROM_ARC OF keyROM IS

    TYPE ROM_type IS ARRAY(0 TO 3) OF STD_LOGIC_VECTOR(127 DOWNTO 0);

    CONSTANT ROM : ROM_type := (
        0 => x"00000000000000000000000000000000",
        1 => x"10a58869d74be5a374cf867cfb473859",
        2 => x"00000000000000000000000000000000",
        3 => x"caea65cdbb75e9169ecd22ebe6e54675");

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