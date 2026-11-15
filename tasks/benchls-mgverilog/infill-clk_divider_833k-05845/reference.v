module mg_05845(input wire clk,output wire outclk);
reg [19:0] cnt = 0; 
  assign outclk = cnt == 833333; 
  always @(posedge clk) 
  if(outclk) 
  cnt <= 0; 
  else 
  cnt <= cnt + 20'b1; 
 endmodule