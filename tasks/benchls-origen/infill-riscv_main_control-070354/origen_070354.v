module origen_070354(
    input [6:0] Op_i,
    input NoOp_i,
    output reg RegWrite_o,
    output reg MemtoReg_o,
    output reg MemRead_o,
    output reg MemWrite_o,
    output reg [1:0] ALUOp_o,
    output reg ALUSrc_o,
    output reg Branch_o
);

    // Instruction type constants
    localparam R_Type  = 2'b10;
    localparam I_Type  = 2'b00;
    localparam S_Type  = 2'b01;
    localparam SB_Type = 2'b11;

    [MASKED]

endmodule