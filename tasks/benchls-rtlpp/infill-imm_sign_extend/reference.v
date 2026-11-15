module imm_sign_extend(raw_immediate, extended_immediate);
	
	input signed [15:0] raw_immediate;
	output signed [31:0] extended_immediate;

	assign extended_immediate = raw_immediate;

endmodule