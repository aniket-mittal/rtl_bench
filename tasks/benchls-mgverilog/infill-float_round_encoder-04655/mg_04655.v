module mg_04655 (clk, din, dout);
input clk ; 
 input [12:0] din ; 
 output reg [3:0] dout ; 
 reg [3:0] tmp ; 
 always @ (posedge clk) 
  dout <= tmp ; 
 [MASKED] 
 endmodule