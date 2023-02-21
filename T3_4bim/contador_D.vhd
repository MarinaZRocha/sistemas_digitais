library ieee;
use ieee.std_logic_1164.all;
---------------Entidade------------------------
entity Contador_D is

generic 
(
	tamanho : integer := 7 
);
port
(
	CLK, reset : in std_logic;
	cl : out std_logic;
	Q, nQ : out std_logic_vector(tamanho downto 0)
);
end Contador_D;

--############################################--
--
architecture comportamento of Contador_D is

component jk is
port
(
	j, k, CLK, reset : in std_logic;
	Q, nQ : out std_logic
);
end component;
--
--
--component clk_divider is port 
--	(
--	clk, reset : in std_logic;
--	clk_out : out std_logic
--	);
--end component;

--############################################--

signal temp : std_logic_vector( tamanho+1 downto 0);
signal and_D : std_logic_vector( tamanho+1 downto 0);
--signal clock : std_logic;
begin
--
--CD : clk_divider port map(
--	clk => clk, reset => reset, clk_out => clock);
--	
--cl <= clock;

gen_auto : for i in 0 to tamanho generate

temp(0) <= clk;
FF_jk : jk port map(
		j => '1', k => '1', CLK => temp(i), reset => reset,
		Q => Q(i), nQ => temp(i+1)
		);
and_D <= Q(0) and Q(1) and Q(2) and Q(3) and Q(4) and Q(5) and Q(6) and Q(7);
 

end generate gen_auto;
end comportamento;