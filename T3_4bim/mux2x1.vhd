library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
generic 
(
	tamanho : integer := 7 
);
port
(
	S: in std_logic;
	A, B : in std_logic_vector(tamanho downto 0);
	X: out std_logic_vector(tamanho downto 0)
);
	
end mux2x1;

architecture comportamento of mux2x1 is

signal saida : std_logic_vector(tamanho downto 0);

 begin  
 process(S)  
 begin  
     if (S = '1') then saida <= A;  
     else saida <= b;
     end if;  
 end process;
  
X <= saida;
end comportamento;  