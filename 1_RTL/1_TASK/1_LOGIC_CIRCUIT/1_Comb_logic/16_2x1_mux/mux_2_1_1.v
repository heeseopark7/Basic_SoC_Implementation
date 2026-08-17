`timescale 1ns / 1ps  

module mux_2_1_1 (
                i_I  ,
                i_S  ,
                o_Y 
);  

       input  [1:0]  i_I   ;
       input         i_S   ;
       output        o_Y   ;

       wire   [1:0]  w_I   ;
       wire          w_n_S ;  

       not  n1  ( w_n_S  , i_S             );
       and  a0  ( w_I[0] , i_I[0] , w_n_S  );

       and  a2  ( w_I[1] , i_I[1] , i_S    );

       or   o1  ( o_Y    , w_I[0] , w_I[1] );
endmodule  

