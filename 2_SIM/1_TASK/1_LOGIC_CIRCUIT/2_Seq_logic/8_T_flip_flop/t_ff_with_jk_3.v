`timescale 1ns / 1ps
module t_ff_with_jk_3 (	//	behavioral-level
						i_T	,
						i_Clk	,
						o_Q	,
						o_NQ
);
		input			i_T		;
		input			i_Clk		;
		output			o_Q		;
		output			o_NQ		;

		reg				o_Q	;
		always@( posedge i_Clk ) begin
				if ( i_T ) begin
					o_Q <= ~o_Q	;	// Toggle
				end
				else if ( ! i_T ) begin
					o_Q <= o_Q	;	// 유지 
 				end
		end
		assign		o_NQ = ~o_Q	;
		
endmodule
