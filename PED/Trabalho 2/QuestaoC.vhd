entity seg is 
		port(entry			: in bit_vector (3 downto 0);
				cat 			:out bit_vector(6 downto 0)
				
					);
end entity;					
architecture segmentos of seg is
begin
cat <= "0000001"	when 	entry = "0000" else--0
			   "1001111"	when	entry = "0001" else--1
			   "0010010"	when	entry = "0010" else--2
			   "0000110"	when	entry = "0011" else--3
			   "1001100"	when	entry = "0100" else--4
			   "0100100"	when	entry = "0101" else--5
			   "0100000"	when	entry = "0110" else--6
               "0001111"	when	entry = "0111" else--7		   
			   "0000000"	when    entry = "1000" else--8
			   "0000100"	when    entry = "1001" else--9
			   "0001000"	when    entry = "1010" else--A
			   "1100000"	when    entry = "1011" else--B
			   "0110001"	when    entry = "1100" else--C
			   "1000010"	when    entry = "1101" else--D
			   "0110000"	when    entry = "1110" else--E
			   "0111000";--F
end architecture;			   