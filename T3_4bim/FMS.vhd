library ieee;
use ieee.std_logic_1164.all;

entity FMS is
	port (
		entrada, reset, clk : in std_logic;
		saida : out std_logic_vector(1 downto 0)
);
end FMS;
architecture comportamento of FMS is

type estado is (UP,DOWN,STOP);
signal estado_atual, proximo_estado : estado;

begin

	sincrono : process(clk,reset, proximo_estado)
	begin
		
		if(reset = '0') then
			estado_atual <= UP;
		elsif (rising_edge(entrada)) then 
			estado_atual <= proximo_estado;
		end if;
	end process;
	
	
	combinacional : process( estado_atual, entrada)
	begin
		
		saida <= "00";
		
		case(estado_atual) is 
------------------Crescente----------------------		
			when UP =>
				saida <= "00";
				proximo_estado <= DOWN;
			
-----------------Decrescente----------------------		
			when DOWN =>
				saida <= "01";
				proximo_estado <= STOP;
			
---------------------STOP-------------------------		
			when STOP =>
				saida <= "10";
				proximo_estado <= UP;
				
		end case;
	end process;
end comportamento;
				