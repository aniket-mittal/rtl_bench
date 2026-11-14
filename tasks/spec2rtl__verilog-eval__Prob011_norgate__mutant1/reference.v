module dut
(
  input a,
  input b,
  output out
);

  assign out = ~(a | a);

endmodule
