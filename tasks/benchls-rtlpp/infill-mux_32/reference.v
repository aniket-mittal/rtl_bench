module mux_32(sel, src0, src1, z);
	input [31:0] src0, src1;
	input sel;
	output [31:0] z;
	assign z = sel ? src1 : src0;
endmodule