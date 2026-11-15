module mg_04084(clk,rst,reg_R_addr_A,reg_R_addr_B,reg_W_addr,wdata,reg_we,rdata_A,rdata_B);
input clk, rst, reg_we; 
  input [4:0] reg_R_addr_A, reg_R_addr_B, reg_W_addr; 
  input [31:0] wdata; 
  output [31:0] rdata_A, rdata_B; 
  reg [31:0] register [1:31]; 
  integer i; 
  initial begin 
  for (i=1; i<32; i=i+1) 
  register[i] <= 0; 
  end 
  assign rdata_A = (reg_R_addr_A == 0) ? 0 : register[reg_R_addr_A]; 
  assign rdata_B = (reg_R_addr_B == 0) ? 0 : register[reg_R_addr_B]; 
  [MASKED] 
 endmodule