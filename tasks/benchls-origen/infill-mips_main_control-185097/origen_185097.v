module origen_185097(
    Opcode,
    RegDst,
    ALUSrc,
    MemtoReg,
    RegWrite,
    MemRead,
    MemWrite,
    Branch,
    ALUOp,
    Jump,
    SignZero
);

    input [5:0] Opcode;
    output reg RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, SignZero;
    output reg [1:0] ALUOp;

    [MASKED]

endmodule