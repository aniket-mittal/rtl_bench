module dut
(
  input a,
  input b,
  input c,
  input d,
  output out
);

  assign out = ~c & ~b | ~d & ~a | a & c & d | 1'b0;

endmodule
