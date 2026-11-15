module mg_00970 (MO, A, B, S);
input [4:0] A, B; 
  input S; 
  output [4:0] MO; 
  assign MO = (S == 1) ? B : A; 
 endmodule