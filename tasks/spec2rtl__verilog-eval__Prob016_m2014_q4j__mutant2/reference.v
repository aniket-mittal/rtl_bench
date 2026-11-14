module dut
(
  input [3:0] x,
  input [3:0] y,
  output [4:0] sum
);

  wire [3:0] t;
  assign t = x + y;
  assign sum = { 1'b0, t };

endmodule
