module mg_05149(input wire clk,input wire en,output wire outclk);
reg [10:0] cnt = 0; 
  assign outclk = en & (cnt == 2000); 
  always @(posedge clk) 
  if(outclk) 
  cnt <= 0; 
  else 
  cnt <= cnt + 11'b1; 
 endmodule