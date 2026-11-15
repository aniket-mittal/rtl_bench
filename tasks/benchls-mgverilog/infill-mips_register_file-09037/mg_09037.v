module mg_09037(clk, regwrite, data_in, reg_addr1, reg_addr2, write_addr, reg_out1, reg_out2);
input clk; 
  input regwrite; 
  input [31:0] data_in; 
  input [4:0] reg_addr1, reg_addr2; 
  input [4:0] write_addr; 
  output [31:0] reg_out1, reg_out2; 
  reg [31:0] gpr_reg [31:0]; 
  [MASKED] 
  assign reg_out1 = (reg_addr1 == 5'b00) ? 32'b0 : gpr_reg[reg_addr1]; 
  assign reg_out2 = (reg_addr2 == 5'b00) ? 32'b0 : gpr_reg[reg_addr2]; 
 endmodule