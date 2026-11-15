module origen_008552(
    input [31:0] Instr,
    output reg RegDst, AluSrc, RegWrite, MemWrite, MemToReg, Jump, Link, LinkReg, Return, Byte, Half, Sign,
    output reg [1:0] ExtCtrl,
    output reg [2:0] Branch,
    output reg [3:0] AluCtrl
);

    wire [5:0] opcode = Instr[31:26];
    wire [5:0] funct = Instr[5:0];

    [MASKED]

endmodule