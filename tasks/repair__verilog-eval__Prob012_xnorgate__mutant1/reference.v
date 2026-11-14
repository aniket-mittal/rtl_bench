module dut
(
  input a,
  input b,
  output out
);

  assign out = ~(a ^ 1'b0);

endmodule
