`timescale 1ns/1ps

module gpio_mux (
	i_sel		,
	i_tx0		,
	i_rx0		,
	i_PWM1		,
	i_peri_0	,
	o_gpio_pin

);

	input [1:0]	 i_sel		;
	input		 i_tx0		;
	input 		 i_rx0		;
	input 		 i_PWM1		;
	input  		 i_peri_0	;
	output		 o_gpio_pin	;

	reg o_gpio_pin;
	always @(*) begin
	case (i_sel)
		2'b00	: o_gpio_pin = i_tx0		; 
		2'b01	: o_gpio_pin = i_rx0		;
		2'b11	: o_gpio_pin = i_PWM1		;//greycode
		2'b10	: o_gpio_pin = i_peri_0		;
		default : o_gpio_pin = 1'bz		;
	endcase
	end

endmodule
