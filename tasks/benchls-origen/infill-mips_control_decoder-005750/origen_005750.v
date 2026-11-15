module origen_005750 (
    input [31:0] inst,
    output reg RegDst, ALUsrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,
    output reg [1:0] ALUop,
    output reg Jump
);

    wire [5:0] OP;
    assign OP = inst[31:26];

    [MASKED]

endmodule