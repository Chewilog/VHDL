library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;



entity clk_div is 
	port(
			
			clk				:   in   std_logic:='0' ;
--			clk1,clk2,clk3:   out std_logic;
			clk1,clk2,clk3:   buffer std_logic:='0'
--			sclk1,sclk2,sclk3: buffer std_logic:='0'
			);
end entity;			
			
architecture A_clk_div of clk_div is
--signal sclk1 			    :	std_logic  :='0';--buffer	
--signal sclk2 				: 	std_logic  :='0';--buffer
--signal sclk3                :   std_logic  :='0';  --buffer  

begin
--clk1<=sclk1;
--clk2<=sclk2;
--clk3<=sclk3;

	process(clk)  
        variable count: integer:=0;
    begin
        if rising_edge(clk) then
            count:=count+1;
            if count=50 then 
                count:=0;
                clk1 <= not clk1;   
            end if;
        end if;
    end process;
	
	process(clk1)  
        variable count1: integer:=0;
    begin
        if rising_edge(clk1) then
            count1:=count1+1;
            if count1=20000 then 
                count1:=0;
                clk2 <= not clk2;   
            end if;
        end if;
    end process;
	
	process(clk2)  
        variable count2: integer:=0;
    begin
        if rising_edge(clk2) then
            count2:=count2+1;
            if count2=50 then 
                count2:=0;
                clk3 <= not clk3;   
            end if;
        end if;
    end process;

end architecture;				