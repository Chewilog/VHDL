----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.10.2019 11:10:41
-- Design Name: 
-- Module Name: overflow - Behavioral
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

entity overflow is
    Port ( A2 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           LED : out STD_LOGIC);
end overflow;

architecture Behavioral of overflow is

begin
LED <= '1' WHEN A2 = '1' AND B2 ='1' AND S2= '0' ELSE
       '1' WHEN A2 ='0' AND B2 ='0' AND S2='1' ELSE
       '0';

end Behavioral;
