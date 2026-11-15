module mg_01493 (input clk,input reset,input go,input [7:0] data,output match,output done);
reg [2:0] af_state; 
  [MASKED] 
  assign match = (af_state==6); 
  assign done = (af_state==6)|(af_state==7); 
 endmodule