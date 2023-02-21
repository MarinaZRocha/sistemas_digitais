library ieee;
use ieee.std_logic_1164.all;

entity Contador is

generic 
(
	tamanho : integer := 7 
);
port
(
	CLK, reset : in std_logic;
	Q, nQ, Q_D: out std_logic_vector(tamanho downto 0)
);
end Contador;

architecture comportamento of Contador is

signal temp : std_logic_vector( tamanho+1 downto 0);
signal socorro: std_logic_vector( tamanho downto 0);

begin

	gen_auto : for i in 0 to tamanho generate

		temp(0) <= clk;

		FF_jk : work.jk port map(
				j => '1', k => '1', CLK => temp(i), reset => reset,
				Q => socorro(i), nQ => temp(i+1) 
				);
						
		Q(i) <=  socorro(i);
		Q_D(i) <= not socorro(i);

	end generate gen_auto;
end comportamento;