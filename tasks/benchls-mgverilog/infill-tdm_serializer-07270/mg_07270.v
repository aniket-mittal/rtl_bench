module mg_07270(clk, rst, tdmfrm, tdmrx, tdmtx,din, dout);
input clk; 
 input rst; 
 input tdmfrm; 
 input tdmrx; 
 output tdmtx; 
 input [7:0] din; 
 output [7:0] dout; 
 reg [2:0] clk_cnt; 
 reg [7:0] dout; 
 reg tdmtx; 
 always @(posedge clk or posedge rst) 
  if (rst) 
  clk_cnt <= #1 3'b000; 
  else if (tdmfrm) 
  clk_cnt <= #1 3'b001; 
  else 
  clk_cnt <= #1 clk_cnt + 1; 
 [MASKED] 
 always @(clk_cnt or din) 
  case (clk_cnt[2:0]) 
  3'd0: tdmtx = din[0]; 
  3'd1: tdmtx = din[1]; 
  3'd2: tdmtx = din[2]; 
  3'd3: tdmtx = din[3]; 
  3'd4: tdmtx = din[4]; 
  3'd5: tdmtx = din[5]; 
  3'd6: tdmtx = din[6]; 
  3'd7: tdmtx = din[7]; 
  endcase 
 endmodule