library ieee;
use ieee.std_logic_1164.all;

entity div_clk is
port( clk, rst: in std_logic; clko : out std_logic);
end div_clk;

architecture comportamento of div_clk is

signal count : integer range 0 to 2;
signal aux : std_logic := '0';
constant t : integer := 2;

begin 

process(clk, rst)
begin 

	if rst = '0' then
		count <= 0;
		aux <= '0';
	elsif (rising_edge(clk)) then
	
		count <= count + 1;
		
		if (count = t) then
			aux <= not aux;
			count <= 0;
			
		end if;
	end if;
clko <= aux;
end process;
end comportamento;
	