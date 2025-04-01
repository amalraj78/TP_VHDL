LIBRARY ieee  ; 
LIBRARY work  ; 
USE ieee.NUMERIC_STD.all  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_arith.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
USE work.mes_composants.all  ; 
ENTITY fastslow_tb  IS 
  GENERIC (
    M  : NATURAL   := 4 ); 
END ; 
 
ARCHITECTURE fastslow_tb_arch OF fastslow_tb IS
  SIGNAL slow   :  STD_LOGIC  ; 
  SIGNAL incwrite   :  STD_LOGIC  ; 
  SIGNAL fast   :  STD_LOGIC  ; 
  SIGNAL incread   :  STD_LOGIC  ; 
  SIGNAL clk   :  STD_LOGIC  ; 
  SIGNAL reset   :  STD_LOGIC  ; 
  COMPONENT fastslow  
    GENERIC ( 
      M  : NATURAL  );  
    PORT ( 
      slow  : out STD_LOGIC ; 
      incwrite  : in STD_LOGIC ; 
      fast  : out STD_LOGIC ; 
      incread  : in STD_LOGIC ; 
      clk  : in STD_LOGIC ; 
      reset  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : fastslow  
    GENERIC MAP ( 
      M  => M   )
    PORT MAP ( 
      slow   => slow  ,
      incwrite   => incwrite  ,
      fast   => fast  ,
      incread   => incread  ,
      clk   => clk  ,
      reset   => reset   ) ; 
      
      
  process
    begin
      clk<='0';wait for 10 ns;
      clk<='1';wait for 10 ns;
    end process;
    
    process
      begin
        reset<='1';wait for 30 ns;
        reset<='0';wait for 10 ns;
        
        incwrite <= '1';incread <= '0'; wait for 500 ns;
        incwrite <= '1';incread <= '0'; wait for 500 ns;
        end process;
        
END ; 

