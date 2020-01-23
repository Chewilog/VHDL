library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity muxP is
port(
		in0, in1      : in STD_LOGIC_VECTOR (1 downto 0);
		sel           : in   bit;
		q             :inout STD_LOGIC_VECTOR (1 downto 0);
		d             : out bit
        );
end entity;
architecture arcMux of muxP is		
begin
--q é a saída do circuito
	q <= in0 when sel='0' 
			else in1;
	d <= '1' when q = "00"
	     else '1' when q = "10"
	     else '0';  
end architecture;	