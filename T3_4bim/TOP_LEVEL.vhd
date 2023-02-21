library ieee;
use ieee.std_logic_1164.all;
entity tOP_LEVEL is

generic (	tamanho : integer := 7; tami : integer := 4);
port
(
	button, reset, clk: in std_logic;
	saida: out std_logic_vector(tamanho downto 0);
	botas: out std_logic_vector(tamanho - 1 downto 0));
end tOP_LEVEL;

architecture comportamento of tOP_LEVEL is

signal crescente, decrescente , socorro: std_logic_vector(tamanho downto 0);
signal estado: std_logic_vector(1 downto 0);
signal seletor, clk_div, clk_choice: std_logic; 
signal creuza : std_logic_vector(tami - 1 downto 0);

begin

	divisor :work.clk_divider port map(
	clk => clk, reset => reset, 
	clk_out => clk_div);

	Contador :work.Contador port map(
	CLK => clk_choice, reset => reset,
	Q => crescente,  Q_D => decrescente);
	
	mux :work.mux2x1 port map(
	s => seletor, A => crescente, B => decrescente,
	X => socorro);
	
	Maquina_Estado : work.FMS port map(
	entrada => button, reset => reset, clk => clk,
	saida => estado);
	
	display : work.bcd_decoder port map(
	ent => creuza, s => botas);
	
	 process(estado)  
		 begin  
			  if (estado = "00") then seletor <= '1'; clk_choice <= clk_div;  
			  elsif (estado = "01") then seletor <= '0'; clk_choice <= clk_div;   
			  else clk_choice <= '0';
			  end if;  
	end process;
	
	saida <= socorro;
	creuza <= socorro(3) & socorro(2) & socorro(1) & socorro(0); 
	
end comportamento;