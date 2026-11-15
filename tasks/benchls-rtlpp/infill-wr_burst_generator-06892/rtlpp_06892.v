module rtlpp_06892 (
  input               clk,
  input               rst,
  input               i_enable,
  input       [1:0]   i_wr_rdy,
  output  reg [1:0]   o_wr_act,
  input       [23:0]  i_wr_size,
  output  reg         o_wr_stb,
  output  reg [31:0]  o_wr_data
);

reg   [23:0]          r_count;

[MASKED]

endmodule