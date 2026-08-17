
//input ports
add mapped point i_x i_x -type PI PI
add mapped point i_Clk i_Clk -type PI PI

//output ports
add mapped point o_A o_A -type PO PO
add mapped point o_NA o_NA -type PO PO
add mapped point o_B o_B -type PO PO
add mapped point o_NB o_NB -type PO PO
add mapped point o_y o_y -type PO PO

//inout ports




//Sequential Pins
add mapped point o_A/q o_A_reg/Q -type DFF DFF
add mapped point o_B/q o_B_reg/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
