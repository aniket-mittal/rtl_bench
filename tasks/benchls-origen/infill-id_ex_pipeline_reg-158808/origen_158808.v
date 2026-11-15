module origen_158808(
    input clk,
    input rst,
    input stall,

    // Inputs from ID stage
    input [31:0] id_inst,
    input [31:0] id_RFRD1,
    input [31:0] id_RFRD2,
    input id_RegDst,
    input id_MemRead,
    input id_MemtoReg,
    input [1:0] id_ALUOp,
    input id_MemWrite,
    input id_ALUSrc,
    input id_RegWrite,
    input [4:0] id_ShiftIndex,
    input id_ShiftDirection,
    input id_ALUasrc,
    input id_call,
    input [31:0] id_EXTOUT,
    input [4:0] id_RegisterRd,
    input [4:0] id_RegisterRs,
    input [4:0] id_RegisterRt,
    input [31:0] id_pcplus4,

    // Outputs to EXE stage
    output reg [31:0] exe_imm32,
    output reg [31:0] exe_inst,
    output reg [31:0] exe_RFRD1,
    output reg [31:0] exe_RFRD2,
    output reg exe_RegDst,
    output reg exe_MemRead,
    output reg exe_MemtoReg,
    output reg [1:0] exe_ALUOp,
    output reg exe_MemWrite,
    output reg exe_ALUSrc,
    output reg exe_RegWrite,
    output reg [4:0] exe_ShiftIndex,
    output reg exe_ShiftDirection,
    output reg exe_ALUasrc,
    output reg exe_call,
    output reg [4:0] exe_RegisterRd,
    output reg [4:0] exe_RegisterRs,
    output reg [4:0] exe_RegisterRt,
    output reg [31:0] exe_pcplus4
);

[MASKED]

endmodule