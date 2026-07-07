
//input ports
add mapped point rst_n rst_n -type PI PI
add mapped point clk clk -type PI PI
add mapped point i_in1 i_in1 -type PI PI
add mapped point i_in2[3] i_in2[3] -type PI PI
add mapped point i_in2[2] i_in2[2] -type PI PI
add mapped point i_in2[1] i_in2[1] -type PI PI
add mapped point i_in2[0] i_in2[0] -type PI PI

//output ports
add mapped point o_out1 o_out1 -type PO PO
add mapped point o_out2[3] o_out2[3] -type PO PO
add mapped point o_out2[2] o_out2[2] -type PO PO
add mapped point o_out2[1] o_out2[1] -type PO PO
add mapped point o_out2[0] o_out2[0] -type PO PO

//inout ports




//Sequential Pins
add mapped point o_out1/q o_out1_reg/Q -type DFF DFF
add mapped point o_out2[3]/q o_out2_reg[3]/Q -type DFF DFF
add mapped point o_out2[1]/q o_out2_reg[1]/Q -type DFF DFF
add mapped point o_out2[0]/q o_out2_reg[0]/Q -type DFF DFF
add mapped point o_out2[2]/q o_out2_reg[2]/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
