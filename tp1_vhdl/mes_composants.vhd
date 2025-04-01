library ieee;
use ieee.std_logic_1164.all;

package mes_composants is
  
  component DCPT_M
    generic(M : natural := 8);
    port(clk: in std_logic;
         reset : in std_logic;
         ud : in std_logic;
         enable : in std_logic;
         cptr : out std_logic_vector(M-1 downto 0));
end component;

end mes_composants;