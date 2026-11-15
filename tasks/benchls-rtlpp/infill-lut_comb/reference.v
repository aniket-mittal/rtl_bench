module lut_comb #(
	parameter lut_mask = 64'h0000000000000000
) (
	input dataa,
	input datab,
	input datac,
	input datad,
	output combout
);
	wire [63:0] lut;
	assign lut = lut_mask;

	assign combout = lut[{dataa, datab, datac, datad}];

endmodule