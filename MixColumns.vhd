library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity MixColumns is

port (

input : in STD_LOGIC_VECTOR(127 DOWNTO 0);
output : out STD_LOGIC_VECTOR(127 DOWNTO 0));


end entity;

architecture MixColumns_Arch of MixColumns is

signal Fixed : STD_LOGIC_VECTOR(127 DOWNTO 0) := x"02030101010203010101020303010102" ;

begin

output(127 DOWNTO 120) <= (input(127 DOWNTO 120) AND Fixed(127 DOWNTO 120)) XOR 
								(input(95 DOWNTO 88) AND Fixed(119 DOWNTO 112)) XOR 
								(input(63 DOWNTO 56) AND Fixed(111 DOWNTO 104)) XOR 
								(input(31 DOWNTO 24) AND Fixed(103 DOWNTO 96));
								  
output(119 DOWNTO 112) <= (input(119 DOWNTO 112)   AND Fixed(127 DOWNTO 120)) XOR
                                 
                          (input(87 DOWNTO 80)     AND Fixed(119 DOWNTO 112)) XOR
                                 
                          (input(55 DOWNTO 48)     AND Fixed(111 DOWNTO 104)) XOR
                                 
									(input(23 downto 16)	  AND Fixed(103 DOWNTO 96)) ;
									
output(111 DOWNTO 104) <= (input(111 DOWNTO 104)   AND Fixed(127 DOWNTO 120)) XOR
                                 
                          (input(79 DOWNTO 72)     AND Fixed(119 DOWNTO 112)) XOR
                                 
                          (input(47 DOWNTO 40)     AND Fixed(111 DOWNTO 104)) XOR
                                 
									(input(15 downto 8)	  AND Fixed(103 DOWNTO 96)) ;
								
							
output(103 DOWNTO 96) <= (input(103 DOWNTO 96)   AND Fixed(127 DOWNTO 120)) XOR
                                 
                          (input(71 DOWNTO 64)     AND Fixed(119 DOWNTO 112)) XOR
                                 
                          (input(39 DOWNTO 32)     AND Fixed(111 DOWNTO 104)) XOR
                                 
									(input(7 downto 0)	  AND Fixed(103 DOWNTO 96)) ;							
-----------------------------------------------------------------------------------	

output(95 DOWNTO 88) <= (input(127 DOWNTO 120)   AND Fixed(95 DOWNTO 88)) XOR
                        
                        (input(95 DOWNTO 88)       AND Fixed(87 DOWNTO 80)) XOR
                        
                        (input(63 DOWNTO 56)       AND Fixed(79 DOWNTO 72)) XOR
                        
								(input(31 DOWNTO 24)   	  AND Fixed(71 DOWNTO 64)) ;	

output(87 DOWNTO 80) <= (input(119 DOWNTO 112)    AND Fixed(95 DOWNTO 88)) XOR
                               
                        (input(87 DOWNTO 80)        AND Fixed(87 DOWNTO 80)) XOR
                               
                        (input(55 DOWNTO 48)        AND Fixed(79 DOWNTO 72)) XOR
                               
								(input(23 downto 16)	 	  AND Fixed(71 DOWNTO 64)) ;

output(79 DOWNTO 72) <= (input(111 DOWNTO 104)  AND Fixed(95 DOWNTO 88)) XOR
                               
                        (input(79 DOWNTO 72)      AND Fixed(87 DOWNTO 80)) XOR
                               
                        (input(47 DOWNTO 40)      AND Fixed(79 DOWNTO 72)) XOR
                               
								(input(15 downto 8)	  AND Fixed(71 DOWNTO 64)) ;
								
output(71 DOWNTO 64) <= (input(103 DOWNTO 96)   AND Fixed(95 DOWNTO 88)) XOR
                                
                         (input(71 DOWNTO 64)     AND Fixed(87 DOWNTO 80)) XOR
                                
                         (input(39 DOWNTO 32)     AND Fixed(79 DOWNTO 72)) XOR
                                
									(input(7 downto 0)	   AND Fixed(71 DOWNTO 64)) ;
