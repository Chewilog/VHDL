library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ETflip is
	port(
	
			ck 		    :   		in       std_logic;
			t,rs			:			in       std_logic;
			q				:			buffer std_logic;
			qn			:			out     std_logic
		
			);
end entity;

			
architecture ATflip of ETflip is
begin
qn <= not q;
		process(ck,rs)
			begin
			if(rs = '1') then q<='0';
			     elsif (ck'event and ck = '1' and t = '1') then q <= not q;		
			end if;
		end process;
end	architecture;	