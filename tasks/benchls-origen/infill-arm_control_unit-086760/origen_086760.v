module origen_086760 (
    input [1:0] Op,
    input Funct5, Funct4, Funct1,
    output reg Branch, RegW, MemW, MemtoReg, ALUSrc, ALUOp, link,
    output reg [1:0] ImmSrc, RegSrc
);

    initial begin
        Branch = 0;
        RegW = 0;
        MemW = 0;
        MemtoReg = 0;
        ALUSrc = 0;
        ALUOp = 0;
        link = 0;
        ImmSrc = 2'b00;
        RegSrc = 2'b00;
    end

    [MASKED]
endmodule