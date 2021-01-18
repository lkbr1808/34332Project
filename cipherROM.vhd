LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY cipherROM IS
    PORT (
        clock, in_val : IN STD_LOGIC;
        address : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        out_val : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
END ENTITY;

ARCHITECTURE cipherROM_ARC OF cipherROM IS

    TYPE ROM_type IS ARRAY(0 TO 3) OF STD_LOGIC_VECTOR(127 DOWNTO 0);

    CONSTANT ROM : ROM_type := (
        0 => x"0336763e966d92595a567cc9ce537f5e",
        1 => x"6d251e6944b051e04eaa6fb4dbf78465",
        2 => x"a9a1631bf4996954ebc093957b234589",
        3 => x"6e29201190152df4ee058139def610bb");

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