library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

entity bcd_decoder is
	
	generic (tami : integer := 4; tamo : integer := 7);
	port (ent : in std_logic_vector (tami - 1 downto 0); s : out std_logic_vector (tamo - 1 downto 0));
end bcd_decoder;
	
architecture comportamento of bcd_decoder is

	begin
		process (ent)
	begin
		case ent is 
			when "0000" => s <= "1111110"; -- 0     
         when "0001" => s <= "0110000"; -- 1 
			when "0010" => s <= "1101101"; -- 2 
			when "0011" => s <= "1111001"; -- 3 
			when "0100" => s <= "0110011"; -- 4 
			when "0101" => s <= "1011011"; -- 5 
			when "0110" => s <= "1011111"; -- 6 
			when "0111" => s <= "1110000"; -- 7 
			when "1000" => s <= "1111111"; -- 8     
			when "1001" => s <= "1111011"; -- 9 
			when "1010" => s <= "1110111"; -- A
			when "1011" => s <= "0011111"; -- B
			when "1100" => s <= "1001110"; -- C
			when "1101" => s <= "0111101"; -- D
			when "1110" => s <= "1001111"; -- E
			when "1111" => s <= "1000111"; -- F
		end case;
	end process;
end comportamento;
