`timescale 1ns / 1ps 
module mux_4x1_boolean_2 (
        i_x  ,
        i_y  ,
        i_z  ,
        o_F  
);

        input   i_x    ;
        input   i_y    ;
        input   i_z    ;
        output  o_F    ;

        wire    w_n_z  ;
        
        assign  w_n_z = ~i_z ;

        mux_4_1_1 uut (
      
                .i_I ( {1'b1, 1'b0, w_n_z, i_z} ), 
                .i_S ( {i_x, i_y}               ), 
                .o_Y ( o_F                      )
);

endmodule
