module mg_09954(input clk,input rst,input [31:0] ex_exu_result,input [31:0] ex_mem_store_data,input ex_mem_write,input ex_mem_read,input ex_mem_byte,input ex_mem_halfword,input ex_mem_sign_ext,input ex_mem_exu_mem_select,input [4:0] ex_gpr_wa,input ex_gpr_we,input ex_kernel_mode,input [31:0] ex_pc_current,input ex_mem_can_exc,input ex_flush,input ex_stall,input mem_stall,output reg [31:0] mem_exu_result,output reg [31:0] mem_mem_store_data,output reg mem_mem_write,output reg mem_mem_read,output reg mem_mem_byte,output reg mem_mem_halfword,output reg mem_mem_sign_ext,output reg mem_mem_exu_mem_select,output reg [4:0] mem_gpr_wa,output reg mem_gpr_we,output reg mem_kernel_mode,output reg [31:0] mem_pc_current,output reg mem_mem_can_exc);
always @(posedge clk) begin 
  mem_exu_result <= (rst) ? 32'b0 : ((mem_stall) ? mem_exu_result : ex_exu_result); 
  mem_mem_store_data <= (rst) ? 32'b0 : ((mem_stall) ? mem_mem_store_data : ex_mem_store_data); 
  mem_mem_write <= (rst) ? 1'b0 : ((mem_stall) ? mem_mem_write : ((ex_stall | ex_flush) ? 1'b0 : ex_mem_write)); 
  mem_mem_read <= (rst) ? 1'b0 : ((mem_stall) ? mem_mem_read : ((ex_stall | ex_flush) ? 1'b0 : ex_mem_read)); 
  mem_mem_byte <= (rst) ? 1'b0 : ((mem_stall) ? mem_mem_byte : ex_mem_byte); 
  mem_mem_halfword <= (rst) ? 1'b0 : ((mem_stall) ? mem_mem_halfword : ex_mem_halfword); 
  mem_mem_sign_ext <= (rst) ? 1'b0 : ((mem_stall) ? mem_mem_sign_ext : ex_mem_sign_ext); 
  mem_mem_exu_mem_select <= (rst) ? 1'b0 : ((mem_stall) ? mem_mem_exu_mem_select : ex_mem_exu_mem_select); 
  mem_gpr_wa <= (rst) ? 5'b0 : ((mem_stall) ? mem_gpr_wa : ((ex_stall | ex_flush) ? 5'b0 : ex_gpr_wa)); 
  mem_gpr_we <= (rst) ? 1'b0 : ((mem_stall) ? mem_gpr_we : ((ex_stall | ex_flush) ? 1'b0 : ex_gpr_we)); 
  mem_kernel_mode <= (rst) ? 1'b0 : ((mem_stall) ? mem_kernel_mode : ((ex_stall | ex_flush) ? 1'b0 : ex_kernel_mode)); 
  mem_pc_current <= (rst) ? 32'b0 : ((mem_stall) ? mem_pc_current : ex_pc_current); 
  mem_mem_can_exc <= (rst) ? 1'b0 : ((mem_stall) ? mem_mem_can_exc : ((ex_stall | ex_flush) ? 1'b0 : ex_mem_can_exc)); 
  end 
 endmodule