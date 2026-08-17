`timescale 1ns / 1ps  
  
module d_latch_1 (
                i_D  ,
                i_En ,
                o_Q  ,
                o_n_Q  
);  
  
         input  i_D   ;
         input  i_En  ;
         output o_Q   ;
         output o_n_Q ;  

         wire   w_D   ;  
         nand    n1 ( w_D , i_D , i_En            );
    
         wire   w_n_D    ;
         wire   w_n_D_en ;
         not     d1 ( w_n_D , i_D                 );
         nand    n2 ( w_n_D_en , w_n_D , i_En     );

         nand    n3 ( o_Q , w_D , o_n_Q           );
         nand    n4 ( o_n_Q , w_n_D_en , o_Q      );
  
endmodule 
