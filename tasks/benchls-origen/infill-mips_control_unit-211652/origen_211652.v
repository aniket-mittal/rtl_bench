module origen_211652(
    input  wire [5:0] instr_op_i,
    input  wire [5:0] instr_jr_i,
    output reg        RegWrite_o,
    output reg  [2:0] ALU_op_o,
    output reg        ALUSrc_o,
    output reg        RegDst_o,
    output reg        Branch_o,
    output reg        Jump_o,
    output reg        MemRead_o,
    output reg        MemWrite_o,
    output reg        MemtoReg_o,
    output reg        jr_o,
    output reg        jal_o
);

    [MASKED]
endmodule