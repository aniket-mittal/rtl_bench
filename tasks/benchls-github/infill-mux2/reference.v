module Mux2(sel, i0, i1, o);

	parameter data_width = 8;

	input sel;
	input[data_width - 1 : 0] i0;
	input[data_width - 1 : 0] i1;
	output[data_width - 1 : 0] o;

	assign o = sel == 0 ? i0 : i1;

endmodule