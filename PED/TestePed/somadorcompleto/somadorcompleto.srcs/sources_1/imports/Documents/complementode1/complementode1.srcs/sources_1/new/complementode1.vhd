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
           A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0));
end complementode1;

architecture Behavioral of complementode1 is

    signal C1, C2,C3: STD_LOGIC;
    signal Zs :STD_LOGIC_VECTOR (2 downto 0);
    signal Sof : STD_LOGIC;

component somador
port(
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           Ci : in STD_LOGIC;
           Ca : out STD_LOGIC;
           S : out STD_LOGIC);
end component;

component overflow
port(
           A2 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           LED : out STD_LOGIC);
end component;

begin

WITH Sel SELECT
    Zs <=  (not B) WHEN '1',
            B WHEN '0',
            B  WHEN OTHERS;
            
somador1: somador port map (
          A => A(0),
          B => Zs(0),
          Ci => Sel,
          Ca => C1,
          S => S(0)
          );


somador2: somador port map (
          A => A(1),
          B => Zs(1),
          Ci => C1,
          Ca => C2,
          S => S(1)
          );
somador3: somador port map (
          A => A(2),
          B => Zs(2),
          Ci => C2,
          Ca => C3,
          S => Sof
          
          );
   S(2) <= Sof;
overflow1: overflow port map(
        A2 =>  A(2),
        B2 =>  B(2),
        S2 =>  Sof,
        LED => S(3)
        );

 
end Behavioral;