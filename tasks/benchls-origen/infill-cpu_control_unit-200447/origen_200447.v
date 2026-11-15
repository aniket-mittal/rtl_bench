module origen_200447 (
    input  wire [5:0] opCode,
    input  wire       zero,
    output reg        RegDst,
    output reg        InsMenRW,
    output reg        PCWre,
    output reg        ExtSel,
    output reg        DBDataSrc,
    output reg        WR,
    output reg        RD,
    output reg        ALUSrcB,
    output reg        ALUSrcA,
    output reg        PCSrc,
    output reg [3:0]  ALUop,
    output reg        RegWre
);

    [MASKED]

endmodule