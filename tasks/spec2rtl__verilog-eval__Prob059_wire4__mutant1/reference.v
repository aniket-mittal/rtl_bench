module dut
(
  input a,
  input b,
  input c,
  output w,
  output x,
  output y,
  output z
);

  assign { w, x, y, z } = { c, b, b, a };

endmodule
