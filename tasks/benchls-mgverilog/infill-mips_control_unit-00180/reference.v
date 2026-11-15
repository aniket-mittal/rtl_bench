module mg_00180(input[5:0]OPcode,input[5:0]Fun,input wire int_code,input wire MIO_ready,input wire zero,output reg RegDst,output reg ALUSrc_B,output reg [1:0] DatatoReg,output reg Jal,output reg [1:0]Branch,output reg RegWrite,output reg mem_w,output reg [2:0]ALU_Control,output reg eret,output reg CPU_MIO);
always @* begin 
  RegDst=0; 
  ALUSrc_B=0; 
  DatatoReg=2'b00; 
  RegWrite=0; 
  Branch=2'b00; 
  Jal=0; 
  mem_w=0; 
  CPU_MIO=0; 
  eret=0; 
  case(OPcode) 
  6'b000000: begin RegDst=1;RegWrite=1; 
  case(Fun) 
  6'b100000: ALU_Control=3'b010; 
  6'b100010: ALU_Control=3'b110; 
  6'b100100: ALU_Control=3'b000; 
  6'b100101: ALU_Control=3'b001; 
  6'b101010: ALU_Control=3'b111; 
  6'b100111: ALU_Control=3'b100; 
  6'b000010: ALU_Control=3'b101; 
  6'b010110: ALU_Control=3'b011; 
  6'h08: Branch=2'b11; 
  default: ALU_Control=3'bx; 
  endcase 
  end 
  6'b100011: begin ALU_Control=3'b010; 
  ALUSrc_B=1;DatatoReg=2'b01;RegWrite=1; end 
  6'b101011: begin ALU_Control=3'b010; 
  ALUSrc_B=1; mem_w=1; end 
  6'b000100: begin ALU_Control=3'b110; 
  Branch={1'b0,zero}; end 
  6'b000010: Branch=2'b10; 
  6'h05: begin ALU_Control=3'b110; 
  Branch={1'b0,~zero}; end 
  6'h24: begin ALU_Control=3'b111; 
  ALUSrc_B=1; RegWrite=1; end 
  6'h08: begin ALU_Control=3'b010; 
  ALUSrc_B=1; RegWrite=1; end 
  6'h0c: begin ALU_Control=3'b000; 
  ALUSrc_B=1; RegWrite=1; end 
  6'h0d: begin ALU_Control=3'b001; 
  ALUSrc_B=1; RegWrite=1;end 
  6'h03: begin Jal=1; Branch=2'b10; 
  DatatoReg=2'b11; RegWrite=1; end 
  6'h0f: begin DatatoReg=2'b10; RegWrite=1;end 
  6'h10: if (int_code & Fun == 6'h18) eret=1; 
  default: ALU_Control=3'b010; 
  endcase 
  end 
 endmodule