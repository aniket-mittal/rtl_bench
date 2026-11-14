module dut
(
  input [15:0] in,
  output [7:0] out_hi,
  output [7:0] out_lo
);

  assign { out_lo, out_hi } = in;

endmodule
