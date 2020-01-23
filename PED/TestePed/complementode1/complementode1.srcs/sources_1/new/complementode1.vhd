----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.10.2019 10:32:43
-- Design Name: 
-- Module Name: complementode1 - Behavioral
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

entity complementode1 is
    Port ( Sel : in STD_LOGIC;
           B : in STD_LOGIC_VECTOR (2 downto 0);
           Z : out STD_LOGIC_VECTOR (2 downto 0));
end complementode1;

architecture Behavioral of complementode1 is

begin

WITH Sel SELECT
    Z <=  (not B) WHEN '1',
            B WHEN '0',
            B  WHEN OTHERS;
end Behavioral;
