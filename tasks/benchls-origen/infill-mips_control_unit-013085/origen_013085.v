module origen_013085 (
    input [5:0] Op_i,
    output reg Jump_o,
    output reg Branch_o,
    output reg [7:0] Control_o
);

    reg ALUSrc, RegDst, MemRead, MemtoReg, MemWrite, RegWrite;
    reg [1:0] ALUOp;

    [MASKED]

endmodule