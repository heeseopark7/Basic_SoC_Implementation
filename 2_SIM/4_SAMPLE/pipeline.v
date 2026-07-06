`timescale 1ns / 1ps

module pipeline(
		input [9:0] in1, 
		input [9:0] in2,
		input [9:0] in3,
		output [11:0] out,
		input clk, rst
		);
		/* 1st clock operation */
		reg [10:0] w1;
		always @(posedge clk, negedge rst) begin
		if (~rst) w1 <= 11'b0; // init
		else w1 <= {1'b0, in1} + {1'b0, in2}; //rst=1
		end
		// 
		reg [9:0] in3_temp;
		always @(posedge clk, negedge rst) begin
		if (~rst) in3_temp <= 10'b0;
		else in3_temp <= in3;
		end
		/* 2nd clock operation */
		reg [11:0] out;
		always @(posedge clk, negedge rst)begin
		if (~rst) out <= 12'b0;
		else out <= {1'b0, w1} + {2'b0, in3_temp};
		end


endmodule
