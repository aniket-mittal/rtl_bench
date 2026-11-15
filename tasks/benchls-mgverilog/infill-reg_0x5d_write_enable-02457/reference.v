module mg_02457(output reg [7:0] reg_0x5D, input wire reset, input wire wenb, input wire [7:0] in_data, input wire clk);
always@(posedge clk) 
  begin 
  if(reset==0) begin 
  if(wenb==0) 
  reg_0x5D<=in_data; 
  else 
  reg_0x5D<=reg_0x5D; 
  end 
  else 
  reg_0x5D<=8'h00; 
  end 
 endmodule