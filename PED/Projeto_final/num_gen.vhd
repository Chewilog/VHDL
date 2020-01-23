----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.11.2019 21:08:29
-- Design Name: 
-- Module Name: num_gen - Behavioral
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

entity num_gen is
Port (clk1, load1, load2 :in std_logic:='0';
      num1, num2         :out std_logic_vector(0 to 2):="000");
end num_gen;

architecture Behavioral of num_gen is

    component contador_circular 
        port(Ck :in std_logic;
             Q  :out std_logic_vector(0 to 2));
    end component; 
    
    component Flip_Flop_D
        port(Ck, D : in std_logic;
             Q  : out std_logic);
    end component;
    
    signal num : std_logic_vector(0 to 2):="000";
begin
   
   sc:  contador_circular PORT MAP(Ck => clk1, Q => num);
   ff1_0: Flip_Flop_D       PORT MAP(Ck => load1, D => num(0), Q => num1(0));
   ff1_1: Flip_Flop_D       PORT MAP(Ck => load1, D => num(1), Q => num1(1));
   ff1_2: Flip_Flop_D       PORT MAP(Ck => load1, D => num(2), Q => num1(2));
   ff2_0: Flip_Flop_D       PORT MAP(Ck => load2, D => num(0), Q => num2(0));
   ff2_1: Flip_Flop_D       PORT MAP(Ck => load2, D => num(1), Q => num2(1));
   ff2_2: Flip_Flop_D       PORT MAP(Ck => load2, D => num(2), Q => num2(2));
end Behavioral;