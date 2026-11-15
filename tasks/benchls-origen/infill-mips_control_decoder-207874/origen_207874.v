module origen_207874(
    input [5:0] Op,
    input [5:0] Funct,
    output reg RegWrite,
    output reg ALUSrc,
    output reg RegDst,
    output reg Branch,
    output reg MemWrite,
    output reg MemtoReg,
    output reg Jump,
    output reg [5:0] ALUControl
);

    parameter OP_RTYPE = 6'b000000;
    parameter OP_LW = 6'b100011;
    parameter OP_SW = 6'b101011;
    parameter OP_BEQ = 6'b000100;
    parameter OP_ADDI = 6'b001000;
    parameter OP_J = 6'b000010;

    [MASKED]

endmodule