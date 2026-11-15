module control(
		input  wire	[5:0]	opcode,
		output reg			branch_eq, branch_ne,
		output reg [1:0]	aluop,
		output reg			memread, memwrite, memtoreg,
		output reg			regdst, regwrite, alusrc,
		output reg			jump);

	[MASKED]
endmodule