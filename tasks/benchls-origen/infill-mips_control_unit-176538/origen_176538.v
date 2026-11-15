module origen_176538(
    input zero,
    input [5:0] OP,
    input [5:0] func,
    input sign,
    output reg PCWre,
    output reg ALUSrcA,
    output reg ALUSrcB,
    output reg DBDataSrc,
    output reg RegWre,
    output reg InsMemRW,
    output reg mRD,
    output reg mWR,
    output reg RegDst,
    output reg ExtSel,
    output reg [2:0] ALUOp,
    output reg [1:0] PCSrc
);

    parameter R_TYPE = 6'b000000;
    parameter ADDIU = 6'b001001;
    parameter ANDI = 6'b001100;
    parameter ORI = 6'b001101;
    parameter SLTI = 6'b001010;
    parameter SW = 6'b101011;
    parameter LW = 6'b100011;
    parameter BEQ = 6'b000100;
    parameter BNE = 6'b000101;
    parameter BLTZ = 6'b000001;
    parameter J = 6'b000010;
    parameter HALT = 6'b111111;

    [MASKED]

endmodule