module mg_06295(input wire clk,input wire reset,input wire enable,output wire out);
reg [2:0] cnt = 4; 
  [MASKED] 
  assign out = cnt[2]; 
 endmodule