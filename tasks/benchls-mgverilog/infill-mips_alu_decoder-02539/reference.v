module mg_02539(funct, aluop, alucontrol, signd, multseld);
input [5:0] funct; 
  input [3:0] aluop; 
  output reg [2:0] alucontrol; 
  output reg signd, multseld; 
  always @(*) begin 
  case(aluop) 
  4'b0000: begin alucontrol <= 3'b010; signd <= 1'b1; multseld <= 1'b0; end 
  4'b0010: begin 
  case(funct) 
  6'b100000: begin alucontrol <= 3'b010; signd <= 1'b1; multseld <= 1'b0; end 
  6'b100001: begin alucontrol <= 3'b010; signd <= 1'b0; multseld <= 1'b0; end 
  6'b100010: begin alucontrol <= 3'b110; signd <= 1'b1; multseld <= 1'b0; end 
  6'b100011: begin alucontrol <= 3'b110; signd <= 1'b0; multseld <= 1'b0; end 
  6'b100100: begin alucontrol <= 3'b000; signd <= 1'b1; multseld <= 1'b0; end 
  6'b100101: begin alucontrol <= 3'b001; signd <= 1'b1; multseld <= 1'b0; end 
  6'b101010: begin alucontrol <= 3'b111; signd <= 1'b1; multseld <= 1'b0; end 
  6'b101011: begin alucontrol <= 3'b111; signd <= 1'b0; multseld <= 1'b0; end 
  6'b100110: begin alucontrol <= 3'b011; signd <= 1'b1; multseld <= 1'b0; end 
  6'b011000: begin alucontrol <= 3'bxxx; signd <= 1'b1; multseld <= 1'b1; end 
  6'b011001: begin alucontrol <= 3'bxxx; signd <= 1'b0; multseld <= 1'b1; end 
  default: begin alucontrol <= 3'bxxx; signd <= 1'b0; multseld <= 1'b0; end 
  endcase 
  end 
  4'b0001: begin alucontrol <= 3'b110; signd <= 1'b1; multseld <= 1'b0; end 
  4'b0011: begin alucontrol <= 3'b001; signd <= 1'b1; multseld <= 1'b0; end 
  4'b0100: begin alucontrol <= 3'b000; signd <= 1'b1; multseld <= 1'b0; end 
  4'b0101: begin alucontrol <= 3'b011; signd <= 1'b1; multseld <= 1'b0; end 
  4'b0110: begin alucontrol <= 3'b111; signd <= 1'b1; multseld <= 1'b0; end 
  4'b0111: begin alucontrol <= 3'b011; signd <= 1'b0; multseld <= 1'b0; end 
  4'b1000: begin alucontrol <= 3'b111; signd <= 1'b0; multseld <= 1'b0; end 
  default: begin alucontrol <= 3'bxxx; signd <= 1'b0; multseld <= 1'b0; end 
  endcase 
  end 
 endmodule