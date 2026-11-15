module mg_03010 (input wire clk_sys,input wire rst,output reg ao486_rst,input wire [1:0] address,input wire write,input wire [31:0] writedata);
always @(posedge clk_sys) begin 
  if(rst) begin 
  ao486_rst <= 1; 
  end else begin 
  if(write && writedata[0] == 1'b0 && address == 4'b0000) 
  ao486_rst <= 0; 
  else if(write && writedata[0] == 1'b1 && address == 4'b0000) 
  ao486_rst <= 1; 
  end 
  end 
 endmodule