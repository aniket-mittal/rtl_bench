module origen_073028(
    input [5:0] Op,
    input [5:0] Funct,
    input Equal,
    input EQZ,
    input LTZ,
    output reg [1:0] NPCOp,
    output reg RegWrite,
    output reg [3:0] ALUOp,
    output reg MemWrite,
    output reg [1:0] OpWidth,
    output reg LoadSigned,
    output reg [1:0] ExtOp,
    output reg [1:0] PCSrc,
    output reg [1:0] RegDst,
    output reg [1:0] RegSrc,
    output reg ALUSrc
);

    // Instruction type signals
    wire r_type = (Op == 6'b000000);
    wire addu   = r_type & (Funct == 6'b100001);
    wire subu   = r_type & (Funct == 6'b100011);
    wire jr     = r_type & (Funct == 6'b001000);
    wire ori    = (Op == 6'b001101);
    wire lw     = (Op == 6'b100011);
    wire sw     = (Op == 6'b101011);
    wire beq    = (Op == 6'b000100);
    wire lui    = (Op == 6'b001111);
    wire jal    = (Op == 6'b000011);

    // Control signal generation
    [MASKED]

endmodule