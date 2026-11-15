module origen_108404(
    input [6:0] Opcode,
    output reg ALUSrc,
    output reg [1:0] MemtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg Branch,
    output reg jalr,
    output reg lui,
    output reg jal,
    output reg ReadFlag,
    output reg WriteFlag,
    output reg [1:0] ALUOp
);

    // RISC-V Opcodes
    localparam R_TYPE    = 7'b0110011;
    localparam I_TYPE    = 7'b0010011;
    localparam LOAD      = 7'b0000011;
    localparam STORE     = 7'b0100011;
    localparam BRANCH    = 7'b1100011;
    localparam JALR      = 7'b1100111;
    localparam JAL       = 7'b1101111;
    localparam LUI       = 7'b0110111;
    localparam AUIPC     = 7'b0010111;

    [MASKED]

endmodule