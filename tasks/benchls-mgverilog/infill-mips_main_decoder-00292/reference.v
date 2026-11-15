module mg_00292(input [5:0] op,output memtoreg, memwrite,output branch, alusrc,output regdst, regwrite,output jump,output [1:0] aluop);
reg [8:0] controls; 
  assign {memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop} = controls; 
  always @ (op) begin 
  case(op) 
  6'b000000: controls <= 9'b000011011; 
  6'b100011: controls <= 9'b100101000; 
  6'b101011: controls <= 9'b010100000; 
  6'b000100: controls <= 9'b001000001; 
  6'b001000: controls <= 9'b000101000; 
  6'b000010: controls <= 9'b000000100; 
  default: controls <= 9'bxxxxxxxxx; 
  endcase 
  end 
 endmodule