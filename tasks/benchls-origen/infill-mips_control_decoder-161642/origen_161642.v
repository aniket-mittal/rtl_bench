module origen_161642(
    input [5:0] opcode,
    input [5:0] funct,
    output reg [1:0] npc_sel,
    output reg regwr,
    output reg regdst,
    output reg extop,
    output reg alusrc,
    output reg [1:0] aluctr,
    output reg memwr,
    output reg memtoreg,
    output reg addu,
    output reg subu,
    output reg ori,
    output reg lw,
    output reg sw,
    output reg beq,
    output reg lui,
    output reg j,
    output reg jal
);

    [MASKED]
endmodule