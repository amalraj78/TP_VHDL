LIBRARY ieee  ; 
LIBRARY work  ; 
USE ieee.std_logic_1164.all  ; 
USE work.CHECK_PKG.all  ; 
ENTITY registrenbits_tb  IS 
  GENERIC (
    t_setup  : TIME   := 1 ns ;  
    t_hold  : TIME   := 2 ns ;  
    N  : NATURAL   := 8 ); 
END ; 
 
ARCHITECTURE registrenbits_tb_arch OF registrenbits_tb IS
  SIGNAL D   :  std_logic_vector (N - 1 downto 0)  ; 
  SIGNAL Q   :  std_logic_vector (N - 1 downto 0)  ; 
  SIGNAL CLK   :  STD_LOGIC  ; 
  SIGNAL reset   :  STD_LOGIC  ; 
  SIGNAL Qb   :  std_logic_vector (N - 1 downto 0)  ; 
  COMPONENT registreNbits  
    GENERIC ( 
      t_setup  : TIME ; 
      t_hold  : TIME ; 
      N  : NATURAL  );  
    PORT ( 
      D  : in std_logic_vector (N - 1 downto 0) ; 
      Q  : out std_logic_vector (N - 1 downto 0) ; 
      CLK  : in STD_LOGIC ; 
      reset  : in STD_LOGIC ; 
      Qb  : out std_logic_vector (N - 1 downto 0) ); 
  END COMPONENT ; 
BEGIN
  DUT  : registreNbits  
    GENERIC MAP ( 
      t_setup  => t_setup  ,
      t_hold  => t_hold  ,
      N  => N   )
    PORT MAP ( 
      D   => D  ,
      Q   => Q  ,
      CLK   => CLK  ,
      reset   => reset  ,
      Qb   => Qb   ) ; 
      
                process
      begin
        clk<='1';
        Wait for 10 ns;
        clk<='0';
        Wait for 10 ns;
  end process;
  
    process
      begin
      reset<='1';D<="00000000"; wait for 19 ns;
      reset<='0'; wait for 20 ns;
      D<="11111111";wait for 20 ns;
      D<="11011010";wait for 20 ns;
      D<="00001111";wait for 1 ns;
      D<="11111111";wait for 20 ns;
      
      
      
      -- changer les parametres un peu avant les front montants
      
  end process;
END ; 

