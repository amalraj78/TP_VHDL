library ieee;
use work.entree_sortie_pkg.all;
use ieee.math_real.all;


entity Traitement is
  generic( N_col : natural := 256; N_ligne: natural:= 256);
end Traitement ;

--
--architecture arch_Inv_niv of Traitement is
--  begin
--    process
--    variable tab_image: IMAGE2D(1 to N_col, 1 to N_ligne);
--    variable tab_image_traitee: IMAGE2D( 1 to N_col, 1 to N_ligne);
--    begin
--      tab_image:= get_pixels("femme.txt", N_col, N_ligne);
--      L1:for i in 1 to N_ligne-1 loop
--      L2: for j in 1 to N_col-1 loop
--      tab_image_traitee(i,j):= 255- tab_image(i,j); -- traitement
--      end loop L2;
--      end loop L1;
--  put_pixels("femme_inv.txt",tab_image_traitee,N_col,N_ligne,8);
--  wait;
--  end process;
--end arch_Inv_niv;
----
--architecture arch_moyenne_3x3 of Traitement is
--begin
--  process
--    variable tab_image: IMAGE2D(1 to N_col, 1 to N_ligne);
--    variable tab_image_traitee: IMAGE2D( 1 to N_col, 1 to N_ligne);
--    variable somme : integer;
--    begin 
--      tab_image:= get_pixels("femme.txt", N_col, N_ligne);
--      L1:for i in 2 to N_ligne-1 loop
--        L2: for j in 2 to N_col-1 loop
--          somme :=0;
--        
--          M1:for k in -1 to 1 loop
--            M2:for l in -1 to 1 loop
--              somme := somme + tab_image(i+k,j+l);
--          end loop M2;
--        end loop M1;
--        tab_image_traitee(i,j) := somme/9;
--      end loop L2;
--    end loop L1;
--    put_pixels("femme_moy3x3.txt",tab_image_traitee,N_col,N_ligne,8);
--    wait;
--  end process;
--end arch_moyenne_3x3;


architecture arch_grad of Traitement is 
begin
  process
    variable tab_image: IMAGE2D(1 to N_col, 1 to N_ligne);
    variable tab_image_traitee: IMAGE2D( 1 to N_col, 1 to N_ligne);
    variable tab_gy: IMAGE2D( 1 to N_col, 1 to N_ligne);
    variable tab_gx: IMAGE2D( 1 to N_col, 1 to N_ligne);
    variable var : real;
    begin 
      tab_image:= get_pixels("femme.txt", N_col, N_ligne);
      M1:for k in 1 to N_ligne-1 loop
        M2:for l in 1 to N_col-1 loop
          tab_image_traitee(k,l) := 0;
          tab_gx(k,l) := 0;
          tab_gy(k,l) := 0;       
        end loop M2;
      end loop M1;
    
    --gradient x 
     L1:for i in 2 to N_ligne-1 loop
        L2: for j in 2 to N_col-1 loop
          tab_gx(i,j):=(abs(tab_image(i-1,j-1)-tab_image(i+1,j-1))+(2*tab_image(i-1,j)-2*tab_image(i+1,j))+(tab_image(i-1,j+1)-tab_image(i+1,j+1)));
        end loop L2;
    end loop L1;
    put_pixels("femme_gradx.txt",tab_gx,N_col,N_ligne,8);

    -- gradient y
     L3:for j in 2 to N_col-1 loop
        L4: for i in 2 to N_ligne-1 loop
          tab_gy(i,j):=(abs(tab_image(i-1,j-1)-tab_image(i-1,j+1))+(2*tab_image(i,j-1)-2*tab_image(i,j+1))+(tab_image(i+1,j-1)-tab_image(i+1,j+1)));
        end loop L4;
    end loop L3;
    put_pixels("femme_grady.txt",tab_gy,N_col,N_ligne,8);
    
     L5:for i in 1 to N_ligne-1 loop
       L6:for j in 1 to N_col-1 loop
         var:=abs(real(((tab_gx(i,j) ** 2) + (tab_gy(i,j)**2))));
         tab_image_traitee(i,j) := integer(sqrt(var));
       end loop L6;
     end loop L5;
    
    put_pixels("femme_grad.txt",tab_image_traitee,N_col,N_ligne,8);
    wait;
  end process;
end arch_grad;

