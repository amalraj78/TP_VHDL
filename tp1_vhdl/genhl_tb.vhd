LIBRARY ieee  ; 
LIBRARY work  ; 
USE ieee.NUMERIC_STD.all  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_arith.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
USE work.mes_composants.all  ; 
ENTITY genhl_tb  IS 
  GENERIC (
    N_div  : NATURAL   := 8 ); 
END ; 
 
ARCHITECTURE genhl_tb_arch OF genhl_tb IS
  SIGNAL enWrite   :  STD_LOGIC  ; 
  SIGNAL clk   :  STD_LOGIC  ; 
  SIGNAL enRead   :  STD_LOGIC  ; 
  SIGNAL reset   :  STD_LOGIC  ; 
  COMPONENT genHL  
    GENERIC ( 
      N_div  : NATURAL  );  
    PORT ( 
      enWrite  : out STD_LOGIC ; 
      clk  : in STD_LOGIC ; 
      enRead  : out STD_LOGIC ; 
      reset  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : genHL  
    GENERIC MAP ( 
      N_div  => N_div   )
    PORT MAP ( 
      enWrite   => enWrite  ,
      clk   => clk  ,
      enRead   => enRead  ,
      reset   => reset   ) ; 

    process
      begin
        clk<='1';
        Wait for 10 ns;
        clk<='0';
        Wait for 10 ns;
  end process;
  
    process
      begin
      reset<='1'; wait for 20 ns;
      reset<='0'; wait for 30 ns;
      reset<='1'; wait for 10 ns;
      reset<='0'; wait for 200 ns;
  end process;
  
  
  
        
END ; 

