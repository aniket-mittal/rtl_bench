module origen_181396(
    input [5:0] op,
    input [5:0] func,
    output reg RegWrite_id,
    output reg MemWrite_id,
    output reg ALUSrc_id,
    output reg Branch_id,
    output reg j_id,
    output reg jal_id,
    output reg jr_id,
    output reg [1:0] EXTop_id,
    output reg [1:0] MemtoReg_id,
    output reg [1:0] ALUop_id,
    output reg [1:0] RegDst_id
);

    parameter i_R = 6'b000000;
    parameter i_lw = 6'b100011;
    parameter i_sw = 6'b101011;
    parameter i_addu = 6'b100001;
    parameter i_subu = 6'b100011;
    parameter i_OR = 6'b100101;
    parameter i_ori = 6'b001101;
    parameter i_addiu = 6'b001001;
    parameter i_andi = 6'b001100;
    parameter i_lui = 6'b001111;
    parameter i_jr = 6'b001000;
    parameter i_j = 6'b000010;
    parameter i_jal = 6'b000011;
    parameter i_beq = 6'b000100;

    [MASKED]

endmodule