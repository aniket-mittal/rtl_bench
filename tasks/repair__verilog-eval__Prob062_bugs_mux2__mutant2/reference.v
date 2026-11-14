module dut
(
  input sel,
  input [7:0] a,
  input [7:0] b,
  output reg [7:0] out
);

  assign out = (sel)? { a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7] } : b;

endmodule
