`timescale 1ns/1ps

module tb_gpio_mux;
//stimulus : connected to input (active)
	reg [1:0] 	i_sel		;
	reg 		i_tx0		;
	reg 		i_rx0		;
	reg 		i_PWM1		;
	reg 		i_peri_0	;
	wire		o_gpio_pin	;
// monitor signanl : connected to output (passive)	
	gpio_mux dut (
		.i_sel		(i_sel)		,
		.i_tx0		(i_tx0)		,
		.i_rx0		(i_rx0)		,
		.i_PWM1		(i_PWM1)	,
		.i_peri_0	(i_peri_0)	,
		.o_gpio_pin	(o_gpio_pin)	
	);

	initial begin
		$dumpfile("./gpio.vcd")		;
		$dumpvars(0, tb_gpio_mux)	;
	end

	initial begin
	// t=0: init
	
	i_tx0 = 1'b0; i_rx0 = 1'b1; i_PWM1 = 1'b0; i_peri_0 = 1'b1;

	i_sel = 2'b00; #10;
	i_sel = 2'b01; #10;
	i_sel = 2'b11; #10;
	i_sel = 2'b10; #10;
	
	$finish;

	end	


endmodule
