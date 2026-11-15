module mg_09457 (input wire clk,input wire reset,input wire valid_wb_pipe_reg_i,input wire reg_wr_wb_pipe_reg_i,input wire mem_to_reg_wb_pipe_reg_i,input wire[4:0] rd_wb_pipe_reg_i,input wire[31:0] res_alu_wb_pipe_reg_i,input wire[31:0] read_data_wb_pipe_reg_i,input wire use_link_reg_wb_pipe_reg_i,input wire[31:0] next_seq_pc_wb_pipe_reg_i,output wire instr_retired_wb_pipe_reg_o,output wire reg_wr_wb_pipe_reg_o,output wire mem_to_reg_wb_pipe_reg_o,output wire[4:0] rd_wb_pipe_reg_o,output wire[31:0] res_alu_wb_pipe_reg_o,output wire[31:0] read_data_wb_pipe_reg_o,output wire use_link_reg_wb_pipe_reg_o,output wire[31:0] next_seq_pc_wb_pipe_reg_o);
reg reg_wr_wb_pipe_reg; 
  reg mem_to_reg_wb_pipe_reg; 
  reg instr_retired_wb_pipe_reg; 
  reg[4:0] rd_wb_pipe_reg; 
  reg[31:0] res_alu_wb_pipe_reg; 
  reg[31:0] read_data_wb_pipe_reg; 
  reg use_link_reg_wb_pipe_reg; 
  reg[31:0] next_seq_pc_wb_pipe_reg; 
  assign reg_wr_wb_pipe_reg_o = reg_wr_wb_pipe_reg; 
  assign mem_to_reg_wb_pipe_reg_o = mem_to_reg_wb_pipe_reg; 
  assign instr_retired_wb_pipe_reg_o = instr_retired_wb_pipe_reg; 
  assign rd_wb_pipe_reg_o = rd_wb_pipe_reg; 
  assign res_alu_wb_pipe_reg_o = res_alu_wb_pipe_reg; 
  assign read_data_wb_pipe_reg_o = read_data_wb_pipe_reg; 
  assign next_seq_pc_wb_pipe_reg_o = next_seq_pc_wb_pipe_reg; 
  assign use_link_reg_wb_pipe_reg_o = use_link_reg_wb_pipe_reg; 
  [MASKED] 
 endmodule