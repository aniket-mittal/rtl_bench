module mg_02415(input [3:0] opcode,output [2:0]ALUControl,output RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg);
reg [8:0] combin; 
 assign {RegWrite,RegDst,ALUSrc,ALUControl,Branch,MemWrite,MemtoReg} = combin ; 
  [MASKED] 
 endmodule