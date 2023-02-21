library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.ALL;

entity regis8_d is 
generic (tam : integer := 7);
port (clk, rst : in std_logic; c, c_d: out std_logic_vector(tam downto 0);  disp: out std_logic_vector(tam-1 downto 0));
end regis8_d;

architecture comportamento of regis8_d is
component FFJK is
	port (j, k, clk, rst : in std_logic; q, q_b : out std_logic);
end component;
component bcd_decoder is
	generic (tami : integer := 4; tamo : integer := 7);
	port (ent : in std_logic_vector (3 downto 0); s : out std_logic_vector (tamo - 1 downto 0));
end component;

signal temp : std_logic_vector(0 to tam);
signal temp_d: std_logic_vector(0 to tam);
signal clk_aux : std_logic;
signal aux : std_logic_vector (3 downto 0);

begin

	ent_clock : work.div_clk port map (
		clk => clk,
		rst => rst,
		clko => clk_aux);
		
	entidade : FFJK port map (
		rst => rst,
		clk => clk_aux,
		j => '1',
		k => '1',
		q => temp(7),
		q_b => temp_d(7));
		
facilita : for i in tam-1 downto 0 generate 
	entidade : FFJK port map (
		rst => rst,
		clk => temp(i+1),
		j => '1',
		k => '1',
		q => temp(i),
		q_b => temp_d(i));	
end generate facilita;
		c <= temp;
		c_d <= temp_d;
		aux <= temp(4) & temp(5) & temp(6) & temp(7);
		
ent_bcd : bcd_decoder port map (
		ent => aux,
		s => disp);
		
end comportamento;
