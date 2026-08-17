`timescale 1ns / 1ps

module t_ff_with_jk_1 (	// gate-level
					i_T	,
					i_Clk	,
					o_Q	,
					o_NQ	
);
		input		i_T		;
		input		i_Clk		;
		output		o_Q		;
		output		o_NQ		;

		jk_ff_1 dut	(
						.i_J	(	i_T	),
						.i_K	(	i_T	),
						.i_Clk	(	i_Clk	),
						.o_Q	(	o_Q	),
						.o_NQ	(	o_NQ	)
);	
endmodule
