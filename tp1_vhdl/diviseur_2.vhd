library ieee;
use ieee.std_logic_1164.all;

entity diviseur_2 is
  generic(tp: time:=3 ns);
  port(clk,reset : in std_logic;
      clk_out : out std_logic);
end entity;

Architecture Behavioral of diviseur_2 is
  signal q : STD_LOGIC :='0';
  begin
    process(clk,reset)
      begin
        if reset ='1' then
          q<='0' after tp;
      else if clk'event and clk='1' then
          q <= not q after tp;
    end if;
  end if;
  end process;
 clk_out <= q;
 end Behavioral;
 