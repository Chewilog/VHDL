----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.11.2019 22:10:37
-- Design Name: 
-- Module Name: Flip_Flop_D - flipflopD
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

entity Flip_Flop_D is
        port(Ck, D : in std_logic;
             Q  : out std_logic);
end Flip_Flop_D;

architecture flipflopD of Flip_Flop_D is
        
begin
    process(Ck)
        begin
            if rising_edge(Ck) then 
                Q <= D;
            end if;
    end process;
end flipflopD;
