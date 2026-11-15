module mg_10435 ( clk, d, q );
input clk; 
  input [15:0] d; 
  output [15:0] q; 
  reg [15:0] q; 
 `ifdef RANDOM_INIT 
  initial 
  $random_init("q"); 
 `endif 
  always @(posedge clk) begin 
  q <= d; 
  end 
 endmodule