library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FIFO_tb is
end ;

architecture Behavioral of FIFO_tb is
  constant N : natural := 8;  
  constant CLK_PERIOD : time := 10 ns;  

  -- Signaux
  signal clk : std_logic := '0';
  signal reset : std_logic := '1';
  signal req : std_logic := '1';
  signal Din : std_logic_vector(N-1 downto 0) := (others => '0');
  signal ack : std_logic;
  signal HL : std_logic;
  signal fast : std_logic;
  signal slow : std_logic;
  signal Data_out : std_logic_vector(N-1 downto 0);

begin
  UUT : entity work.FIFO
    generic map(N => N)
    port map(
      clk => clk,
      reset => reset,
      req => req,
      Din => Din,
      ack => ack,
      HL => HL,
      fast => fast,
      slow => slow,
      Data_out => Data_out
    );

  -- G�n�ration de l'horloge
  process
  begin
    clk <= '1';
    wait for CLK_PERIOD / 2;
    clk <= '0';
    wait for CLK_PERIOD / 2;
  end process;

  process
  begin
    reset <= '1';
    wait for 20 ns;
    reset <= '0';
    wait for 10 ns;

    -- �criture 1
    Din <= "00000001";  
    req <= '0';         
    wait until ack = '0';  
    req <= '1';         
    wait for 20 ns;

    -- �criture 2
    Din <= "11111111";  
    req <= '0';         
    wait until ack = '0';  
    req <= '1';         
    wait for 20 ns;

    -- �criture 3
    Din <= "10101010";  
    req <= '0';         
    wait until ack = '0';  
    req <= '1';         
    wait for 20 ns;

 
    
    report "Simulation termin�e" severity note;
    wait;
  end process;

end Behavioral;

