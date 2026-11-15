module mg_06295(input wire clk,input wire reset,input wire enable,output wire out);
reg [2:0] cnt = 4; 
  always @(posedge clk) 
  if(reset) 
  cnt <= 0; 
  else if(enable) 
  cnt <= cnt + 3'b1; 
  assign out = cnt[2]; 
 endmodule