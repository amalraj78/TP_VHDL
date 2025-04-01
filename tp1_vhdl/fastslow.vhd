library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
USE ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use work.mes_composants.all;

entity fastslow is
  generic(M : natural :=10);
  port(clk,reset,incwrite,incread : in std_logic;
       fast,slow : out std_logic);
end entity;

architecture Behavioral of fastslow is
    signal cptl:std_logic_vector(M-1 downto 0):=(others=>'0');
    signal enable,ud : STD_LOGIC := '0';
    
begin
  DCPT_M1 : DCPT_M generic map(M)
    port map (
            enable => enable,
            ud     => ud,
            clk    => clk,
            reset  => reset,
            cptr   => cptl
        );
                   
    enable <= incwrite xor incread; 
    ud     <= NOT incwrite; 


    fast <= NOT cptl(M-2) or NOT cptl(M-1); 
    slow <= cptl(M-1) AND cptl(M-2); 

end Behavioral;  