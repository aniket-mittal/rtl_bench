module mg_05622 ( clk, d, q );
input clk; 
  input [36:0] d; 
  output [36:0] q; 
  reg [36:0] q; 
 `ifdef RANDOM_INIT 
  initial 
  $random_init("q"); 
 `endif 
  always @(posedge clk) begin 
  q <= d; 
  end 
 endmodule