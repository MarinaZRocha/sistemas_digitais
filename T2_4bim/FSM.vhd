library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

entity FSM is 
port (bot : in integer; clk, rst : in std_logic; s : out std_logic);
end FSM;

architecture comportamento of FSM is

type state is (C, D, P);
signal agora, prox : state;

begin 

	sync : process(clk, rst, prox)
	begin
		if (rst = '1') then 
			agora <= C;
		elsif (rising_edge(clk)) then
			agora <= prox;
		end if;
	end process;
	
	logic : process(agora, bot)
	begin
	
		s <= '0';
		
		case (agora) is 
			when C => s <= '0'; -- conta crescente
			if (bot = 1) then
				prox <= D;
			elsif (bot = 0) then
				prox <= C;
			end if;
			when D => s <= '1'; -- conta decrescente
			if (bot = 1) then
				prox <= P;
			elsif (bot = 2)	then
				prox <= D;
			elsif (bot = 0)	then
				prox <= C;
			end if;
			when P => s <= '1'; -- para tudo
			
		end case;
	end process; 
end comportamento; 
		
				
	