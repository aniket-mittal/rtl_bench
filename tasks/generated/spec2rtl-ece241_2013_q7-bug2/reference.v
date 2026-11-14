module dut
(
  input clk,
  input j,
  input k,
  output reg Q
);


  always @(negedge clk) Q <= j & ~Q | ~k & Q;


endmodule
