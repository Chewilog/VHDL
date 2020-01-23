library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;
--use UNISIM.VComponents.all;

entity referee is
    Port ( num1 : in STD_LOGIC_VECTOR (0 to 2);
           num2 : in STD_LOGIC_VECTOR (0 to 2);
           val1 : out STD_LOGIC_VECTOR (0 to 2);
           val2 : out STD_LOGIC_VECTOR (0 to 2);
          time1 : in STD_LOGIC;
           clk3 : in STD_LOGIC);
end referee;

architecture a_referee of referee is
    SIGNAL win1 : STD_LOGIC := '0';
    SIGNAL win2 : STD_LOGIC := '0';   
    SIGNAL comp1 : STD_LOGIC := '0';
    SIGNAL comp2 : STD_LOGIC := '0';
    SIGNAL blink : STD_LOGIC := '0';
begin

    blink <= time1 AND clk3;
                            
    process (num1, num2)
    begin
        if num1 > num2 then
            comp1 <= '1';
        else
            comp1 <= '0';
        end if;
    end process;     
    
    process (num1, num2)
    begin
        if num2 > num1 then
            comp2 <= '1';
        else
            comp2 <= '0';
        end if;
    end process;
    
    win1 <= comp1 AND blink;
    win2 <= comp2 AND blink;
    
    with win1 select val1 <= num1 when '0',
                            "000" when others;
                            
    with win2 select val2 <= num2 when '0',
                            "000" when others;                                                     

end a_referee;
