library ieee;
use ieee.std_logic_1164. all;
use ieee.std_logic_unsigned.all;

package mes_fonctions is
function cpl2 (entree: std_logic_vector ; N : natural)
  return std_logic_vector;

end mes_fonctions;
 -------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.Std_logic_unsigned.all;

package body mes_fonctions is
function cpl2 (entree: std_logic_vector ; N: natural)
  return std_logic_vector is

variable temp : std_logic_vector ( N-1 downto 0); 
begin 
temp := not entree;
temp := temp + '1';
return temp;
end cpl2 ;
end mes_fonctions;

----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

package CHECK_PKG is
  -- Déclaration de la procédure check_setup
  procedure check_setup(signal clk: in std_logic;
                        signal din: in std_logic_vector;
                        t_setup : in time;
                        severite : in severity_level := warning;
                        hdeb : in time := time'low;
                        hfin : in time := time'high);

  -- Déclaration de la procédure check_hold
  procedure check_hold(signal clk: in std_logic;
                       signal din: in std_logic_vector;
                       t_hold : in time;
                       severite : in severity_level := warning;
                       hdeb : in time := time'low;
                       hfin : in time := time'high);
end CHECK_PKG;

--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package body CHECK_PKG is

  -- Spécification du corps du paquetage.
  -- La procédure check_setup
  procedure check_setup(signal clk: in std_logic;
                        signal din: in std_logic_vector;
                        t_setup: in time;
                        severite : in severity_level := warning;
                        hdeb: in time := time'low;
                        hfin : in time := time'high) is
  begin
    loop
      wait on clk;
      if clk = '1' and clk'event then
        if now >= hdeb and now <= hfin then
          assert din'last_event >= t_setup and din'event = false
            report "temps de setup non respecté" severity severite;
        elsif now > hfin then
          wait;
        end if;
      end if;
    end loop;
  end check_setup;

  -------------------------------------------------------------------

  -- La procédure check_hold
  procedure check_hold(signal clk: in std_logic;
                       signal din: in std_logic_vector;
                       t_hold: in time;
                       severite : in severity_level := warning;
                       hdeb: in time := time'low;
                       hfin : in time := time'high) is
    variable t : time;
  begin
    loop
      wait until clk = '1';
      t := now;
      if t >= hdeb and t <= hfin then
        if din'event = false then
          wait on din for t_hold;
        end if;
        assert din'event = false or (now - t) = t_hold
          report "temps de hold non respecté" severity severite;
      end if;
    end loop;
  end check_hold;

end CHECK_PKG;