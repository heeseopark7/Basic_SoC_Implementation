`timescale 1ns / 1ps

module seq_ex1 (
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

		wire		w_A	;
		and	a1	(w_A, o_A, i_x)		;
		
		wire		w_x	;
		and	a2	(w_x, i_x, o_B)		;

		wire		w_DA	;
		or		o1	(w_DA, w_A, w_x);

		wire		w_DB	;
		and	a3	(w_DB, o_NA, i_x)	;

		wire		w_y	;
		or		o2	(w_y, o_B, o_A)	;
	
		wire		w_Nx	;
		not		n1	(w_Nx, i_x)	;
		and	a4	(o_y, w_y, w_Nx)	;

		d_ff_pe	dut1		(
							.i_D		(	w_DA	),
							.i_clk		(	i_Clk	),
							.o_Q		(	o_A	),
							.o_NQ		(	o_NA	)
);

		d_ff_pe	dut2		(
							.i_D		(	w_DB	),
							.i_clk		(	i_Clk	),
							.o_Q		(	o_B	),
							.o_NQ		(	o_NB	)
);

endmodule
