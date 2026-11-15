module mg_09146 (input wire clk,input wire clr,input wire [ 7:0] A,input wire [ 7:0] B,output reg [15:0] Z);
reg [15:0] acc; 
  [MASKED] 
  always @(posedge clk) 
  acc <= Z; 
 endmodule