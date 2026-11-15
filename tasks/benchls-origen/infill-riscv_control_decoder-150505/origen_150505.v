module origen_150505(
    input [31:0] IF_ID_Inst,
    input [4:0] Instruction,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite,
    output reg JALR,
    output reg JAL,
    output reg AUIPC,
    output reg ECALL,
    output reg [1:0] ALUOp
);

[MASKED]

endmodule