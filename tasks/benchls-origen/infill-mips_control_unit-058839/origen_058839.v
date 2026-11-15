module origen_058839(
    input [5:0] OP,
    input [5:0] funct,
    output reg RegDst,
    output reg BranchEQ,
    output reg BranchNE,
    output reg MemRead,
    output reg MemToReg,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite,
    output reg Jump,
    output reg JumpAndLink,
    output reg LoadUpperImmediate,
    output reg JumpRegister,
    output reg [2:0] ALUOp
);

reg [13:0] ControlValues;

[MASKED]

endmodule