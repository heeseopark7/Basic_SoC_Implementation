
//input ports
add mapped point i_x i_x -type PI PI
add mapped point i_Clk i_Clk -type PI PI
add mapped point i_nRst i_nRst -type PI PI

//output ports
add mapped point o_y o_y -type PO PO

//inout ports




//Sequential Pins
add mapped point w_Ay/q w_Ay_reg/Q -type DFF DFF
add mapped point w_By/q w_By_reg/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
