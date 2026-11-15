module mg_02009(input clk,input [7:0] VD,input [1:0] CD,input VDE,output reg [9:0] TMDS);
reg [3:0] balance_acc; 
 reg [8:0] q_m; 
 reg [1:0] CD2; 
 reg VDE2; 
 initial begin 
  balance_acc=0; 
  q_m=0; 
  CD2=0; 
  VDE2=0; 
 end 
 function [3:0] balance; 
  input [7:0] qm; 
  begin 
  balance = qm[0] + qm[1] + qm[2] + qm[3] + qm[4] + qm[5] + qm[6] + qm[7] - 4'd4; 
  end 
 endfunction 
 [MASKED] 
 endmodule