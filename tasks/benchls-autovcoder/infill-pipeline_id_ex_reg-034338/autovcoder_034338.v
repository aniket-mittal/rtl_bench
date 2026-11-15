module autovcoder_034338 #(
    parameter data_width = 32,
    alu_ctrl_width = 3,
    op_width = 5
) (
    input clk,
    input reset,
    input clr,
    //control_unit_in
    input reg_write_d,
    input mem2reg_d,
    input mem_wr_d,
    input [alu_ctrl_width-1:0] alu_control_d,
    input alu_src_d,
    input reg_dst_d,


    //----------
    //operand_inputs
    input [data_width-1:0] rd1_d,
    input [data_width-1:0] rd2_d,
    input [op_width-1:0] rsd_d,
    input [op_width-1:0] rtd_d,
    input [op_width-1:0] rde_d,
    input [data_width-1:0] sign_extend_d,
    //----------
    //outputs
    output reg reg_write,
    output reg mem2reg,
    output reg mem_wr,
    output reg [alu_ctrl_width-1:0] alu_control,
    output reg alu_src,
    output reg reg_dst,

    //operand_output
    output reg [data_width-1:0] rd1_e,
    output reg [data_width-1:0] rd2_e,
    output reg [  op_width-1:0] rse,
    output reg [  op_width-1:0] rte,
    output reg [  op_width-1:0] rdE,
    output reg [data_width-1:0] sign_extend
    //----------
);
  [MASKED]

endmodule

