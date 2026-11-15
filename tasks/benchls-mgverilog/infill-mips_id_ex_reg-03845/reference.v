module mg_03845(clk,rst,wb_reg_write,wb_memtoreg,mem_memread,mem_memwrite,mem_ll_mem,mem_sc_mem,regdst,aluop,alusrc,regread1,regread2,sign_extend,reg_rs,reg_rt,reg_rd,ex_wb_reg_write,ex_wb_memtoreg,ex_mem_memread,ex_mem_memwrite,ex_mem_ll_mem,ex_mem_sc_mem,ex_regdst,ex_aluop,ex_alusrc,ex_regread1,ex_regread2,ex_sign_extend,ex_reg_rs,ex_reg_rt,ex_reg_rd);
input clk; 
 input rst; 
 input wb_reg_write; 
 input wb_memtoreg; 
 input mem_memread; 
 input mem_memwrite; 
 input mem_ll_mem; 
 input mem_sc_mem; 
 input regdst; 
 input [1:0] aluop; 
 input alusrc; 
 input [31:0] regread1; 
 input [31:0] regread2; 
 input [31:0] sign_extend; 
 input [4:0] reg_rs; 
 input [4:0] reg_rt; 
 input [4:0] reg_rd; 
 output ex_wb_reg_write; 
 output ex_wb_memtoreg; 
 output ex_mem_memread; 
 output ex_mem_memwrite; 
 output ex_mem_ll_mem; 
 output ex_mem_sc_mem; 
 output ex_regdst; 
 output [1:0] ex_aluop; 
 output ex_alusrc; 
 output [31:0] ex_regread1; 
 output [31:0] ex_regread2; 
 output [31:0] ex_sign_extend; 
 output [4:0] ex_reg_rs; 
 output [4:0] ex_reg_rt; 
 output [4:0] ex_reg_rd; 
 reg ex_wb_reg_write; 
 reg ex_wb_memtoreg; 
 reg ex_mem_memread; 
 reg ex_mem_memwrite; 
 reg ex_mem_ll_mem; 
 reg ex_mem_sc_mem; 
 reg ex_regdst; 
 reg [1:0] ex_aluop; 
 reg ex_alusrc; 
 reg [31:0] ex_regread1; 
 reg [31:0] ex_regread2; 
 reg [31:0] ex_sign_extend; 
 reg [4:0] ex_reg_rs; 
 reg [4:0] ex_reg_rt; 
 reg [4:0] ex_reg_rd; 
 always@(posedge clk) 
 begin 
  if(rst) 
  begin 
  ex_wb_reg_write<=1'b0; 
  ex_wb_memtoreg<=1'b0; 
  ex_mem_memread<=1'b0; 
  ex_mem_memwrite<=1'b0; 
  ex_mem_ll_mem<=1'b0; 
  ex_mem_sc_mem<=1'b0; 
  ex_regdst<=1'b0; 
  ex_aluop<=2'b00; 
  ex_alusrc<=1'b0; 
  ex_regread1<=32'h0000; 
  ex_regread2<=32'h0000; 
  ex_sign_extend<=32'h0000; 
  ex_reg_rs<=5'b00000; 
  ex_reg_rt<=5'b00000; 
  ex_reg_rd<=5'b00000; 
  end 
 else 
  begin 
  ex_wb_reg_write<=wb_reg_write; 
  ex_wb_memtoreg<=wb_memtoreg; 
  ex_mem_memread<=mem_memread; 
  ex_mem_memwrite<=mem_memwrite; 
  ex_mem_ll_mem<=mem_ll_mem; 
  ex_mem_sc_mem<=mem_sc_mem; 
  ex_regdst<=regdst; 
  ex_aluop<=aluop; 
  ex_alusrc<=alusrc; 
  ex_regread1<=regread1; 
  ex_regread2<=regread2; 
  ex_sign_extend<=sign_extend; 
  ex_reg_rs<=reg_rs; 
  ex_reg_rt<=reg_rt; 
  ex_reg_rd<=reg_rd; 
  end 
 end 
 endmodule