module mg_10223(clk,rst,branch,mem_read,mem_write,ll_mem,sc_mem,reg_write,memtoreg,alu_zero,alu_result,reg_read2,dest_reg,mem_branch,mem_mem_read,mem_mem_write,mem_ll_mem,mem_sc_mem,mem_reg_write,mem_memtoreg,mem_alu_zero,mem_alu_result,mem_reg_read2,mem_dest_reg);
input clk; 
 input rst; 
 input branch; 
 input mem_read; 
 input mem_write; 
 input ll_mem; 
 input sc_mem; 
 input reg_write; 
 input memtoreg; 
 input alu_zero; 
 input [31:0] alu_result; 
 input [31:0] reg_read2; 
 input [4:0] dest_reg; 
 output mem_branch; 
 output mem_mem_read; 
 output mem_mem_write; 
 output mem_ll_mem; 
 output mem_sc_mem; 
 output mem_reg_write; 
 output mem_memtoreg; 
 output mem_alu_zero; 
 output [31:0] mem_alu_result; 
 output [31:0] mem_reg_read2; 
 output [4:0] mem_dest_reg; 
 reg mem_branch; 
 reg mem_mem_read; 
 reg mem_mem_write; 
 reg mem_ll_mem; 
 reg mem_sc_mem; 
 reg mem_reg_write; 
 reg mem_memtoreg; 
 reg mem_alu_zero; 
 reg [31:0] mem_alu_result; 
 reg [31:0] mem_reg_read2; 
 reg [4:0] mem_dest_reg; 
 always@(posedge clk) 
 begin 
  if(rst) 
  begin 
  mem_branch<=1'b0; 
  mem_mem_read<=1'b0; 
  mem_mem_write<=1'b0; 
  mem_ll_mem<=1'b0; 
  mem_sc_mem<=1'b0; 
  mem_reg_write<=1'b0; 
  mem_memtoreg<=1'b0; 
  mem_alu_zero<=1'b0; 
  mem_alu_result<=32'h0000; 
  mem_reg_read2<=32'h0000; 
  mem_dest_reg<=5'b00000; 
  end 
  else 
  begin 
  mem_branch<=branch; 
  mem_mem_read<=mem_read; 
  mem_mem_write<=mem_write; 
  mem_ll_mem<=ll_mem; 
  mem_sc_mem<=sc_mem; 
  mem_reg_write<=reg_write; 
  mem_memtoreg<=memtoreg; 
  mem_alu_zero<=alu_zero; 
  mem_alu_result<=alu_result; 
  mem_reg_read2<=reg_read2; 
  mem_dest_reg<=dest_reg; 
  end 
 end 
 endmodule