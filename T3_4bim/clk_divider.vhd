library ieee;
use ieee.std_logic_1164.all;

entity clk_divider is port 
	(
	clk, reset : in std_logic;
	clk_out : out std_logic
	);
end clk_divider;

architecture comportamento of clk_divider is

signal contador : integer range 0 to 5;
constant total : integer := 5;

begin
process(clk,reset)
begin	
	if reset = '0' then 
		contador <= 0;
		elsif falling_edge(clk) then 
		
			contador <= contador + 1;
			clk_out <= '0';

		if (contador = total) then 
				contador <= 0;
				clk_out <= '1';

		end if;
	end if;
end process;


end comportamento;