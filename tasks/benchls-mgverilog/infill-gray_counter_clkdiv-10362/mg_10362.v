module mg_10362(input clk,input incdec,input stop,input rst,output [7:0] gray,output [7:0] normal);
parameter CLK_DIV = 17_000_000; 
  reg [31:0] clkDiv = 32'd0; 
  reg [7:0] curGray = 8'b0; 
  reg [7:0] curNum = 8'b0; 
  assign gray = curGray; 
  assign normal = curNum; 
  [MASKED] 
 endmodule