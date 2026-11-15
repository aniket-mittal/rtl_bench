module mg_05942(clk,rst,stall,ex_aluresult, ex_td, ex_d2, ex_WREG, ex_WMEM, ex_LW,ex_instr,ex_pc,me_aluresult, me_td, me_d2, me_WREG, me_WMEM, me_LW,me_instr,me_pc);
input clk,rst,stall; 
  input wire [31:0] ex_aluresult,ex_d2,ex_instr,ex_pc; 
  input wire [4:0] ex_td; 
  input wire ex_WREG,ex_WMEM,ex_LW; 
  output reg [31:0] me_aluresult,me_d2,me_instr,me_pc; 
  output reg [4:0] me_td; 
  output reg me_WREG,me_WMEM,me_LW; 
  [MASKED] 
 endmodule