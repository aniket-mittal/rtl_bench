module origen_169920(
    input clk,
    input rst,
    input beqout,
    input [5:0] op,
    input [5:0] funct,
    output reg DMWrite,
    output reg [1:0] npc_sel,
    output reg RegWrt,
    output reg [1:0] ExtOp,
    output reg mux4_5sel,
    output reg mux2sel,
    output reg [1:0] mux4_32sel,
    output reg [2:0] ALUctr,
    output reg Rtype,
    output reg add,
    output reg sub,
    output reg lw,
    output reg sw,
    output reg beq,
    output reg lui,
    output reg addiu,
    output reg j,
    output reg bgtz
);

[MASKED]

endmodule