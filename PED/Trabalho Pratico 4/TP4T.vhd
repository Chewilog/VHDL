library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity DReg is 
	port( q 					:	out std_logic_vector(0  to 15):="1000000000000000";
	      i 					: 	in	  std_logic_vector(0 to 15):="1000000000000000";	
	        bt1, bt2			:	in   std_logic;
			clk			:   in   std_logic :='0'

			);
end entity;	

architecture ADReg of DReg is
signal c1hz     : std_logic                 := '0';	
signal normal   : std_logic_vector(0 to 15) := "1000000000000000";
signal shifted  : std_logic_vector(0 to 15) := "1000000000000000";
signal s 		: std_logic           := '0';
signal paralelo  : std_logic_vector(0 to 15) := "1000000000000000";
--signal normal2  : std_logic_vector(0 to 15) := "1000000000000000";
--signal normal3  : std_logic_vector(0 to 15) := "1000000000000000";
constant constante : unsigned(0 to 15) := "0000000000000001";
constant constante2 : unsigned(0 to 15) := "1000000000000000";

begin

q<=normal;

process(clk)  
        variable count: integer:=0;
    begin


        if rising_edge(clk) then
            count:=count+1;
            if count=50000000 then 
                count:=0;
                c1hz <= not c1hz;   
            end if;
        end if;
    end process;
    
process(bt1,s)
	begin
		if rising_edge(bt1) then
			s <= not s;
		end if;	
	end process;
--process(bt2,normal2,normal)
----variable normal2 :std_logic_vector(0 to 15);
--	begin
	   
		
--	end process;	
process(c1hz,bt2)
begin
    
	if rising_edge(c1hz) then
	   
	  if bt2='1' then
			normal<=i;
		
	   else
	   if s='1' then
	       if normal(0)='1' then
            shifted <= std_logic_vector(shift_left(unsigned(normal),1));
            normal<=std_logic_vector(unsigned(shifted)+constante);
           else
            shifted <= std_logic_vector(shift_left(unsigned(normal),1));
            normal <= shifted;
	       end if;
	   else 
	     if normal(15)='1' then  
            shifted <= std_logic_vector(shift_right(unsigned(normal),1));
            normal<=std_logic_vector(unsigned(shifted)+constante2);
         else
            shifted <= std_logic_vector(shift_right(unsigned(normal),1));
            normal <= shifted;
         end if;   
	   end if;
	end if;	
end if;	
	q<=normal;
end process;	


end architecture;