module mg_02359 (A,B,Z);
input A, B; 
  output Z; 
  assign Z = A&~B; 
 endmodule