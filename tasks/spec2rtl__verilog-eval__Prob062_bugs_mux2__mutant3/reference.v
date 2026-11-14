module dut
(
  input sel,
  input [7:0] a,
  input [7:0] b,
  output reg [7:0] out
);

  assign out = (sel | a[0])? a : b;

endmodule
