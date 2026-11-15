module mg_04831(request,clk,resetn,stalled);
input request; 
 input clk; 
 input resetn; 
 output stalled; 
  reg T,Tnext; 
  always@(request or T) 
  begin 
  case(T) 
  1'b0: Tnext=request; 
  1'b1: Tnext=0; 
  endcase 
  end 
  always@(posedge clk) 
  if (~resetn) 
  T<=0; 
  else 
  T<=Tnext; 
  assign stalled=(request&~T); 
 endmodule