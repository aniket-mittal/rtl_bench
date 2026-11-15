module origen_208955(
    // Inputs
    input RegWrite_in, MemtoReg_in, Branch_in, MemRead_in, MemWrite_in, ALUSrc_in, RegDst_in,
    input [1:0] ALUop_in,
    input [31:0] PC_4_in, Read_Data_1_in, Read_Data_2_in, SignExtend_in,
    input [4:0] Rt_in, Rd_in,
    input clk, rst,

    // Outputs
    output reg RegWrite_out, MemtoReg_out, Branch_out, MemRead_out, MemWrite_out, ALUSrc_out, RegDst_out,
    output reg [1:0] ALUop_out,
    output reg [31:0] PC_4_out, Read_Data_1_out, Read_Data_2_out, SignExtend_out,
    output reg [4:0] Rt_out, Rd_out
);

    [MASKED]

endmodule