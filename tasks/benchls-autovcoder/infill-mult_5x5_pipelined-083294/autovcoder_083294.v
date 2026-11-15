module autovcoder_083294 (
    rd_data,
    clk,
    rst_n,
    mul_out
);

  input [15:0] rd_data;
  input clk;
  input rst_n;
  output [9:0] mul_out;

  reg [4:0] mul_a, mul_b;

  reg [9:0] mul_out_1;
  reg [9:0] mul_out_2;
  reg [9:0] mul_out;

  reg [9:0] stored0;
  reg [9:0] stored1;
  reg [9:0] stored2;
  reg [9:0] stored3;
  reg [9:0] stored4;

  reg [9:0] add01;
  reg [9:0] add23;
  reg [9:0] add4;

  [MASKED]
endmodule

