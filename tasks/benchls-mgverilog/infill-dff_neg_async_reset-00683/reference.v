module mg_00683(D, Q, C, R);
input D, C, R; 
 output reg Q; 
 always @(negedge C or posedge R) begin 
  if (R == 1) 
  Q <= 0; 
  else 
  Q <= D; 
 end 
 endmodule