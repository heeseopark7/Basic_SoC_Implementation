`timescale 1ns / 1ps

module quad_2x1_mux_3 (
                       i_A ,
                       i_B ,
                       i_S ,
                       i_E ,
                       o_Y
);

       input  [3:0]    i_A    ;
       input  [3:0]    i_B    ;
       input           i_S    ;
       input           i_E    ;
       output [3:0]    o_Y    ;

       reg    [3:0]    w_A    ;
       reg             w_n_S  ;
       reg             w_n_E  ;

       always@(*) begin
                       w_n_S = ~i_S                         ;
                       w_n_E = ~i_E                         ;
                       w_A   = i_A & {4{w_n_S}} & {4{w_n_E}};
       end 

       reg    [3:0]    w_B    ;
       reg             w_S    ;
       reg    [3:0]    o_Y    ;

       always@(*) begin
                       w_S   = ~w_n_S                       ;
                       w_B   = i_B & {4{w_S}} & {4{w_n_E}}  ; 

                       o_Y   = w_A | w_B                    ;
       end
endmodule
