module mg_08599(input clk,input countlread,output freeze,output highce);
reg highcereg; 
  reg [4:0] sr = 5'b00000; 
  assign highce = highcereg; 
  assign freeze = sr[2]; 
  always @(*) begin 
  highcereg = 0; 
  if((sr[3] == 1) && (sr[4] == 0)) 
  highcereg = 1; 
  end 
  always @(posedge clk) begin 
  sr[4] <= sr[3]; 
  sr[3] <= sr[2]; 
  sr[2] <= sr[1]; 
  sr[1] <= sr[0]; 
  sr[0] <= countlread; 
  end 
 endmodule