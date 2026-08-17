
//input ports
add mapped point i_S i_S -type PI PI
add mapped point i_R i_R -type PI PI
add mapped point i_En i_En -type PI PI

//output ports
add mapped point o_Q o_Q -type PO PO
add mapped point o_Q_n o_Q_n -type PO PO

//inout ports




//Sequential Pins
add mapped point o_Q/q o_Q_reg/Q -type DLAT DLAT
add mapped point o_Q_n/q o_Q_n_reg/Q -type DLAT DLAT



//Black Boxes



//Empty Modules as Blackboxes
