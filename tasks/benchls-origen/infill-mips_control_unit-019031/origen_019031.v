module origen_019031(
    input [31:26] instruction,
    output reg RegDst,
    output reg Jump,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg [1:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
);

    initial begin
        Branch = 0;
        Jump = 0;
    end

    [MASKED]
endmodule