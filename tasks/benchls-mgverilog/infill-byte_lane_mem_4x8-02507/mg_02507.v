module mg_02507(clk, addr, wdata, rdata, wen);
input clk; 
 input [1:0] addr; 
 input [7:0] wdata; 
 output reg [7:0] rdata; 
 input [3:0] wen; 
 reg [7:0] mem [0:3]; 
 integer i; 
 [MASKED] 
 endmodule