----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.11.2019 09:43:31
-- Design Name: 
-- Module Name: num_load - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity num_load is
    Port (
        J1 : in std_logic;--btnL
        J2 : in std_logic;--btnR
        load1 : buffer std_logic;
        load2 : buffer std_logic;
        time1 : buffer std_logic);
end num_load;

architecture Behavioral of num_load is
    signal ck : std_logic;
    signal q : std_logic:='0';
    signal chTime:std_logic:='0';
    begin
    load1<= J1 and not q;
    load2<=J2 and q;
	time1<= not q;
    chTime<=load1 or load2;
        process(chTime)
        begin
            if falling_edge(chTime)then
                q<=not q;
            end if;
        end process;
   
end Behavioral;
