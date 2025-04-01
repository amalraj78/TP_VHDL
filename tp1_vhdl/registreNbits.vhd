library ieee;
use ieee.std_logic_1164.all ;
use work.CHECK_PKG.all;

entity registreNbits is
  generic(N : natural := 8;
          t_setup : time := 1 ns;
          t_hold : time := 1 ns );
  port ( Q, Qb : out STD_LOGIC_vector(N-1 downto 0);
          D : in STD_LOGIC_vector(N-1 downto 0);
          CLK, reset : in STD_LOGIC);
end registreNbits;

--------------------------------------------------------

architecture registreNbits of registreNbits is
  begin
    check_setup(clk,D,t_setup);
    check_hold(clk,D,t_hold);
    process(CLK, reset)
      begin
        if reset = '1' then Q <= (others=>'0') ; Qb <= (others => '1'); 
      else
        if (CLK = '1' and CLK'event) then      
          Q <= D; Qb <= not D;
          
        end if;
      end if;
  end process;
  
end registreNbits;