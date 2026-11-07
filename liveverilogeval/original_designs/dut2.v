

module dut
(
  out,
  clk,
  rst
);

  input clk;
  input rst;
  output [3:0] out;
  reg [3:0] out;
  wire feedback;
  assign feedback = ~(out[3] ^ out[2]);

  always @(posedge clk or posedge rst) begin
    if(rst) out = 4'b0; 
    else out = { out[2:0], feedback };
  end


endmodule

