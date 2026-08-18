`timescale 1ns / 1ps
module d_ff_asyn_3 (
					i_D	,
					i_Clk	,
					i_Nrst	,
					o_Q	,
					o_NQ	
);

	input			i_D		;
	input			i_Clk		;
	input			i_Nrst		;
	output			o_Q		;
	output			o_NQ		;

	reg				o_Q	;

	always@( posedge i_Clk or negedge i_Nrst ) begin
		if ( !i_Nrst ) begin
			o_Q	<=		1'b0	;
		end
		else begin 
			o_Q 	<= 		i_D	;
		end
	end
	
	assign o_NQ 	= 		~o_Q		;
endmodule
