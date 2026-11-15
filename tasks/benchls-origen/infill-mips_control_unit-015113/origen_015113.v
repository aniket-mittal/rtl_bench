module origen_015113(
    input [5:0] Opcode,
    input [5:0] funct,
    input IRQ,
    input ker,
    output reg [2:0] PCSrc,
    output reg [1:0] RegDst,
    output reg [1:0] MemToReg,
    output reg [5:0] ALUFun,
    output reg RegWr,
    output reg ALUSrc1,
    output reg ALUSrc2,
    output reg Sign,
    output reg MemWr,
    output reg MemRd,
    output reg EXTOp,
    output reg LUOp,
    output reg Interrupt
);

    // Instruction type parameters
    localparam R_TYPE = 6'b000000;
    localparam LW     = 6'b100011;
    localparam SW     = 6'b101011;
    localparam BEQ    = 6'b000100;
    localparam BNE    = 6'b000101;
    localparam J      = 6'b000010;
    localparam JAL    = 6'b000011;
    localparam LUI    = 6'b001111;
    localparam ADDI   = 6'b001000;

    [MASKED]
endmodule