module origen_044903(
    input wire clk,
    input wire rst,
    input wire [5:0] op,
    input wire [5:0] fun,
    output reg [1:0] RegDst,
    output reg ALUSrc,
    output reg [1:0] nPC_sel,
    output reg [2:0] ALUCtr,
    output reg [1:0] MemToReg,
    output reg MemWr,
    output reg [1:0] ExtOp,
    output reg RegWr,
    output reg overflow
);

    // Instruction type parameters
    localparam R_TYPE = 6'b000000;
    localparam ADDI   = 6'b001000;
    localparam ADDIU  = 6'b001001;
    localparam ORI    = 6'b001101;
    localparam LUI    = 6'b001111;
    localparam LW     = 6'b100011;
    localparam SW     = 6'b101011;
    localparam BEQ    = 6'b000100;
    localparam J      = 6'b000010;
    localparam JAL    = 6'b000011;

    // R-type function codes
    localparam ADDU   = 6'b100001;
    localparam SUBU   = 6'b100011;
    localparam SLT    = 6'b101010;
    localparam JR     = 6'b001000;

    [MASKED]

endmodule