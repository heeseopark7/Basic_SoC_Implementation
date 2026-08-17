`timescale 1ns / 1ps  

module mux_2_1_3 (
                i_I  ,
                i_S  ,
                o_Y 
);  

       input  [1:0]  i_I   ;
       input         i_S   ;
       output        o_Y   ;

       reg    [1:0]  w_I   ;
       reg           w_n_S ;  
       
       always@(*) begin
                     w_n_S  = ~i_S            ;
                     w_I[0] = i_I[0] & w_n_S  ;
                     w_I[1] = i_I[1] & i_S    ;
       end

       reg           o_Y   ;
     
       always@(*) begin       
                     o_Y    = w_I[0] | w_I[1] ;
       end  

endmodule

