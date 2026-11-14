module dut
(
  input x,
  input y,
  output z
);

  assign z = ~(x ^ x);

endmodule
