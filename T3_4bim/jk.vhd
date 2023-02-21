library ieee;
use ieee.std_logic_1164.all;

entity jk is
port
(
	j, k, CLK, reset : in std_logic;
	Q, nQ : out std_logic
);
end jk;

architecture comportamento of jk is

	signal j_k    : std_logic_vector(1 downto 0) := "00";  
signal qx : std_logic;


 begin  
     j_k  <= j & k;  
 process(reset,CLK)  
 begin  
     if (reset = '0') then qx <='0';  
     elsif (CLK'event and CLK = '1') then  
         case (j_k) is  
             when "00"   => qx <= qx;      
             when "01"   => qx <= '0';  
             when "10"   => qx <= '1';  
             when others => qx <= not qx;  
         end case;  
     end if;  
 end process;
  
 Q <= qx;
 nQ <= not qx; 
 end comportamento;  