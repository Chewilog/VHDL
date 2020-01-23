library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;


entity Led is
port(
		clk: in std_logic;
		sw: in unsigned(6 downto 0);
		btn:in std_logic:='0';
		led: buffer std_logic:='0'
		);
end entity;
architecture A_Led of Led is 
signal s_clk : std_logic:='0';
signal valor : integer :=0;
begin
valor <= to_integer(unsigned(sw));
			process(clk,btn)
			variable count : integer :=0;
			begin
				if rising_edge(btn) then 
					count :=0;
				end if;	
				count:=count+1;
				if count = (10000000/valor) then -- vaor = numero bin --> int em sw
					s_clk <= not s_clk;
					
				end if;
			end process;
			
			process(s_clk,btn)
			begin
				if led = '0' then
					if rising_edge(btn) then
						led<='1';
					end if;
				end if;
				if led = '1' then		
					if rising_edge(s_clk) then 
						led <= '0';
					end if;
				end if;	
			end process;
			
			
end architecture;			