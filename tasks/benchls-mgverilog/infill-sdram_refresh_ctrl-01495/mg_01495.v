module mg_01495 (enable,clk,ackn,rq);
parameter REFRESHPERIOD=11'h400; 
  input enable; 
  input clk; 
  input ackn; 
  output rq; 
  reg [12:0] nRefrDue; 
  reg [10:0] rcntr; 
  reg rtim; 
  reg rq; 
  [MASKED] 
  always @ (negedge clk) begin 
  if (!enable | rtim) rcntr[10:0] <= REFRESHPERIOD; 
  else rcntr[10:0] <= rcntr-1; 
  rtim <= !nRefrDue[12] && !(|rcntr[10:0]); 
  end 
  always @ (negedge clk) rq <= enable && |nRefrDue[12:0]; 
 endmodule