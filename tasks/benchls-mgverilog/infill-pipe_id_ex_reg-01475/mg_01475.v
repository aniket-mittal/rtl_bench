module mg_01475(i_wreg,i_m2reg,i_wmem,i_aluc,i_aluimm,i_a,i_b,i_imm,i_rn,i_shift,i_jal,i_pc4,i_sa,clk,rst,o_wreg,o_m2reg,o_wmem,o_aluc,o_aluimm,o_a,o_b,o_imm,o_rn,o_shift,o_jal,o_pc4,o_sa);
input wire clk, rst,i_wreg,i_m2reg,i_wmem,i_aluimm,i_shift,i_jal; 
  input wire [3:0] i_aluc; 
  input wire [7:0] i_pc4; 
  input wire [31:0] i_a,i_b,i_imm; 
  input wire [4:0] i_rn,i_sa; 
  output reg o_wreg,o_m2reg,o_wmem,o_aluimm,o_shift,o_jal; 
  output reg [3:0] o_aluc; 
  output reg [7:0] o_pc4; 
  output reg [31:0] o_a,o_b,o_imm; 
  output reg [4:0] o_rn,o_sa; 
  [MASKED] 
 endmodule