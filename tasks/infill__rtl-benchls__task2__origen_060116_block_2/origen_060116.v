module origen_060116(
    input [31:0] instruction,
    output reg [3:0] Af,
    output reg I,
    output reg ALU_MUX_SEL,
    output reg [4:0] Cad,
    output reg GP_WE,
    output reg [1:0] GP_MUX_SEL,
    output reg [3:0] Bf,
    output reg [1:0] PC_MUX_SEL,
    output reg DM_WE,
    output reg [2:0] Shift_type
);

    wire [5:0] opcode;
    wire [5:0] funct;
    wire [4:0] rs, rt, rd, shamt;

    assign opcode = instruction[31:26];
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign rd = instruction[15:11];
    assign shamt = instruction[10:6];
    assign funct = instruction[5:0];

    [MASKED]
endmodule