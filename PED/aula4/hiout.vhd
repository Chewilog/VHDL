
library ieee;
use ieee.std_logic_1164.all;

entity hiout is
    Port ( data0 : in std_logic;
           data1 : in std_logic;
           data2 : in std_logic;
           sel : in std_logic_vector (1 downto 0);
           bus_out : out std_logic );
end hiout;

architecture behavioral of hiout is
begin
    with sel select
        bus_out <= data0 when "00",
                   data1 when "01",
                   data2 when "10",
                     'Z' when others;
end behavioral;
