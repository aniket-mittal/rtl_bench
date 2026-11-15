module rtlpp_03796 (
	instruction,
	r_dst,
	r_src,
	r_tgt,
	immed,
	opcode
);
	
	parameter INSTRUCTION_WIDTH = 32; // Define the instruction width 
	parameter REGFILE_ADDR_BITS = 5;  // Define the address bits for register file
	parameter IMMEDIATE_WIDTH = 16;   // Define the immediate width
	parameter WIDTH_OPCODE = 6;       // Define the opcode width
		
	input [INSTRUCTION_WIDTH-1:0] instruction;
	output [REGFILE_ADDR_BITS-1:0] r_dst;
	output [REGFILE_ADDR_BITS-1:0] r_src;
	output [REGFILE_ADDR_BITS-1:0] r_tgt;
	output [IMMEDIATE_WIDTH-1:0] immed;
	output [WIDTH_OPCODE-1:0] opcode;
	   
	parameter OPCODE_LSB = INSTRUCTION_WIDTH - WIDTH_OPCODE; 
	parameter REG_DEST_LSB = OPCODE_LSB - REGFILE_ADDR_BITS; 
	parameter REG_SRC_LSB = REG_DEST_LSB - REGFILE_ADDR_BITS; 
	parameter REG_TGT_LSB = REG_SRC_LSB - REGFILE_ADDR_BITS; 

	assign opcode = instruction[INSTRUCTION_WIDTH-1:OPCODE_LSB]; 
	assign r_dst = instruction[OPCODE_LSB-1:REG_DEST_LSB]; 
	assign r_src = instruction[REG_DEST_LSB-1:REG_SRC_LSB]; 
	assign r_tgt = instruction[REG_SRC_LSB-1:REG_TGT_LSB]; 
	assign immed = instruction[REG_TGT_LSB-1:0]; 

endmodule