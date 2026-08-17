`timescale 1ns / 1ps

module quad_2x1_mux_1 (
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

       wire   [3:0]    w_A    ;
       wire   [3:0]    w_B    ;
       wire            w_n_S  ;
       wire            w_S    ;
       wire            w_n_E  ;

       not  n1       ( w_n_S  , i_S                              );
       not  e1       ( w_n_E  , i_E                              );
       and  a [3:0]  ( w_A    , i_A    , {4{w_n_S}} , {4{w_n_E}} ); 
       
       not  n2       ( w_S    , w_n_S                            );
       and  b [3:0]  ( w_B    , i_B    , {4{w_S}}   , {4{w_n_E}} );

       or   o [3:0]  ( o_Y    , w_A    , w_B                     );

endmodule
