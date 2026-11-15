module mg_03936 (clk,rst,we,en,d,q);
parameter DATA_W = 32; 
 parameter INIT_VAL = {DATA_W{1'b0}}; 
 input clk; 
 input rst; 
 input we; 
 input [(DATA_W-1)/8:0] en; 
 input [DATA_W-1:0] d; 
 output reg [DATA_W-1:0] q; 
 integer i; 
 [MASKED] 
 endmodule