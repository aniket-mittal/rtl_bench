module mg_09814 (input clk,input [15:0] a,input [15:0] b,input [7:0] op,input cf,output reg c_flag,output reg z_flag,output reg o_flag,output reg [15:0] acc,output reg [15:0] c);
parameter xADD = 8'h1; 
  parameter xADC = 8'h2; 
  parameter xSUB = 8'h3; 
  parameter xSUC = 8'h4; 
  parameter xMUL8 = 8'h5; 
  parameter xDIV8 = 8'h7; 
  parameter xCMP = 8'h9; 
  [MASKED] 
 endmodule