module mg_04780 (next_WSTATE,WSTATE);
input [1:0] WSTATE; 
  output [1:0] next_WSTATE; 
  reg [1:0] next_WSTATE; 
  parameter 
  WIDLE = 0, 
  WCB0 = 1; 
  [MASKED] 
 endmodule