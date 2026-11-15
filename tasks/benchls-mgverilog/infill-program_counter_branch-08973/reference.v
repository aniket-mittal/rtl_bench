module mg_08973(input clk,output [31:0] pc,input branch,input [31:0] baddr);
reg branch3 = 1'b0; 
  reg [31:0] pc0 = 32'd0; 
  reg [31:0] pc1 = 32'd0; 
  reg [31:0] pc2 = 32'd0; 
  reg [31:0] pc3 = 32'd0; 
  assign pc = pc0; 
  always @(posedge clk) begin 
  if (branch3) 
  pc0 <= pc3; 
  else 
  pc0 <= pc0 + 4; 
  pc1 <= pc0; 
  pc2 <= pc1; 
  pc3 <= 32'd0; 
  branch3 <= 1'b0; 
  if (branch) begin 
  pc3 <= pc2 + baddr; 
  branch3 <= 1'b1; 
  end 
  end 
 endmodule