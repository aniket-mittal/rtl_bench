module origen_201242(
    input clock,
    input [2:0] OpCode,
    input [15:0] Instr,
    input reset,
    output reg RegWrite,
    output reg [1:0] RegDst,
    output reg ALUSrc,
    output reg [1:0] ALUOp,
    output reg Branch,
    output reg MemWrite,
    output reg MemRead,
    output reg [1:0] MemtoReg
);

[MASKED]

endmodule