module dut
(
  input in1,
  input in2,
  output out
);

  assign out = ~(in1 | 1'b1);

endmodule
