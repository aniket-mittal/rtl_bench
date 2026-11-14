module dut
(
  input clk,
  input d,
  output reg q
);


  initial q = 1'hx;


  always @(*) q <= d;


endmodule
