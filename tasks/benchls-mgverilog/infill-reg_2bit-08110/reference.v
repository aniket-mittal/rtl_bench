module mg_08110 ( clk, d, q );
input clk; 
  input [1:0] d; 
  output [1:0] q; 
  reg [1:0] q; 
 `ifdef RANDOM_INIT 
  initial 
  $random_init("q"); 
 `endif 
  always @(posedge clk) begin 
  q <= d; 
  end 
 endmodule