module mg_02679 (input clk,input [1:0] adr,input [1:0] din,output reg [1:0] q);
reg [1:0] ram [3:0]; 
  always@(posedge clk) 
  {ram[adr], q} <= {din, ram[adr]}; 
 endmodule