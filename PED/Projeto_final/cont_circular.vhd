----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.11.2019 17:07:43
-- Design Name: 
-- Module Name: contador_circular - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity contador_circular is
    port(Ck :in std_logic;
         Q  :out std_logic_vector(0 to 2));
end contador_circular;

architecture Contador of contador_circular is

signal tmp :  std_logic_vector(0 to 2) := "001";
begin
    process(Ck,tmp)
        begin 
            if rising_edge(Ck) then 
                tmp <= tmp + 1;
            end if;
            if tmp = "111" then
                tmp <= "001";
            end if;
   end process;
   Q <= tmp;         
end Contador;

