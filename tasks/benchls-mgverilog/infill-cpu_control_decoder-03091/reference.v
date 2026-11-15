module mg_03091(output reg ext_signed,output reg bSelect,output reg shftSelect,output reg aluSelect,output reg [1:0] wregSelect,output reg jmp,output reg branch,output reg rwren,output reg dwren,input [15:0] instr,input [15:0] psr);
reg condflag; 
  wire [3:0] cond; 
  wire [3:0] opcode; 
  wire st_ld; 
  wire mem_jmp; 
  assign cond = instr[11:8]; 
  assign opcode = instr[15:12]; 
  assign st_ld = instr[6]; 
  assign mem_jmp = instr[7]; 
  always @(*) 
  begin 
  case(cond) 
  4'b0000: condflag = psr[6]; 
  4'b0001: condflag = !psr[6]; 
  4'b1101: condflag = psr[6] || psr[7]; 
  4'b0010: condflag = psr[0]; 
  4'b0011: condflag = !psr[0]; 
  4'b0100: condflag = psr[2]; 
  4'b0101: condflag = !psr[2]; 
  4'b1010: condflag = !psr[2] && !psr[6]; 
  4'b1011: condflag = psr[2] || psr[6]; 
  4'b0110: condflag = psr[7]; 
  4'b0111: condflag = !psr[7]; 
  4'b1000: condflag = psr[5]; 
  4'b1001: condflag = !psr[5]; 
  4'b1100: condflag = !psr[7] && !psr[6]; 
  4'b1110: condflag = 1'b1; 
  4'b1111: condflag = 1'b0; 
  default: condflag = 1'b0; 
  endcase 
  end 
  always @(*) 
  begin 
  ext_signed = 0; 
  bSelect = 0; 
  shftSelect = 0; 
  aluSelect = 0; 
  wregSelect = 2'b00; 
  jmp = 0; 
  branch = 0; 
  rwren = 0; 
  dwren = 0; 
  case(opcode) 
  4'b0000: begin 
  bSelect = 1; 
  aluSelect = 0; 
  wregSelect = 2'b10; 
  rwren = 1; 
  end 
  4'b0100: if(mem_jmp) begin 
  if(st_ld) begin 
  jmp = condflag; 
  end 
  else begin 
  jmp = 1'b1; 
  rwren = 1'b1; 
  wregSelect = 2'b01; 
  end 
  end 
  else begin 
  if(st_ld) begin 
  dwren = 1; 
  end 
  else begin 
  wregSelect = 2'b00; 
  rwren = 1; 
  end 
  end 
  4'b1100: branch = condflag; 
  4'b1000: begin 
  rwren = 1; 
  wregSelect = 2'b11; 
  if(st_ld) begin 
  shftSelect = 0; 
  end 
  else begin 
  shftSelect = 1; 
  end 
  end 
  4'b0101, 4'b1001, 4'b1011: 
  begin 
  rwren = 1; 
  wregSelect = 2'b10; 
  aluSelect = 1; 
  bSelect = 0; 
  ext_signed = 1; 
  end 
  4'b0001, 4'b0010, 4'b0011, 4'b1101, 4'b1111: 
  begin 
  rwren = 1; 
  wregSelect = 2'b10; 
  aluSelect = 1; 
  bSelect = 0; 
  ext_signed = 0; 
  end 
  default: begin 
  end 
  endcase 
  end 
 endmodule