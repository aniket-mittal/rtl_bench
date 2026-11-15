module origen_010103 (
    input wire rst,
    input wire zero,
    input wire [5:0] op,
    input wire [5:0] func,
    output reg MemEn,
    output reg MemToReg,
    output reg MemWrite,
    output reg [3:0] ALUop,
    output reg ALUSrcA,
    output reg ALUSrcB,
    output reg RegDst,
    output reg RegWrite,
    output reg PCSrc,
    output reg JSrc
);

    // Instruction opcodes
    localparam R_TYPE = 6'b000000;
    localparam LW     = 6'b100011;
    localparam SW     = 6'b101011;
    localparam BEQ    = 6'b000100;
    localparam BNE    = 6'b000101;
    localparam J      = 6'b000010;
    localparam JAL    = 6'b000011;
    localparam ADDI   = 6'b001000;
    localparam ANDI   = 6'b001100;
    localparam ORI    = 6'b001101;

    // R-type function codes
    localparam ADD    = 6'b100000;
    localparam SUB    = 6'b100010;
    localparam AND    = 6'b100100;
    localparam OR     = 6'b100101;
    localparam SLT    = 6'b101010;
    localparam JR     = 6'b001000;

    [MASKED]

endmodule