`timescale 1ns / 1ps
  
module jk_ff_3 (	//	behavioral-level
			i_J		,
			i_K		,
			i_Clk		,
			o_Q		,
			o_NQ	
);
		input		i_J	;
		input		i_K	;
		input		i_Clk 	;
		output		o_Q	;
		output		o_NQ	;

		reg		o_Q	;

		always@(posedge i_Clk) begin
				case ( { i_J , i_K } ) 	 // 결합연산자
				2'b00	:	o_Q <= o_Q	; // 유지
				2'b10	:	o_Q <= 1'b1	; // set
				2'b11	: 	o_Q <= ~o_Q	; // toggle , grey code로 오류 최소화
				2'b01	:	o_Q <= 1'b0	; // reset
				endcase
		end

				assign 		o_NQ = ~o_Q	;	

endmodule
