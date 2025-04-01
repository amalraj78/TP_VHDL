LIBRARY ieee  ; 
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity DCPT_M is
  generic(M:natural:=8);
  port( enable : in std_logic;
        ud : in std_logic;
        clk : in std_logic;
        reset : in std_logic;
        cptr : out std_logic_vector(M-1 downto 0));
end entity;

architecture Behavioral of DCPT_M is
  signal cpt:std_logic_vector(M-1 downto 0):=(others=>'0');
  begin
    process(clk,reset)
      begin
        if clk='1' and clk'event and reset='1' then
          cpt<=(others => '0');
      else if clk='1' and clk'event then
          if enable='1' then
            if ud='0' then cpt <= cpt+1;
            elsif ud='1' then cpt <= cpt-1;
          end if;
        end if;
      end if;
    end if;
  end process;
cptr <= cpt;
end;
      
          