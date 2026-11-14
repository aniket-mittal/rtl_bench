module dut
(
  input clk,
  input [7:0] d,
  output reg [7:0] q
);


  initial q = 8'h0;


  always @(posedge clk) q <= { 1'b0, d[6:0] };


endmodule
