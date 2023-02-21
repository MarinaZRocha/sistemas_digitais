library ieee;
use ieee.std_logic_1164.all;

entity FFJK is 
	port (j, k, clk, rst : in std_logic; q, q_b : out std_logic);
end FFJK;

architecture comportamento of FFJK is 
signal jk : std_logic_vector(1 downto 0) := "00";
signal qs : std_logic;

begin

	jk <= j & k;
	
process(clk, rst)
	begin
		if (rst = '0') then	qs <= '0';
		elsif (falling_edge(clk)) then
			case (jk) is
				when "00" => qs <= qs;
				when "01" => qs <= '0';
				when "10" => qs <= '1';
				when "11" => qs <= not qs;
			end case;
		end if;
end process;

q <= qs;
q_b <= not qs;
end comportamento;