module origen_025099(
    input [5:0] op,
    input [5:0] func,
    output reg Branch,
    output reg Jump,
    output reg RegDst,
    output reg ALUSrc,
    output reg [3:0] ALUctr,
    output reg MemtoReg,
    output reg RegWr,
    output reg MemWr,
    output reg ExtOp
);

    // Instruction type parameters
    parameter R = 6'b000000;
    parameter ADDI = 6'b001000;
    parameter LW = 6'b100011;
    parameter SW = 6'b101011;
    parameter BEQ = 6'b000100;
    parameter J = 6'b000010;
    parameter ORI = 6'b001101;
    parameter ADDIU = 6'b001001;
    parameter LUI = 6'b001111;

    // R-type function codes
    parameter ADD = 6'b100000;
    parameter ADDU = 6'b100001;
    parameter SUB = 6'b100010;
    parameter SUBU = 6'b100011;
    parameter SLT = 6'b101010;
    parameter SLTU = 6'b101011;
    parameter AND = 6'b100100;
    parameter OR = 6'b100101;

    [MASKED]

endmodule