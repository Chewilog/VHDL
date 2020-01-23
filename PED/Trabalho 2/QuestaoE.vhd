library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity seg is 
		port(entry1			:in STD_LOGIC_VECTOR (2 downto 0);--entrada 1
			 entry2			:in STD_LOGIC_VECTOR (2 downto 0);--entrada 2	 
			 cat 			:out STD_LOGIC_VECTOR(6 downto 0);--vetor dos catodos do display  
			 an             :OUT bit_vector(0 to 3) 
			 );
end entity;					
architecture segmentos of seg is
    signal A      :  STD_LOGIC_VECTOR (3 downto 0);
    signal B      :  STD_LOGIC_VECTOR (3 downto 0);
    signal result :  STD_LOGIC_VECTOR (3 downto 0);
   
begin
A <= ('0'&entry1);
B <= ('0'&entry2);
result <= A + B; 


cat <= "0000001"	when 	result = "0000" else--0
			   "1001111"	when	result = "0001" else--1
			   "0010010"	when	result = "0010" else--2
			   "0000110"	when	result = "0011" else--3
			   "1001100"	when	result = "0100" else--4
			   "0100100"	when	result = "0101" else--5
			   "0100000"	when	result = "0110" else--6
               "0001111"	when	result = "0111" else--7		   
			   "0000000"	when    result = "1000" else--8
			   "0000100"	when    result = "1001" else--9
			   "0001000"	when    result = "1010" else--A
			   "1100000"	when    result = "1011" else--B
			   "0110001"	when    result = "1100" else--C
			   "1000010"	when    result = "1101" else--D
			   "0110000"	when    result = "1110" else--E
			   "0111000";--F;
			   AN <= "1110";
end architecture;			   