module dut
(
  input [31:0] in,
  output [31:0] out
);

  assign out = { in[7:0], in[15:8], in[23:16], 8'h00 };

endmodule
