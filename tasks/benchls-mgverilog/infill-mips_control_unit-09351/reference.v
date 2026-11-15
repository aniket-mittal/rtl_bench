module mg_09351(clk, clr, OP, MemRead, MemWrite, MemtoReg, ALUOp, ALUSrc, RegWrite, RegDst, Branch, JumpSignal);
input clk, clr; 
 input [5:0] OP; 
 output MemRead, MemWrite, MemtoReg, ALUSrc, RegWrite, RegDst, Branch, JumpSignal; 
 reg MemRead, MemWrite, MemtoReg, ALUSrc, RegWrite, RegDst, Branch, JumpSignal; 
 output [1:0] ALUOp; 
 reg [1:0] ALUOp; 
 always @(OP) 
 begin 
  case (OP) 
  6'b100011: 
  begin 
  MemRead = 1; 
  MemWrite = 0; 
  MemtoReg = 1; 
  ALUOp = 2'b00; 
  ALUSrc = 1; 
  RegWrite = 1; 
  RegDst = 0; 
  Branch = 0; 
  JumpSignal = 0; 
  end 
  6'b101011: 
  begin 
  MemRead = 0; 
  MemWrite = 1; 
  MemtoReg = 0; 
  ALUOp = 2'b00; 
  ALUSrc = 1; 
  RegWrite = 0; 
  Branch = 0; 
  JumpSignal = 0; 
  end 
  0: 
  begin 
  MemRead = 0; 
  MemWrite = 0; 
  MemtoReg = 0; 
  ALUOp = 2'b10; 
  ALUSrc = 0; 
  RegWrite = 1; 
  RegDst = 1; 
  Branch = 0; 
  JumpSignal = 0; 
  end 
  4: 
  begin 
  MemRead = 0; 
  MemWrite = 0; 
  ALUOp = 2'b01; 
  ALUSrc = 0; 
  RegWrite = 0; 
  Branch = 1; 
  JumpSignal = 0; 
  end 
  2: 
  begin 
  MemRead = 0; 
  MemWrite = 0; 
  RegWrite = 0; 
  Branch = 0; 
  JumpSignal = 1; 
  end 
  3: 
  begin 
  MemRead = 0; 
  MemWrite = 0; 
  RegWrite = 0; 
  Branch = 0; 
  JumpSignal = 0; 
  end 
  endcase 
 end 
 initial 
 begin 
  MemRead = 0; 
  MemWrite = 0; 
  RegWrite = 0; 
  Branch = 0; 
  JumpSignal = 0; 
 end 
 endmodule