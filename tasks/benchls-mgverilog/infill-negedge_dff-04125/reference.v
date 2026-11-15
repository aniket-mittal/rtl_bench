module mg_04125 (output reg Q, input CLK, D);
parameter [0:0] INIT = 1'b0; 
  initial Q = INIT; 
  always @(negedge CLK) 
  Q <= D; 
 endmodule