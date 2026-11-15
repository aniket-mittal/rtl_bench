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

always @(posedge clk) begin
    if (rst) begin
        exe_imm32 <= 32'b0;
        exe_inst <= 32'b0;
        exe_RFRD1 <= 32'b0;
        exe_RFRD2 <= 32'b0;
        exe_RegDst <= 1'b0;
        exe_MemRead <= 1'b0;
        exe_MemtoReg <= 1'b0;
        exe_ALUOp <= 2'b0;
        exe_MemWrite <= 1'b0;
        exe_ALUSrc <= 1'b0;
        exe_RegWrite <= 1'b0;
        exe_ShiftIndex <= 5'b0;
        exe_ShiftDirection <= 1'b0;
        exe_ALUasrc <= 1'b0;
        exe_call <= 1'b0;
        exe_RegisterRd <= 5'b0;
        exe_RegisterRs <= 5'b0;
        exe_RegisterRt <= 5'b0;
        exe_pcplus4 <= 32'b0;
    end else if (!stall) begin
        exe_imm32 <= id_EXTOUT;
        exe_inst <= id_inst;
        exe_RFRD1 <= id_RFRD1;
        exe_RFRD2 <= id_RFRD2;
        exe_RegDst <= id_RegDst;
        exe_MemRead <= id_MemRead;
        exe_MemtoReg <= id_MemtoReg;
        exe_ALUOp <= id_ALUOp;
        exe_MemWrite <= id_MemWrite;
        exe_ALUSrc <= id_ALUSrc;
        exe_RegWrite <= id_RegWrite;
        exe_ShiftIndex <= id_ShiftIndex;
        exe_ShiftDirection <= id_ShiftDirection;
        exe_ALUasrc <= id_ALUasrc;
        exe_call <= id_call;
        exe_RegisterRd <= id_RegisterRd;
        exe_RegisterRs <= id_RegisterRs;
        exe_RegisterRt <= id_RegisterRt;
        exe_pcplus4 <= id_pcplus4;
    end
end

endmodule