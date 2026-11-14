module dut
(
  input in,
  output out
);

  assign out = ~in | in & 1'b1 & ~in | in;

endmodule
