module dut
(
  input a,
  input b,
  output sum,
  output cout
);

  assign cout = a & b;
  assign sum = a | b;

endmodule
