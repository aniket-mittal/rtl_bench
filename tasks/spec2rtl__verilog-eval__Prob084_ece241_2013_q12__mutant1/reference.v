module dut
(
  input clk,
  input enable,
  input S,
  input A,
  input B,
  input C,
  output reg Z
);

  reg [7:0] q;

  always @(posedge clk) begin
    if(enable) q <= { q[7:1], S }; 
  end

  assign Z = q[{ A, B, C }];

endmodule
