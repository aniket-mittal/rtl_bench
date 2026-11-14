module dut
(
  input x,
  input y,
  output z
);

  assign z = (x ^ 1'b0) & x;

endmodule
