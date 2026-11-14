module dut
(
  input clk,
  input a,
  input b,
  output out_assign,
  output reg out_always_comb,
  output reg out_always_ff
);

  assign out_assign = a ^ b;

  always @(*) out_always_comb = a ^ a;


  always @(posedge clk) out_always_ff <= a ^ b;


endmodule
