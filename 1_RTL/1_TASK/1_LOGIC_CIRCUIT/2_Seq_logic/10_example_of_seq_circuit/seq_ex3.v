`timescale 1ns / 1ps

module seq_ex3 (
		i_x	,
		i_Clk	,
		o_A	,
		o_NA	,
		o_B	,
		o_NB	,
		o_y		
);
		input		i_x	;
		input		i_Clk	;
		output		o_A	;
		output		o_NA	;
		output		o_B	;
		output		o_NB	;
		output		o_y	;

		reg		o_A	;
		reg		o_B	;
			always@(posedge i_Clk) begin
					o_A	<=	( o_A | o_B ) & i_x	;
					o_B	<=	~o_A & i_x		;		
			end
	
		assign		o_NA	=	~o_A				;
		assign		o_NB	=	~o_B				;
		assign		o_y		=	~i_x  & ( o_A | o_B )	;

		endmodule
