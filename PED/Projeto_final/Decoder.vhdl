library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Decoder is

Port (
        v : buffer std_logic_vector(0 to 2);  
        val1 : in std_logic_vector(0 to 2);
        val2 : in std_logic_vector(0 to 2);
        clk2 : in std_logic;
        seg : out std_logic_vector(0 to 6);
        an : out std_logic_vector(0 to 3)
);

end Decoder;

architecture Behavioral of Decoder is

begin

an(1)<='1';
an(2)<='1';

v<= val1 when clk2='1' else
val2 when clk2='0';

an(0)<= clk2;
an(3)<= not clk2;

seg <= "1111111" when v="000" else
"1111110" when v = "001" else
"0110111" when v = "010" else
"0110110" when v = "011" else
"1001001" when v = "100" else
"1001000" when v = "101" else
"0000001" when v = "110" else
"1111111";

end Behavioral;
