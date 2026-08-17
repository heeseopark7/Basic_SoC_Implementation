
//input ports
add mapped point i_x i_x -type PI PI
add mapped point i_Clk i_Clk -type PI PI
add mapped point i_nRst i_nRst -type PI PI

//output ports
add mapped point o_y o_y -type PO PO

//inout ports




//Sequential Pins
add mapped point r_state[1]/q r_state_reg[1]/Q -type DFF DFF
add mapped point r_state[0]/q r_state_reg[0]/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
