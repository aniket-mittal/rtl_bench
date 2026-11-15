module mg_04051 (output reg Q, input D, CLK, SET);
parameter [0:0] INIT = 1'b1; 
  initial Q = INIT; 
  always @(negedge CLK) begin 
  if (SET) 
  Q <= 1'b1; 
  else 
  Q <= D; 
  end 
 endmodule