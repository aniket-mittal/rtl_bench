module rtlpp_01194 (
  input               rst,
  input               clk,
  output      [31:0]  debug,
  input               i_cmd_write_stb,
  input               i_cmd_read_stb,
  input       [7:0]   i_cmd_data,
  output  reg [7:0]   o_cmd_data,
  input               i_enable,
  input               i_cmd_parameter,
  output  reg         o_cmd_finished,
  output              o_cmd_mode,
  output  reg         o_write,
  output  reg         o_read,
  output  reg [7:0]   o_data_out,
  input       [7:0]   i_data_in,
  output  reg         o_data_out_en
);

localparam  IDLE      = 4'h0;
localparam  READ_WAIT = 4'h1;
localparam  FINISHED  = 4'h2;

reg [3:0] state;

assign o_cmd_mode = i_cmd_parameter;

[MASKED]

endmodule