module autovcoder_072758 (
    clk,
    rst,
    press,
    scan_code,
    buf_flag,
    key_buf_code,
    key_buf_code_2,
    key_buf_code_3,
    key_buf_code_4
);
  input clk, rst, press;
  input [3:0] scan_code;
  output [5:0] buf_flag;
  output [23:0] key_buf_code;
  output [23:0] key_buf_code_2;
  output [31:0] key_buf_code_3;
  output [31:0] key_buf_code_4;

  reg [ 5:0] buf_flag;
  reg [23:0] key_buf_code;
  reg [23:0] key_buf_code_2;
  reg [31:0] key_buf_code_3;
  reg [31:0] key_buf_code_4;

  [MASKED]
endmodule

