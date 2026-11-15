module origen_172412(
    input [5:0] Opcode,
    input [5:0] Function_opcode,
    input [21:0] Alu_resultHigh,
    output reg Jrn,
    output reg RegDST,
    output reg ALUSrc,
    output reg MemorIOtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg IORead,
    output reg IOWrite,
    output reg Branch,
    output reg nBranch,
    output reg Jmp,
    output reg Jal,
    output reg I_format,
    output reg Sftmd,
    output reg [1:0] ALUOp
);

[MASKED]
endmodule