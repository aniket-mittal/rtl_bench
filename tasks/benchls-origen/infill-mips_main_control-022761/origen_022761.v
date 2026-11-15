module origen_022761 (
    input [31:0] INST,
    output reg [2:0] ALUControl,
    output reg RegDst, RegWrite, ALUSrc, MemWrite, MemRead, MemtoReg, Branch
);

    wire [5:0] opcode = INST[31:26];
    wire [5:0] funct = INST[5:0];

    [MASKED]

endmodule