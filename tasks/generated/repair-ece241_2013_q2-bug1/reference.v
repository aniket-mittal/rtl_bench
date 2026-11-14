module dut
(
  input a,
  input b,
  input c,
  input d,
  output out_sop,
  output out_pos
);

  wire pos0;
  wire pos1;
  assign out_pos = c & d | ~a & ~b & c;
  assign pos0 = c & (~b | d) & (~a | b);
  assign pos1 = c & (~b | d) & (~a | d);
  assign out_sop = (pos0 == pos1)? pos0 : 1'bx;

endmodule
