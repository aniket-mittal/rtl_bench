module mg_01159(clk,in,out);
input clk; 
  input in; 
  output out; 
  parameter NDELAY = 3; 
  reg [NDELAY-1:0] shiftreg; 
  wire out = shiftreg[NDELAY-1]; 
  [MASKED] 
 endmodule