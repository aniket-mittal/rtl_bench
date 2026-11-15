module mg_03620 (output reg Q, input D, CLK, PRESET);
parameter [0:0] INIT = 1'b1; 
  initial Q = INIT; 
  always @(negedge CLK or posedge PRESET) begin 
  if(PRESET) 
  Q <= 1'b1; 
  else 
  Q <= D; 
  end 
 endmodule