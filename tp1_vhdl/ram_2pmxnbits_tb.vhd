LIBRARY ieee  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
ENTITY ram_2pmxnbits_tb  IS 
  GENERIC (
    M  : NATURAL   := 4 ;  
    N  : NATURAL   := 8 ); 
END ; 
 
ARCHITECTURE ram_2pmxnbits_tb_arch OF ram_2pmxnbits_tb IS
  SIGNAL Dout   :  std_logic_vector ((N - 1) downto 0)  ; 
  SIGNAL RW_n   :  STD_LOGIC  ; 
  SIGNAL CS_n   :  STD_LOGIC  ; 
  SIGNAL Adr   :  std_logic_vector ((M - 1) downto 0)  ; 
  SIGNAL Din   :  std_logic_vector ((N - 1) downto 0)  ; 
  COMPONENT RAM_2pMxNbits  
    GENERIC ( 
      M  : NATURAL ; 
      N  : NATURAL  );  
    PORT ( 
      Dout  : out std_logic_vector ((N - 1) downto 0) ; 
      RW_n  : in STD_LOGIC ; 
      CS_n  : in STD_LOGIC ; 
      Adr  : in std_logic_vector ((M - 1) downto 0) ; 
      Din  : in std_logic_vector ((N - 1) downto 0) ); 
  END COMPONENT ; 
BEGIN
  DUT  : RAM_2pMxNbits  
    GENERIC MAP ( 
      M  => M  ,
      N  => N   )
    PORT MAP ( 
      Dout   => Dout  ,
      RW_n   => RW_n  ,
      CS_n   => CS_n  ,
      Adr   => Adr  ,
      Din   => Din   ) ; 
      
    process
      begin
        Din <= (others => '1');Adr <="1000";CS_n<='0';RW_n<='0';Wait for 10 ns;
        Din <= (others => '0');Adr <="1000";CS_n<='0';RW_n<='1';Wait for 10 ns;
        Din <= "11110000";Adr <="0100";CS_n<='1';RW_n<='0';Wait for 10 ns;
        Din <= "11110000";Adr <="0100";CS_n<='0';RW_n<='0';Wait for 10 ns;
        Din <= "11110000";Adr <="0100";CS_n<='1';RW_n<='1';Wait for 10 ns;
        Din <= "01010101";Adr <="0011";CS_n<='0';RW_n<='0';Wait for 10 ns;
        Din <= "01010101";Adr <="0011";CS_n<='0';RW_n<='1';Wait for 10 ns;
      end process;
        
END ; 

