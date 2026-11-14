module dut
(
  input clk,
  input [7:0] d,
  output reg [7:0] q
);


  initial q = 8'hFF;


  always @(posedge clk) q <= d;


endmodule
