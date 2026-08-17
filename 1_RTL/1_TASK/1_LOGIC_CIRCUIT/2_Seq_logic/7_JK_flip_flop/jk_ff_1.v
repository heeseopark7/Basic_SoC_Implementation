`timescale 1ns / 1ps
  
module jk_ff_1 (		// gate-level
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

		wire		w_J	;
		and	a1	(	w_J	, 	o_NQ	,	i_J		);
	
		wire		w_NK	;
		not		n1	(	w_NK	,	i_K			);

		wire		w_wNK	;
		and	a2	(	w_wNK	,	w_NK	,	o_Q		);

		wire		w_D	;
		or		o1	(	w_D	, 	w_J	, 	w_wNK	);

		d_ff_pe	dut		(
							.i_D		(	w_D	),
							.i_clk		(	i_Clk	),
							.o_Q		(	o_Q	),
							.o_NQ		(	o_NQ	)
);

endmodule
