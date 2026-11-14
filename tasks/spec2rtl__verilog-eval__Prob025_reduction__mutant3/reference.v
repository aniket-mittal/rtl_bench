module dut
(
  input [7:0] in,
  output parity
);

  assign parity = ^in[6:0];

endmodule
