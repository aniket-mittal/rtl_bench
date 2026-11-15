module mg_05572(clk, rst, y);
input clk, rst; 
 output y; 
 reg [3:0] counter; 
 [MASKED] 
 assign y = counter == 12; 
 endmodule