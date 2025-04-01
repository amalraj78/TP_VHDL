library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity RAM_2pMxNbits is
  generic(N : natural :=8 ; M : natural :=4);
  port(Din : in std_logic_vector((N-1) downto 0);
       Adr : in std_logic_vector((M-1) downto 0);
       RW_n, CS_n : in std_logic;
       Dout : out std_logic_vector((N-1) downto 0));
end entity;

Architecture ram of RAM_2pMxNbits is
  type memo is array (2**M downto 0) of std_logic_vector((N-1) downto 0);
  signal data : memo;
  begin
    process(CS_n, Adr, Din, RW_n)
      begin
        if CS_n='0' then
          if RW_n='0' then
            data(conv_integer(adr))<=Din;
            Dout <= (others => 'Z');
          elsif RW_n='1' then 
            Dout<=data(conv_integer(adr));
          end if;
        elsif CS_n='1' then
          Dout <= (others => 'Z');
        end if;
    end process;
end ram;
    
                
            


