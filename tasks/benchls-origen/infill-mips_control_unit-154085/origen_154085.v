module origen_154085(
    input [5:0] opCode,
    output reg PCSrc,
    output reg RegWrite,
    output reg RegDst,
    output reg ALUSrc,
    output reg Branch,
    output reg MemWrite,
    output reg MemRead,
    output reg MemToReg,
    output reg zeroExt,
    output reg [3:0] ALUOp
);

    initial begin
        PCSrc = 0;
        RegWrite = 0;
        RegDst = 0;
        ALUSrc = 0;
        Branch = 0;
        MemWrite = 0;
        MemRead = 0;
        MemToReg = 0;
        zeroExt = 0;
        ALUOp = 4'b0000;
    end

    [MASKED]

endmodule