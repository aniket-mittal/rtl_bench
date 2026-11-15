module origen_121156 (
    input [6:0] Opcode,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg [1:0] ALUOp,
    output reg Branch,
    output reg JalrSel,
    output reg [1:0] RWSel
);

    // Instruction type constants
    parameter R_TYPE = 7'b0110011;
    parameter LW     = 7'b0000011;
    parameter SW     = 7'b0100011;
    parameter RTypeI = 7'b0010011;
    parameter BR     = 7'b1100011;
    parameter JAL    = 7'b1101111;
    parameter JALR   = 7'b1100111;
    parameter LUI    = 7'b0110111;
    parameter AUIPC  = 7'b0010111;

    [MASKED]

endmodule