module mg_05594 (input wire [5:0] Opcode,output reg RegWrite,output reg RegDst,output reg MemRead,output reg MemWrite,output reg MemToReg,output reg Branch,output reg ALUSrc,output reg [1:0] ALUOp);
always @ (Opcode) begin 
  case(Opcode) 
  0 : begin 
  RegDst = 1'b1; 
  Branch = 1'b0; 
  MemRead = 1'b0; 
  MemToReg = 1'b0; 
  ALUOp = 2'b10; 
  MemWrite = 1'b0; 
  ALUSrc = 1'b0; 
  RegWrite = 1'b1; 
  end 
  4 : begin 
  RegDst = 1'b0; 
  Branch = 1'b1; 
  MemRead = 1'b0; 
  MemToReg = 1'b0; 
  ALUOp = 2'b01; 
  MemWrite = 1'b0; 
  ALUSrc = 1'b0; 
  RegWrite = 1'b0; 
  end 
  5 : begin 
  RegDst = 1'b0; 
  Branch = 1'b1; 
  MemRead = 1'b0; 
  MemToReg = 1'b0; 
  ALUOp = 2'b11; 
  MemWrite = 1'b0; 
  ALUSrc = 1'b0; 
  RegWrite = 1'b0; 
  end 
  35 : begin 
  RegDst = 1'b0; 
  Branch = 1'b0; 
  MemRead = 1'b1; 
  MemToReg = 1'b1; 
  ALUOp = 2'b00; 
  MemWrite = 1'b0; 
  ALUSrc = 1'b1; 
  RegWrite = 1'b1; 
  end 
  43 : begin 
  RegDst = 1'b0; 
  Branch = 1'b0; 
  MemRead = 1'b0; 
  MemToReg = 1'b0; 
  ALUOp = 2'b00; 
  MemWrite = 1'b1; 
  ALUSrc = 1'b1; 
  RegWrite = 1'b0; 
  end 
  default : begin 
  RegDst = 1'b0; 
  Branch = 1'b0; 
  MemRead = 1'b0; 
  MemToReg = 1'b0; 
  ALUOp = 2'b11; 
  MemWrite = 1'b0; 
  ALUSrc = 1'b0; 
  RegWrite = 1'b0; 
  end 
  endcase 
  end 
 endmodule