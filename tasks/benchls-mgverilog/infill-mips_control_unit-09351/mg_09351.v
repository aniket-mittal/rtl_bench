module mg_09351(clk, clr, OP, MemRead, MemWrite, MemtoReg, ALUOp, ALUSrc, RegWrite, RegDst, Branch, JumpSignal);
input clk, clr; 
 input [5:0] OP; 
 output MemRead, MemWrite, MemtoReg, ALUSrc, RegWrite, RegDst, Branch, JumpSignal; 
 reg MemRead, MemWrite, MemtoReg, ALUSrc, RegWrite, RegDst, Branch, JumpSignal; 
 output [1:0] ALUOp; 
 reg [1:0] ALUOp; 
 [MASKED] 
 initial 
 begin 
  MemRead = 0; 
  MemWrite = 0; 
  RegWrite = 0; 
  Branch = 0; 
  JumpSignal = 0; 
 end 
 endmodule