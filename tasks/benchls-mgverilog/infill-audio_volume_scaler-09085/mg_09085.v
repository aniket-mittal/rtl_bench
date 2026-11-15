module mg_09085(input clk,input rst,input sample,input [2:0] volume,input signed [13:0] pre,output reg signed [15:0] post);
wire signed [14:0] x2 = pre<<<1; 
 wire signed [15:0] x3 = x2+pre; 
 wire signed [15:0] x4 = pre<<<2; 
 wire signed [16:0] x6 = x4+x2; 
 wire signed [16:0] x8 = pre<<<3; 
 wire signed [17:0] x12 = x8+x4; 
 wire signed [17:0] x16 = pre<<<4; 
 [MASKED] 
 endmodule