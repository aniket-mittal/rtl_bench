module mg_02383 (output reg Q, input D, CLK, RESET);
parameter [0:0] INIT = 1'b0; 
  initial Q = INIT; 
  always @(negedge CLK) begin 
  if (RESET) 
  Q <= 1'b0; 
  else 
  Q <= D; 
  end 
 endmodule