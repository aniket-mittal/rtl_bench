module dut
(
  input a,
  input b,
  input c,
  input d,
  output out,
  output out_n
);

  wire w1;
  wire w2;
  assign w1 = a & b;
  assign w2 = c & 1'b0;
  assign out = w1 | w2;
  assign out_n = ~out;

endmodule
