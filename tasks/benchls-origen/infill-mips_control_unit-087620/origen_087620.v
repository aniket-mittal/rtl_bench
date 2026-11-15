module origen_087620 #(
    parameter R = 6,
    parameter P = 4
)(
    input [R-1:0] opcode,
    output reg MemRead,
    output reg MemWrite,
    output reg RegWrite,
    output reg Branch,
    output reg RegDst,
    output reg ALUSrc,
    output reg MemToReg,
    output reg NotOp,
    output reg [1:0] ALUOp
);

    // Instruction opcodes
    localparam R_FORMAT = 6'b000000;
    localparam LW       = 6'b100011;
    localparam SW       = 6'b101011;
    localparam BEQ      = 6'b000100;
    localparam BNE      = 6'b000101;
    localparam ADDI     = 6'b001000;

    [MASKED]

endmodule