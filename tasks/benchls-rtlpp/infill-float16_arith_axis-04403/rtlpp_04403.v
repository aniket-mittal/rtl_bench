module rtlpp_04403
   (M_AXIS_RESULT_0_tdata,
    M_AXIS_RESULT_0_tlast,
    M_AXIS_RESULT_0_tready,
    M_AXIS_RESULT_0_tvalid,
    S_AXIS_A_0_tdata,
    S_AXIS_A_0_tready,
    S_AXIS_A_0_tvalid,
    S_AXIS_B_0_tdata,
    S_AXIS_B_0_tready,
    S_AXIS_B_0_tvalid,
    clk,
    rst_n);

  output [15:0] M_AXIS_RESULT_0_tdata;
  output M_AXIS_RESULT_0_tlast;
  input M_AXIS_RESULT_0_tready;
  output M_AXIS_RESULT_0_tvalid;
  input [15:0] S_AXIS_A_0_tdata;
  output S_AXIS_A_0_tready;
  input S_AXIS_A_0_tvalid;
  input [15:0] S_AXIS_B_0_tdata;
  output S_AXIS_B_0_tready;
  input S_AXIS_B_0_tvalid;
  input clk;
  input rst_n;

  reg [15:0] floating_point_0_M_AXIS_RESULT_TDATA;
  reg floating_point_0_M_AXIS_RESULT_TREADY;
  reg floating_point_0_M_AXIS_RESULT_TVALID;
  reg [15:0] floating_point_1_M_AXIS_RESULT_TDATA;
  reg floating_point_1_M_AXIS_RESULT_TLAST;
  reg floating_point_1_M_AXIS_RESULT_TREADY;
  reg floating_point_1_M_AXIS_RESULT_TVALID;

  reg [15:0] a_data_reg, b_data_reg, result_data_reg;
  reg a_valid_reg, b_valid_reg, result_valid_reg;
  reg ready_reg, last_reg;

  [MASKED]

  assign M_AXIS_RESULT_0_tdata = floating_point_1_M_AXIS_RESULT_TDATA;
  assign M_AXIS_RESULT_0_tlast = floating_point_1_M_AXIS_RESULT_TLAST;
  assign M_AXIS_RESULT_0_tvalid = floating_point_1_M_AXIS_RESULT_TVALID;
  assign S_AXIS_A_0_tready = ready_reg;
  assign S_AXIS_B_0_tready = ready_reg;

endmodule