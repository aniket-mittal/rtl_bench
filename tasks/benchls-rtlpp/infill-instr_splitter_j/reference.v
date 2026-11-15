module instr_splitter_j(instruction, imm_address);
	
	input [31:0] instruction;
	output [25:0] imm_address;
	
	assign imm_address = instruction[25:0];

endmodule