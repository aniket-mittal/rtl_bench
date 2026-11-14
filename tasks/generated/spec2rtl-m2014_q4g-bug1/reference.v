module dut
(
  input in1,
  input in2,
  input in3,
  output out
);

  assign out = ~(in1 ^ in2);

endmodule
