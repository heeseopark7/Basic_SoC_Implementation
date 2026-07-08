`timescale 1ns /1ps

module counter6_down (
	clk	,
	rst_n	,
	i_en	,
	o_count
);

	input		clk	;
	input		rst_n	;
	input		i_en	;
	output	[2:0]	o_count	;

	reg 	[2:0]	o_count	;
	
	always @(posedge clk) begin
		if (!rst_n)
			o_count <= 3'd5;
		else if (i_en)	
			case (o_count)
				3'd5 	: o_count <= o_count - 3'd1	;
				3'd4 	: o_count <= o_count - 3'd1	;
				3'd3 	: o_count <= o_count - 3'd1	;
				3'd2 	: o_count <= o_count - 3'd1	;
				3'd1 	: o_count <= o_count - 3'd1	;
				default	: o_count <= 3'd5		;
			endcase 
	end

endmodule
