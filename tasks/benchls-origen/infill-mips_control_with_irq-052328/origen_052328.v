module origen_052328(
    input [5:0] OpCode,
    input [5:0] Funct,
    input Interrupt,
    output reg [2:0] PCSrc,
    output reg Branch,
    output reg RegWrite,
    output reg [1:0] RegDst,
    output reg MemRead,
    output reg MemWrite,
    output reg [1:0] MemtoReg,
    output reg ALUSrc1,
    output reg ALUSrc2,
    output reg ExtOp,
    output reg LuOp,
    output reg [3:0] ALUOp,
    output reg BadOp
);

    [MASKED]

endmodule