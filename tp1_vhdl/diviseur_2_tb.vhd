LIBRARY ieee  ; 
USE ieee.std_logic_1164.all  ; 
ENTITY diviseur_2_tb  IS 
END ; 
 
ARCHITECTURE diviseur_2_tb_arch OF diviseur_2_tb IS
  SIGNAL clk_out   :  STD_LOGIC  ; 
  SIGNAL clk   :  STD_LOGIC  ; 
  SIGNAL reset   :  STD_LOGIC  ; 
  COMPONENT diviseur_2  
    PORT ( 
      clk_out  : out STD_LOGIC ; 
      clk  : in STD_LOGIC ; 
      reset  : in STD_LOGIC ); 
  END COMPONENT ; 
  
  constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';
BEGIN
  DUT  : diviseur_2  
    PORT MAP ( 
      clk_out   => clk_out  ,
      clk   => clk  ,
      reset   => reset   ) ;
      
       -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;
    
  process
    begin
      reset <= '1';
      wait for 10 ns;
      reset <= '0';
      wait for 10 ns;

      -- EDIT Add stimuli here
      wait for 100 * TbPeriod;

    -- Stop the clock and hence terminate the simulation
      TbSimEnded <= '1';
      wait;
    end process;
END ; 

