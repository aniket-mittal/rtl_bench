module origen_205383(
    input [3:0] op,
    input zero,
    output reg JUMP,
    output reg BRANCH,
    output reg [2:0] ALUC,
    output reg ALUSRCB,
    output reg WRITEMEM,
    output reg WRITEREG,
    output reg MEMTOREG,
    output reg REGDES,
    output reg WRFLAG
);

parameter AND = 4'b0000, OR = 4'b0001, ADD = 4'b0010, SUB = 4'b0011,
          SLT = 4'b0100, SUBC = 4'b0101, ADDC = 4'b0110, JMP = 4'b0111,
          ANDI = 4'b1000, ORI = 4'b1001, ADDI = 4'b1010, LW = 4'b1011,
          SW = 4'b1100, BEQ = 4'b1101, BNE = 4'b1110, JMPB = 4'b1111;

[MASKED]
endmodule