`timescale 1ns / 1ps

module tb_shift_register_sipo;

reg		clk		;
reg		rst_n		;
reg		i_serial_in	;
wire	[7:0]	o_parallel_out	;

shift_register_sipo uut (
	.clk 		(clk		),
	.rst_n		(rst_n		),
	.i_serial_in	(i_serial_in	),
	.o_parallel_out	(o_parallel_out	)

);

initial begin
	clk = 0;
	forever #5 clk = ~clk		;
end

initial begin
	rst_n	= 1'b0; i_serial_in = 0;
	#15 rst_n = 1'b1;

	repeat(16) begin
		@(negedge clk);
		i_serial_in = $random % 2;
	end

	#50 $finish;

end

initial begin
	$monitor("time=%0t | serial_in=%b | parallel_out=%b", $time, rst_n, i_serial_in, o_parallel_out);
end

endmodule
