library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_signed.all;

use IEEE.std_logic_unsigned.all;


entity DReg is 
	port( q 					:	out std_logic_vector(0  to 15);
			i 					: 	in	  std_logic_vector(0 to 15);	
	        bt1, bt2			:	in   std_logic;
			clk				:   in   std_logic 
			);
end entity;			
			
architecture ADReg of DReg is
signal c1hz 			:	std_logic  :='0';	
signal s 				: 	std_logic  :='0';
signal inter            :   std_logic  :='0';    
begin
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
	
	process(bt1)
	begin
		if rising_edge(bt1) then
			s <= not s;
		end if;	
	end process;
	
	process(bt2)
	begin
		if rising_edge(bt2) then	
			for j in 0 to 15 loop
				q[j] <= i[j];
			end loop;
		end if;	
	end process;
	
	process(c1hz,s)
		variable d : std_logic :='0';
	begin
		if rising_edge(c1hz) then
			if bt1='0' then
				d <= q[15];
				for j in q'low to q'high loop
					q[j+1] <= q[j];
				end loop;
				q[0]<=d;
			if bt1='1' then
				d <= q[0];
				for j in 14 downto 0 loop
					q[j-1] <= q[j];
				end loop;
				q[14] <= d;	
		end if;	
	end process;	

end architecture;				