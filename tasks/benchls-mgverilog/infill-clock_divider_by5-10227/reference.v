module mg_10227(input wire clk,input wire inclk,output wire outclk);
reg [2:0] cnt = 0; 
  assign outclk = cnt == 4; 
  always @(posedge clk) 
  if(outclk) 
  cnt <= 0; 
  else if(inclk) 
  cnt <= cnt + 3'b1; 
 endmodule