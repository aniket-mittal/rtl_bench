module dut
(
  input [1023:0] in,
  input [7:0] sel,
  output [3:0] out
);

  assign out = { in[(sel + 1) * 4 + 3], in[(sel + 1) * 4 + 2], in[(sel + 1) * 4 + 1], in[(sel + 1) * 4 + 0] };

endmodule
