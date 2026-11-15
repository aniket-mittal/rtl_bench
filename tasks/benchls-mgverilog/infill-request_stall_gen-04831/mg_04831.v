module mg_04831(request,clk,resetn,stalled);
input request; 
 input clk; 
 input resetn; 
 output stalled; 
  reg T,Tnext; 
  [MASKED] 
  always@(posedge clk) 
  if (~resetn) 
  T<=0; 
  else 
  T<=Tnext; 
  assign stalled=(request&~T); 
 endmodule