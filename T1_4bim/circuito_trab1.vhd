library ieee;
use ieee.std_logic_1164.all;

entity circuito_trab1 is
	port (a, b, cin : in std_logic; s, cout : out std_logic);
	end circuito_trab1;
	
architecture comportamento of circuito_trab1 is 

begin 

s <= a XOR b XOR cin;
cout <= (a and b) OR (Cin AND a) OR (Cin AND b);

end comportamento;