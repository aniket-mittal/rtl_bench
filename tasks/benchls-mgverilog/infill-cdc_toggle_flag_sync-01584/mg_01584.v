module mg_01584(input wire CLK_A,input wire CLK_A_CE,input wire CLK_B,input wire CLK_B_CE,input wire FLAG_IN_CLK_A,output wire FLAG_OUT_CLK_B);
reg FLAG_TOGGLE_CLK_A; 
 initial FLAG_TOGGLE_CLK_A = 0; 
 reg [2:0] SYNC_CLK_B; 
 [MASKED] 
 always @ (posedge CLK_B) 
 begin 
  if (CLK_B_CE) 
  begin 
  SYNC_CLK_B <= {SYNC_CLK_B[1:0], FLAG_TOGGLE_CLK_A}; 
  end 
 end 
 assign FLAG_OUT_CLK_B = (SYNC_CLK_B[2] ^ SYNC_CLK_B[1]); 
 endmodule