module origen_044365(
    input [5:0] opcode,
    output reg RegDst,
    output reg Jump,
    output reg Branch,
    output reg bne,
    output reg MemRead,
    output reg MemtoReg,
    output reg MemWrite,
    output reg ALUsrc,
    output reg RegWrite,
    output reg [1:0] ALUop
);

    initial begin
        RegDst = 0;
        Jump = 0;
        Branch = 0;
        bne = 0;
        MemRead = 0;
        MemtoReg = 0;
        MemWrite = 0;
        ALUsrc = 0;
        RegWrite = 0;
        ALUop = 2'b00;
    end

    [MASKED]

endmodule