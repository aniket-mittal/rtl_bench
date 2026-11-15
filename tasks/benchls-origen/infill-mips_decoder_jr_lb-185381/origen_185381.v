module origen_185381(
    input [5:0] opcode,
    input [5:0] funct,
    output reg [1:0] RegDst,
    output reg AluSrc,
    output reg MemWrite,
    output reg RegWrite,
    output reg [1:0] wd_sel,
    output reg [2:0] NpcSel,
    output reg [1:0] ExtOp,
    output reg [3:0] AluCtrl,
    output reg lb
);

    parameter R_TYPE = 6'b000000;
    parameter ADDU = 6'b100001;
    parameter SUBU = 6'b100011;
    parameter SLT = 6'b101010;
    parameter JR = 6'b001000;
    parameter ORI = 6'b001101;
    parameter LUI = 6'b001111;
    parameter ADDI = 6'b001000;
    parameter ADDIU = 6'b001001;
    parameter BEQ = 6'b000100;
    parameter SW = 6'b101011;
    parameter LB = 6'b100000;
    parameter JAL = 6'b000011;
    parameter J = 6'b000010;

    [MASKED]

endmodule