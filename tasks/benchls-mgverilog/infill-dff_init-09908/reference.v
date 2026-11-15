module mg_09908(input D, CLK, output reg Q);
parameter [0:0] INIT = 1'bx; 
  initial Q = INIT; 
  always @(posedge CLK) begin 
  Q <= D; 
  end 
 endmodule