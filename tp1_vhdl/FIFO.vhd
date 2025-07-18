library ieee;
use ieee.std_logic_1164.all;

entity FIFO is 
  generic(N: natural:=8;
          M: natural:=10);
  port(clk,reset,req : in std_logic;
       Din : in std_logic_vector(N-1 downto 0);
       ack,HL,fast,slow : out std_logic;
       Data_out : out std_logic_vector(N-1 downto 0));
end entity;

architecture Behavioral of FIFO is
  
  component registreNbits is
    generic(N : natural := 8;
          t_setup : time := 10 ns;
          t_hold : time := 10 ns );
    port ( Q, Qb : out STD_LOGIC_vector(N-1 downto 0);
          D : in STD_LOGIC_vector(N-1 downto 0);
          CLK, reset : in STD_LOGIC);
  end component;
  
  component complement_a_2 is
    generic (N : natural := 8) ;
    port (nombre : in std_logic_vector( N-1 downto 0) ;
        sortie : out std_logic_vector( N-1 downto 0)) ;
  end component;
  
  component genHL is
    generic( N_div : natural := 250);
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           enRead : out STD_LOGIC;
           enWrite : out  std_logic
           );
  end component;
  
  component sequenceur is 
    port ( reset, clk, Enread, Enwrite, req : in STD_logic; 
            Ack, RW_n, OE, Incwrite, Incread, HL, Selread, CS_n : out STD_logic);
  end component;
  
  component genAdr is 
    generic( M : natural := 10);
    Port ( clk: in STD_LOGIC;
          reset: in STD_LOGIC;
          incRead : in STD_LOGIC;
          incWrite : in std_logic;
          selRead : in std_logic;
          Adrg : out std_logic_vector(M-1 downto 0)
        );
    end component;
  
  component fastslow is 
    generic(M : natural :=10);
    port(clk,reset,incwrite,incread : in std_logic;
        fast,slow : out std_logic);
  end component;
      
  component RAM_2pMxNbits is
    generic(N : natural :=8 ; M : natural :=10);
    port(Din : in std_logic_vector((N-1) downto 0);
       Adr : in std_logic_vector((M-1) downto 0);
       RW_n, CS_n : in std_logic;
       Dout : out std_logic_vector((N-1) downto 0));
     end component;
     
  signal enRead_sig, enWrite_sig : std_logic;
  signal incWrite_sig, incRead_sig : std_logic;
  signal selRead_sig, RW_n_sig, OE_sig, CS_n_sig : std_logic;
  signal Adr_sig : std_logic_vector(M-1 downto 0); 
  signal Q_sig, Qb_sig : std_logic_vector(N-1 downto 0);
  signal Din_sig : std_logic_vector(N-1 downto 0);
  signal Dout_sig : std_logic_vector(N-1 downto 0);
 
begin
  Inst_registreNbits : registreNbits
    generic map(N => N, t_setup => 10 ns, t_hold => 10 ns)
    port map(
      Q => Q_sig,
      Qb => Qb_sig,
      D => Din,
      CLK => clk,
      reset => reset
    );

  Inst_complement_a_2 : complement_a_2
    generic map(N => N)
    port map(
      nombre => Q_sig,
      sortie => Din_sig
    );

  -- Instanciation du générateur HL
  Inst_genHL : genHL
    generic map(N_div => 250)
    port map(
      clk => clk,
      reset => reset,
      enRead => enRead_sig,
      enWrite => enWrite_sig
    );

  -- Instanciation du séquenceur
  Inst_sequenceur : sequenceur
    port map(
      reset => reset,
      clk => clk,
      Enread => enRead_sig,
      Enwrite => enWrite_sig,
      req => req,
      Ack => ack,
      RW_n => RW_n_sig,
      OE => OE_sig,
      Incwrite => incWrite_sig,
      Incread => incRead_sig,
      HL => HL,
      Selread => selRead_sig,
      CS_n => CS_n_sig
    );

  -- Instanciation du générateur d'adresses
  Inst_genAdr : genAdr
    generic map(M => 10)
    port map(
      clk => clk,
      reset => reset,
      incRead => incRead_sig,
      incWrite => incWrite_sig,
      selRead => selRead_sig,
      Adrg => Adr_sig
    );

  -- Instanciation du module fastslow
  Inst_fastslow : fastslow
    generic map(M => 10)
    port map(
      clk => clk,
      reset => reset,
      incwrite => incWrite_sig,
      incread => incRead_sig,
      fast => fast,
      slow => slow
    );

  -- Instanciation de la RAM
  Inst_RAM_2pMxNbits : RAM_2pMxNbits
    generic map(N => N, M => 10)
    port map(
      Din => Din_sig,
      Adr => Adr_sig,
      RW_n => RW_n_sig,
      CS_n => CS_n_sig,
      Dout => Dout_sig
    );

  Data_out <= Dout_sig;

end;
    
    
  