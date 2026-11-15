module mg_05425(clk, rst, M_flush, M_stall, WB_stall, M_regwrite,M_memtoreg, M_alu_out, M_rt_rd, M_readdata,WB_regwrite, WB_memtoreg, WB_alu_out, WB_rt_rd,WB_readdata);
input clk; 
  input rst; 
  input M_flush; 
  input M_stall; 
  input WB_stall; 
  input M_regwrite; 
  input M_memtoreg; 
  input [31:0] M_alu_out; 
  input [31:0] M_readdata; 
  input [4:0] M_rt_rd; 
  output reg WB_regwrite; 
  output reg WB_memtoreg; 
  output reg [31:0] WB_readdata; 
  output reg [31:0] WB_alu_out; 
  output reg [4:0] WB_rt_rd; 
  [MASKED] 
 endmodule