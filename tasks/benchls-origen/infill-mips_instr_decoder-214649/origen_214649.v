module origen_214649(
    input [31:0] inst,
    output reg [4:0] rs, rt, rd,
    output reg [15:0] imm16,
    output reg [25:0] imm26,
    output reg [1:0] PCSrc,
    output reg [1:0] RegWriteSrc,
    output reg RegWrite,
    output reg MemWrite,
    output reg [1:0] ALUOperation,
    output reg [1:0] RegDst,
    output reg ALUSrc
);

    wire [5:0] op, func;
    assign op = inst[31:26];
    assign func = inst[5:0];

    [MASKED]

endmodule