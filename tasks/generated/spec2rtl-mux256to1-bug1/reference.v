module dut
(
  input [255:0] in,
  input [7:0] sel,
  output out
);

  assign out = in[{ sel[7:2], sel[0], sel[1] }];

endmodule
