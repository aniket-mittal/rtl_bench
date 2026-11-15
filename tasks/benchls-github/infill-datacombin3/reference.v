module DataCombin3(i0, i1, i2, o);

	parameter data_width = 1;

	input[data_width - 1 : 0] i0, i1, i2;
	output[3 * data_width - 1 : 0] o;

	assign o = {i2, i1, i0};

endmodule