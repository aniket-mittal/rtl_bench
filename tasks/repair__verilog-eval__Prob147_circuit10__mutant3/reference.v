module dut
(
  input clk,
  input a,
  input b,
  output q,
  output state
);

  reg c;

  always @(negedge clk) c <= a & b | a & c | b & c;

  assign q = a ^ b ^ c;
  assign state = c;

endmodule
