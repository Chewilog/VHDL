library ieee;
use ieee.std_logic_1164.all;

entity Dado is

	port(
			clk, J1, J2         : in   std_logic;--trocar nome pra J1 e J2
			an  			 	: out std_logic_vector(0 to 3);
			seg                 : out std_logic_vector(0 to 6);
			dp                  : out std_logic:='1'
			);
end entity;
architecture A_Dado of Dado is

--Antonio Igor Carvalho - 180030264
component Decoder 
	Port (
	       v:buffer std_logic_vector(0 to 2);
        val1 : in std_logic_vector(0 to 2);
        val2 : in std_logic_vector(0 to 2);
        clk2 : in std_logic;
        seg : out std_logic_vector(0 to 6);
        an : out std_logic_vector(0 to 3)
);
end component;

--Lucas Xavier de Moura - 180126083
component clk_div
    Port(
          clk           :   in  std_logic;
          clk1,clk2,clk3:   buffer std_logic  
         );
end component;    

--Francisco Mizael - 180113321
component  num_gen 
	Port (clk1, load1, load2 :in std_logic;
			num1, num2         :out std_logic_vector(0 to 2));
end component;

--Igor Queiroz Lima - 180122258
--Filipe Menezes Ribeiro Antunes - 180041762
component referee 
    Port ( num1 : in STD_LOGIC_VECTOR (0 to 2);
           num2 : in STD_LOGIC_VECTOR (0 to 2);
           val1 : out STD_LOGIC_VECTOR (0 to 2);
           val2 : out STD_LOGIC_VECTOR (0 to 2);
          time1 : in STD_LOGIC;
           clk3 : in STD_LOGIC);
end component;


--Rodrigo Carvalho dos Santos - 180027352
component num_load 
    Port (
        J1 : in std_logic;
        J2 : in std_logic;
        load1 : buffer std_logic;--buffer
        load2 : buffer std_logic;--buffer
        time1 : buffer std_logic--buffer
        );
end component; 

--clk_div
signal s_clk1:std_logic;--clock 2MHz
signal s_clk2:std_logic;--clock 100Hz
signal s_clk3:std_logic;--clock 2Hz
--num_load
signal s_load1:std_logic;--indica que o primeiro numero deve ser gerado
signal s_load2:std_logic;--indica que o segundo numero deve ser gerado
signal s_time1:std_logic;
----num_gen
signal s_num1:std_logic_vector(0 to 2);--Numero do primeiro jogador
signal s_num2:std_logic_vector(0 to 2);--Numero do segundo jogador
----referee
signal s_val1:std_logic_vector(0 to 2);
signal s_val2:std_logic_vector(0 to 2);

begin			
C1:clk_div    port map(clk=>clk, clk1=>s_clk1, clk2=>s_clk2, clk3=>s_clk3 );
C2:num_gen    port map(clk1=>s_clk1, load1=>s_load1, load2=>s_load2, num1=>s_num1, num2=>s_num2);
C3:referee    port map(num1=>s_num1, num2=>s_num2, val1=>s_val1, val2=>s_val2, time1=>s_time1, clk3=>s_clk3);
C4:Decoder    port map(val1=>s_val1, val2=>s_val2, clk2=>s_clk2, seg=>seg, an=>an,v=>open);
C5:num_load   port map(J1=>J1, J2=>J2, load1=>s_load1, load2=>s_load2, time1=>s_time1);

end architecture;