--------------------------------------------------------------------------------									
																
output(63 DOWNTO 56) <= (input(127 DOWNTO 120)  AND Fixed(63 DOWNTO 56)) XOR
                        
                        (input(95 DOWNTO 88)      AND Fixed(55 DOWNTO 48)) XOR
                        
                        (input(63 DOWNTO 56)      AND Fixed(47 DOWNTO 40)) XOR
                        
								(input(31 DOWNTO 24)     AND Fixed(39 DOWNTO 32)) ;
								
output(55 DOWNTO 48) <= (input(119 DOWNTO 112)  AND Fixed(63 DOWNTO 56)) XOR
                               
                        (input(87 DOWNTO 80)      AND Fixed(55 DOWNTO 48)) XOR
                               
                        (input(55 DOWNTO 48)      AND Fixed(47 DOWNTO 40)) XOR
                               
								(input(23 downto 16)	   AND Fixed(39 DOWNTO 32)) ;
								
output(47 DOWNTO 40) <= (input(111 DOWNTO 104) AND Fixed(63 DOWNTO 56)) XOR
                               
                        (input(79 DOWNTO 72)     AND Fixed(55 DOWNTO 48)) XOR
                               
                        (input(47 DOWNTO 40)     AND Fixed(47 DOWNTO 40)) XOR
                               
								(input(15 downto 8)	  AND Fixed(39 DOWNTO 32)) ;

output(39 DOWNTO 32) <= (input(103 DOWNTO 96)  AND Fixed(63 DOWNTO 56)) XOR
                                
                         (input(71 DOWNTO 64)    AND Fixed(55 DOWNTO 48)) XOR
                                
                         (input(39 DOWNTO 32)    AND Fixed(47 DOWNTO 40)) XOR
                                
									(input(7 downto 0)	  AND Fixed(39 DOWNTO 32)) ;
	
--------------------------------------------------------------------------------	
	
output(31 DOWNTO 24) <= (input(127 DOWNTO 120) AND Fixed(31 DOWNTO 24)) XOR
                        
                        (input(95 DOWNTO 88)     AND Fixed(23 DOWNTO 16)) XOR
                        
                        (input(63 DOWNTO 56)     AND Fixed(15 DOWNTO 8)) XOR
                        
								(input(31 DOWNTO 24)    AND Fixed(7 DOWNTO 0)) ;
								
output(23 DOWNTO 16) <= (input(119 DOWNTO 112)  AND Fixed(31 DOWNTO 24)) XOR
                               
                        (input(87 DOWNTO 80)      AND Fixed(23 DOWNTO 16)) XOR
                               
                        (input(55 DOWNTO 48)      AND Fixed(15 DOWNTO 8)) XOR
                               
								(input(23 downto 16)	   AND Fixed(7 DOWNTO 0)) ;								

output(15 DOWNTO 8) <= (input(111 DOWNTO 104) AND Fixed(31 DOWNTO 24)) XOR
                              
                       (input(79 DOWNTO 72)      AND Fixed(23 DOWNTO 16)) XOR
                              
                       (input(47 DOWNTO 40)      AND Fixed(15 DOWNTO 8)) XOR
                              
								(input(15 downto 8)	   AND Fixed(7 DOWNTO 0)) ;		
							
output(7 DOWNTO 0) <= (input(103 DOWNTO 96)  AND Fixed(31 DOWNTO 24)) XOR
                              
                       (input(71 DOWNTO 64)       AND Fixed(23 DOWNTO 16)) XOR
                              
                       (input(39 DOWNTO 32)       AND Fixed(15 DOWNTO 8)) XOR
                              
							 	(input(7 downto 0)		   AND Fixed(7 DOWNTO 0)) ;							
					
end architecture;				
				

	