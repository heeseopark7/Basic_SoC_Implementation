`timescale 1ns / 1ps 
module mux_4_1_3 (
                  i_I ,
                  i_S ,
                  o_Y
);

       input  [3:0]  i_I   ;
       input  [1:0]  i_S   ;
       output        o_Y   ;

       reg    [1:0]  w_n_S ; 
       reg    [3:0]  w_I   ;

       always@(*) begin
                     w_n_S[1] = ~i_S[1] ;
                     w_n_S[0] = ~i_S[0] ;

                     w_I[0]   = i_I[0] & w_n_S[1] & w_n_S[0]      ;
                     w_I[1]   = i_I[1] & w_n_S[1] & i_S[0]        ;
                     w_I[2]   = i_I[2] & i_S[1]   & w_n_S[0]      ;
                     w_I[3]   = i_I[3] & i_S[1]   & i_S[0]        ;
       end
  
       reg           o_Y   ;
   
       always@(*) begin
                     o_Y      = w_I[0] | w_I[1] | w_I[2] | w_I[3] ;
       end
endmodule
