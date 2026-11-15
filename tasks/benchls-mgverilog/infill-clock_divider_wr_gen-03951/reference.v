module mg_03951(input reset_n,input clk,output CS_n,output RD_n,output reg WR_n);
reg [7:0]count; 
  assign CS_n = 0; 
  assign RD_n = 0; 
  always @ (posedge clk, negedge reset_n) 
  begin 
  count <= count + 1; 
  if(!reset_n) 
  begin 
  WR_n <= 0; 
  count <= 0; 
  end 
  else 
  if(count == 20) 
  WR_n <= ~WR_n; 
  else if(count == 200) 
  begin 
  WR_n <= ~WR_n; 
  count <= 0; 
  end 
  end 
 endmodule