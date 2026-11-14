module dut
(
  input [3:0] in,
  output out_and,
  output out_or,
  output out_xor
);

  assign out_and = &in[3:1];
  assign out_or = |in;
  assign out_xor = ^in;

endmodule
