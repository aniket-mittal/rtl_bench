module origen_168584 (
    input clk_i,
    input rst_n,
    input MemtoReg_i, MemRead_i, MemWrite_i, Branch_i, RegWrite_i, BranchType_i, RegDst_i, ALUSrc_i,
    input [3:0] ALUOP_i,
    input [31:0] program_suppose_i, readData1_i, readData2_i, instance_signExtend_i, instance_zeroFilled_i,
    input [31:0] instruction_i,
    output reg MemtoReg_o, MemRead_o, MemWrite_o, Branch_o, RegWrite_o, BranchType_o, RegDst_o, ALUSrc_o,
    output reg [3:0] ALUOP_o,
    output reg [31:0] program_suppose_o, readData1_o, readData2_o, instance_signExtend_o, instance_zeroFilled_o,
    output reg [31:0] instruction_o
);

    [MASKED]

endmodule