LIBRARY ieee  ; 
USE ieee.std_logic_1164.all  ; 
ENTITY sequenceur_tb  IS 
END ; 
 
ARCHITECTURE sequenceur_tb_arch OF sequenceur_tb IS
  SIGNAL req   :  STD_LOGIC  ; 
  SIGNAL Selread   :  STD_LOGIC  ; 
  SIGNAL CS_n   :  STD_LOGIC  ; 
  SIGNAL reset   :  STD_LOGIC  ; 
  SIGNAL HL   :  STD_LOGIC  ; 
  SIGNAL Incwrite   :  STD_LOGIC  ; 
  SIGNAL Ack   :  STD_LOGIC  ; 
  SIGNAL clk   :  STD_LOGIC  ; 
  SIGNAL OE   :  STD_LOGIC  ; 
  SIGNAL Enwrite   :  STD_LOGIC  ; 
  SIGNAL RW_n   :  STD_LOGIC  ; 
  SIGNAL Incread   :  STD_LOGIC  ; 
  SIGNAL Enread   :  STD_LOGIC  ; 
  COMPONENT sequenceur  
    PORT ( 
      req  : in STD_LOGIC ; 
      Selread  : out STD_LOGIC ; 
      CS_n  : out STD_LOGIC ; 
      reset  : in STD_LOGIC ; 
      HL  : out STD_LOGIC ; 
      Incwrite  : out STD_LOGIC ; 
      Ack  : out STD_LOGIC ; 
      clk  : in STD_LOGIC ; 
      OE  : out STD_LOGIC ; 
      Enwrite  : in STD_LOGIC ; 
      RW_n  : out STD_LOGIC ; 
      Incread  : out STD_LOGIC ; 
      Enread  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : sequenceur
    PORT MAP ( 
      req   => req  ,
      Selread   => Selread  ,
      CS_n   => CS_n  ,
      reset   => reset  ,
      HL   => HL  ,
      Incwrite   => Incwrite  ,
      Ack   => Ack  ,
      clk   => clk  ,
      OE   => OE  ,
      Enwrite   => Enwrite  ,
      RW_n   => RW_n  ,
      Incread   => Incread  ,
      Enread   => Enread   ) ; 
      
      
  process
    begin
      clk<='1';
      Wait for 10 ns;
      clk<='0';
      Wait for 10 ns;
  end process;
  
  process
    begin
      reset<='1'; wait for 40 ns;
      reset<='0'; wait for 20 ns;
      EnRead<='1'; wait for 20 ns;
      EnRead<='0'; wait for 20 ns;
      Req<='0'; Enwrite<='1'; wait for 20 ns;
      Req<='1'; wait for 20 ns;
      EnRead<='1'; wait for 20 ns;
      EnRead<='0'; wait for 20 ns;
      Req<='0'; EnRead<='0'; wait for 20 ns;
      Req<='1'; EnRead<='0'; wait for 20 ns;
      
      reset<='1'; wait for 40 ns;
      reset<='0'; wait for 20 ns;
      EnRead<='1'; wait for 20 ns;
      EnRead<='1'; wait for 20 ns;
      EnRead<='0'; wait for 20 ns;
      Req<='0'; Enwrite<='1'; wait for 20 ns;
      Req<='1'; wait for 20 ns;
      Req<='1'; EnRead<='0'; wait for 20 ns;
      
      reset<='1'; wait for 40 ns;
      reset<='0'; wait for 20 ns;
      Req<='0'; Enwrite<='1'; wait for 20 ns;
      Req<='1'; wait for 20 ns;
      EnRead<='1'; wait for 20 ns;
      EnRead<='1'; wait for 20 ns;
      EnRead<='0'; wait for 20 ns;
      Req<='1'; EnRead<='0'; wait for 20 ns;
      
    end process;
      
  
  
  
END ; 


