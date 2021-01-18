--=======================================================
--  Entity decleration
--=======================================================

--DE10_LITE_Empty_Top: 
--
-------------- CLOCK ----------
--input 		          		ADC_CLK_10,
--input 		          		MAX10_CLK1_50,
--input 		          		MAX10_CLK2_50,
--
-------------- SDRAM ----------
--output		    [12:0]		DRAM_ADDR,
--output		     [1:0]		DRAM_BA,
--output		          		DRAM_CAS_N,
--output		          		DRAM_CKE,
--output		          		DRAM_CLK,
--output		          		DRAM_CS_N,
--inout 		    [15:0]		DRAM_DQ,
--output		          		DRAM_LDQM,
--output		          		DRAM_RAS_N,
--output		          		DRAM_UDQM,
--output		          		DRAM_WE_N,
--
-------------- SEG7 ----------
--output		     [7:0]		HEX0,
--output		     [7:0]		HEX1,
--output		     [7:0]		HEX2,
--output		     [7:0]		HEX3,
--output		     [7:0]		HEX4,
--output		     [7:0]		HEX5,
--
-------------- KEY ----------
--input 		     [1:0]		KEY,
--
-------------- LED ----------
--output		     [9:0]		LEDR,
--
-------------- SW ----------
--input 		     [9:0]		SW,
--
-------------- VGA ----------
--output		     [3:0]		VGA_B,
--output		     [3:0]		VGA_G,
--output		          		VGA_HS,
--output		     [3:0]		VGA_R,
--output		          		VGA_VS,
--
-------------- Accelerometer ----------
--output		          		GSENSOR_CS_N,
--input 		     [2:1]		GSENSOR_INT,
--output		          		GSENSOR_SCLK,
--inout 		          		GSENSOR_SDI,
--inout 		          		GSENSOR_SDO,
--
-------------- Arduino ----------
--inout 		    [15:0]		ARDUINO_IO,
--inout 		          		ARDUINO_RESET_N,
--
-------------- GPIO, GPIO connect to GPIO Default ----------
--inout 		    [35:0]		GPIO
--=======================================================
-- Architecture declaration
--=======================================================
LIBRARY ieee;
USE ieee.std_logic_textio.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY DE10_LITE_Empty_Top IS
	PORT (
		ADC_CLK_10 : IN STD_LOGIC;
		SW : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		KEY : IN STD_LOGIC_VECTOR(1 DOWNTO 0);-- C
		HEX0, HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END ENTITY DE10_LITE_Empty_Top;

ARCHITECTURE rtl OF DE10_LITE_Empty_Top IS

	COMPONENT AES IS
		PORT (
			clk : IN STD_LOGIC;
			key : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
			in_val : IN STD_LOGIC;
			in_data : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
			out_val : OUT STD_LOGIC;
			out_data : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));

	END COMPONENT;

	--	COMPONENT invAES IS
	--	PORT (
	--		clk : IN STD_LOGIC;
	--		key : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
	--		in_val : IN STD_LOGIC;
	--		in_data : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
	--		out_val : OUT STD_LOGIC;
	--		out_data : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
	--
	--	END COMPONENT;

	COMPONENT dataROM IS
		PORT (
			clock, in_val : IN STD_LOGIC;
			address : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			out_val : OUT STD_LOGIC;
			data_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
	END COMPONENT;

	COMPONENT keyROM IS
		PORT (
			clock, in_val : IN STD_LOGIC;
			address : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			out_val : OUT STD_LOGIC;
			data_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
	END COMPONENT;

	COMPONENT cipherROM IS
		PORT (
			clock, in_val : IN STD_LOGIC;
			address : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			out_val : OUT STD_LOGIC;
			data_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
	END COMPONENT;

	SIGNAL val1, val3, val4, val5 : STD_LOGIC;
	SIGNAL val2 : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
	SIGNAL plainText, keyCipher, cipherText, finText : STD_LOGIC_VECTOR(127 DOWNTO 0);
	SIGNAL address, truths, fails : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";

BEGIN

	U0 : dataROM PORT MAP(ADC_CLK_10, val1, address, val2(0), plainText);
	U1 : keyROM PORT MAP(ADC_CLK_10, val1, address, val2(1), keyCipher);
	U2 : cipherROM PORT MAP(ADC_CLK_10, val1, address, val2(2), cipherText);

	U3 : AES PORT MAP(ADC_CLK_10, keyCipher, val3, plainText, val4, finText);
	--U3 : invAES port map (ADC_CLK_10, keyCipher, val4, cipherText, val5, finText);

	PROCESS (ADC_CLK_10)
	BEGIN
		IF (RISING_EDGE(ADC_CLK_10)) THEN
			IF (address < x"4") THEN

				IF (KEY(0) = '0') THEN
					address <= "00";
					val1 <= '0';
				ELSE

					IF (SW(0) = '1') THEN
						val1 <= '1';
						address <= address + '1';
						
						IF (val2 = "111") THEN
							val3 <= '1';
						ELSE
							val3 <= '0';
						END IF;

						IF (val4 = '1') THEN

							IF (cipherText = finText) THEN
								truths <= truths + '1';
							ELSE
								fails <= fails + '1';
							END IF;
						END IF;
						
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	WITH (truths) SELECT
	HEX0 <= "1000000" WHEN "00",
		"1111001" WHEN "01",
		"0100100" WHEN "10",
		"0110000" WHEN "11";

	WITH (fails) SELECT
	HEX1 <= "1000000" WHEN "00",
		"1111001" WHEN "01",
		"0100100" WHEN "10",
		"0110000" WHEN "11";

END;