module origen_206501(
    input [5:0] instr_op_i,
    output reg RegWrite_o,
    output reg [2:0] ALU_op_o,
    output reg ALUSrc_o,
    output reg RegDst_o,
    output reg Branch_o,
    output reg MemWrite_o,
    output reg MemRead_o,
    output reg MemToReg_o,
    output reg Jump_o
);

    reg R_format, beq, addi, slti, lui, ori, bne, lw, sw, j;

    [MASKED]

endmodule