`timescale 1ns / 1ps 

module seq_dff_1 (
           i_x,
           i_y,
           i_Clk,
           o_A
);

           input   i_x   ;
           input   i_y   ;
           input   i_Clk ;
           output  o_A   ;

           wire    w_xy  ;
           xor  x1 ( w_xy, i_x, i_y );

           wire    w_D   ;
           xor  x2 ( w_D, o_A, w_xy );

           d_ff_pe dut1   (
                     .i_D		(	w_D	),
							.i_clk		(	i_Clk	),
							.o_Q		(	o_A	),
							.o_NQ		(		)
);

endmodule
