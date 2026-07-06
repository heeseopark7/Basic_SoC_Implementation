`timescale 1ns / 1ps

module simple_register #(
	parameter WIDTH = 32
	)(

	clk		,
	rst_n		,
	wen		,
	i_wdata		,
	o_rdata
	);

	input			clk		;
	input			rst_n		;
	input			wen		;
	input	[WIDTH-1:0]	i_wdata		;
	output	[WIDTH-1:0]	o_rdata		;

	reg	[WIDTH-1:0]	r_reg32		;

	always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			r_reg32 <= 32'b0	;
		end else if (wen) begin // write enable
			r_reg32 <= i_wdata	;
		end

	end

	assign o_rdata = r_reg32		;

	endmodule
