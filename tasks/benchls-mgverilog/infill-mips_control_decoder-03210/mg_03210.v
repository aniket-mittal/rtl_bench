module mg_03210( input [5:0] opcode,input branch_eq,output reg [1:0] if_pc_source,output id_rt_is_source,output ex_imm_command,output reg ex_alu_src_b,output reg ex_dst_reg_sel,output reg [1:0] ex_alu_op,output reg mem_read,output reg mem_write,output reg wb_mem_to_reg,output reg wb_reg_write );
localparam LW = 6'b100011, 
  SW = 6'b101011, 
  BEQ = 6'b000100, 
  RTYPE = 6'b0, 
  J = 6'd2, 
  JAL = 6'd3, 
  ADDI = 6'b001000, 
  ANDI = 6'b001100, 
  ORI = 6'b001101, 
  XORI = 6'b001110, 
  SLTI = 6'b001010; 
  reg memory_op; 
  reg r_type_op; 
  reg immediate_op; 
  reg branch_op; 
  reg jump_op; 
  assign ex_imm_command = immediate_op; 
  assign id_rt_is_source = (r_type_op | branch_op | opcode == SW); 
  [MASKED] 
 endmodule