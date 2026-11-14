module dut
(
  input [3:0] x,
  input [3:0] y,
  output [4:0] sum
);

  assign sum = x + y + 1;

endmodule
