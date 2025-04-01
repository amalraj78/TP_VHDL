LIBRARY ieee  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
ENTITY dcpt_m_tb  IS 
  GENERIC (
    M  : NATURAL   := 8 ); 
END ; 
 
ARCHITECTURE dcpt_m_tb_arch OF dcpt_m_tb IS
  SIGNAL cptr   :  std_logic_vector (M - 1 downto 0)  ; 
  SIGNAL ud   :  STD_LOGIC  ; 
  SIGNAL clk   :  STD_LOGIC  ; 
  SIGNAL reset   :  STD_LOGIC  ; 
  SIGNAL enable   :  STD_LOGIC  ; 
  COMPONENT dcpt_m  
    GENERIC ( 
      M  : NATURAL  );  
    PORT ( 
      cptr  : out std_logic_vector (M - 1 downto 0) ; 
      ud  : in STD_LOGIC ; 
      clk  : in STD_LOGIC ; 
      reset  : in STD_LOGIC ; 
      enable  : in STD_LOGIC ); 
  END COMPONENT ; 
  
  
BEGIN
  DUT  : dcpt_m  
    GENERIC MAP ( 
      M  => M   )
    PORT MAP ( 
      cptr   => cptr  ,
      ud   => ud  ,
      clk   => clk  ,
      reset   => reset  ,
      enable   => enable   ) ; 
      
    process
      begin
        clk<='1';
        Wait for 10 ns;
        clk<='0';
        Wait for 10 ns;
  end process;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed

        -- Reset generation
        -- EDIT: Check that reset is really your reset signal
        reset <= '1';enable<='0';ud<='0';Wait for 20 ns;
        
        reset <= '0';enable<='0';ud<='0';Wait for 20 ns;
        
        reset <= '0';enable<='1';ud<='1';Wait for 20 ns;
        reset <= '0';enable<='1';ud<='1';Wait for 20 ns;
        reset <= '0';enable<='1';ud<='1';Wait for 20 ns;
        reset <= '0';enable<='1';ud<='1';Wait for 20 ns;
        reset <= '0';enable<='1';ud<='1';Wait for 20 ns;
        reset <= '0';enable<='1';ud<='1';Wait for 20 ns;
        reset <= '0';enable<='1';ud<='1';Wait for 20 ns;
        reset <= '0';enable<='1';ud<='1';Wait for 20 ns;
        reset <= '0';enable<='1';ud<='1';Wait for 20 ns;
        reset <= '1';enable<='1';ud<='1';Wait for 20 ns;
        reset <= '0';enable<='1';ud<='1';Wait for 20 ns;
        reset <= '0';enable<='1';ud<='1';Wait for 20 ns;
        
        reset <= '0';enable<='1';ud<='0';Wait for 20 ns;
        reset <= '0';enable<='1';ud<='0';Wait for 20 ns;
        reset <= '0';enable<='1';ud<='0';Wait for 20 ns;
        reset <= '0';enable<='1';ud<='0';Wait for 20 ns;
        reset <= '0';enable<='1';ud<='0';Wait for 20 ns;
        reset <= '0';enable<='1';ud<='0';Wait for 20 ns;
        reset <= '0';enable<='1';ud<='0';Wait for 20 ns;
        reset <= '0';enable<='1';ud<='0';Wait for 20 ns;
        reset <= '1';enable<='1';ud<='0';Wait for 20 ns;
        reset <= '0';enable<='1';ud<='0';Wait for 20 ns;
        reset <= '0';enable<='1';ud<='0';Wait for 20 ns;
        
        
  end process;

END ; 

