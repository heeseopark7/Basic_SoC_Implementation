
//input ports
add mapped point i_D i_D -type PI PI
add mapped point i_En i_En -type PI PI

//output ports
add mapped point o_Q o_Q -type PO PO
add mapped point o_n_Q o_n_Q -type PO PO

//inout ports




//Sequential Pins
add mapped point o_n_Q/q o_n_Q_reg/Q -type DLAT DLAT
add mapped point o_Q/q o_Q_reg/Q -type DLAT DLAT



//Black Boxes



//Empty Modules as Blackboxes
