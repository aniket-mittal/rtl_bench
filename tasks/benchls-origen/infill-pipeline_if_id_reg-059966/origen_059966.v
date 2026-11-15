module origen_059966 (
    input wire clock,
    input wire reset,
    input wire en,
    input wire flush,
    input wire [31:0] ins,
    input wire [31:0] PC8F,
    input wire [31:0] PCF,
    input wire eret,
    input wire Likely,
    input wire [31:0] npc,
    input wire jumpD,
    input wire GeneralFlush,
    
    output reg [31:0] reg_ins,
    output wire [4:0] rs,
    output wire [4:0] rt,
    output wire [4:0] rd,
    output wire [15:0] imm16,
    output wire [25:0] imm26,
    output reg [31:0] PC8D,
    output reg [31:0] PCD,
    output reg DelaySlotD
);

    // Instruction decoding
    assign rs = reg_ins[25:21];
    assign rt = reg_ins[20:16];
    assign rd = reg_ins[15:11];
    assign imm16 = reg_ins[15:0];
    assign imm26 = reg_ins[25:0];

    // Pipeline register updates
    [MASKED]

endmodule