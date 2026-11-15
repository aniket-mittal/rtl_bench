module mg_01433(rna,rnb,d,wn,we,clk,clrn,qa,qb);
input [4:0] rna,rnb,wn; 
  input [31:0] d; 
  input we,clk,clrn; 
  output [31:0] qa,qb; 
  integer i; 
  reg [31:0] register [1:31]; 
  assign qa=((rna==0)?0:register[rna]); 
  assign qb=((rnb==0)?0:register[rnb]); 
  [MASKED] 
 endmodule