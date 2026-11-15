module mg_08534(Saltoincond,instru,clk,RegDest,SaltoCond,LeerMem,MemaReg,ALUOp,EscrMem,FuenteALU,EscrReg);
input [5:0]instru; 
 input clk; 
 output wire RegDest; 
 output wire SaltoCond; 
 output wire LeerMem; 
 output wire MemaReg; 
 output wire [1:0]ALUOp; 
 output wire EscrMem; 
 output wire FuenteALU; 
 output wire EscrReg; 
 output wire Saltoincond; 
 reg [9:0]aux; 
 [MASKED] 
 assign Saltoincond = aux[9]; 
 assign RegDest = aux[8]; 
 assign FuenteALU = aux[7]; 
 assign MemaReg = aux[6]; 
 assign EscrReg = aux[5]; 
 assign LeerMem = aux[4]; 
 assign EscrMem = aux[3]; 
 assign SaltoCond = aux[2]; 
 assign ALUOp = aux[1:0]; 
 endmodule