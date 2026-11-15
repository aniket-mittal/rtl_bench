module mg_03518(input wire clk,input wire inclk,output wire outclk);
reg [4:0] cnt = 0; 
  assign outclk = cnt == 16; 
  always @(posedge clk) 
  if(outclk) 
  cnt <= 0; 
  else if(inclk) 
  cnt <= cnt + 5'b1; 
 endmodule