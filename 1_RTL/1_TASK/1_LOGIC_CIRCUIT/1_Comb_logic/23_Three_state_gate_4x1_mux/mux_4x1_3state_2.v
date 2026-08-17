`timescale 1ns / 1ps  
  
module mux_4x1_3state_2 (
               i_I  ,
               i_S  ,
               i_E  ,
               o_Y  
);  
  
       input   [3:0]   i_I  ;
       input   [1:0]   i_S  ;
       input           i_E  ;
       output          o_Y  ;
  
       wire    [3:0]   w_D  ;

       decoder_with_e1 dut (
                      .i_A ( i_S[1] ),
                      .i_B ( i_S[0] ),
                      .i_E ( i_E    ),
                      .o_D ( w_D    )
);
       wire    [3:0]  w_n_D                     ;
      
       assign  w_n_D = ~w_D                     ;  //active-low  

       assign  o_Y   = w_n_D[0] ? i_I[0] : 1'bz ;  
       assign  o_Y   = w_n_D[1] ? i_I[1] : 1'bz ;
       assign  o_Y   = w_n_D[2] ? i_I[2] : 1'bz ;
       assign  o_Y   = w_n_D[3] ? i_I[3] : 1'bz ;
       
endmodule
