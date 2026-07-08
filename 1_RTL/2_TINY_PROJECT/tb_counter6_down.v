`timescale 1ns / 1ps

module tb_counter6_down;

	reg		clk	;
	reg		rst_n	;
	reg		i_en	;
	wire	[2:0]	o_count	;

	counter6_down dut(
		.clk		(clk		),
		.rst_n		(rst_n		),
		.i_en		(i_en		),
		.o_count	(o_count	)
			);

	always #5 clk = ~clk;

	initial begin
		clk		= 1'b0		;
		rst_n		= 1'b0		;
		i_en		= 1'b0		;
		#20 	rst_n	= 1'b1		;
		#30	i_en	= 1'b1		;
		#200	i_en	= 1'b0		;
		#30	i_en	= 1'b1		;
		#150 	$finish			;
	end

	initial begin
        $monitor("t=%0t | rst_n=%b i_en=%b | o_count=%d",
                 $time, rst_n, i_en, o_count); 
	end

	initial begin
		$dumpfile ("counter6_down.vcd")	;
		$dumpvars (0, tb_counter6_down)	;
	end

endmodule	
