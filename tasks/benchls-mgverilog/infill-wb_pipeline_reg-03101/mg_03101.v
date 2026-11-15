module mg_03101 (input wire clk,input wire reset,input wire valid_wb_pipe_reg_i,input wire rf_en_wb_pipe_reg_i,input wire[1:0] wb_sel_wb_pipe_reg_i,input wire[4:0] rd_wb_pipe_reg_i,input wire[31:0] alu_res_wb_pipe_reg_i,input wire[31:0] read_data_wb_pipe_reg_i,input wire[31:0] next_seq_pc_wb_pipe_reg_i,output wire instr_retired_wb_pipe_reg_o,output wire rf_en_wb_pipe_reg_o,output wire[1:0] wb_sel_wb_pipe_reg_o,output wire[4:0] rd_wb_pipe_reg_o,output wire[31:0] alu_res_wb_pipe_reg_o,output wire[31:0] read_data_wb_pipe_reg_o,output wire[31:0] next_seq_pc_wb_pipe_reg_o);
reg rf_en_wb_pipe_reg; 
  reg[1:0] wb_sel_wb_pipe_reg; 
  reg instr_retired_wb_pipe_reg; 
  reg[4:0] rd_wb_pipe_reg; 
  reg[31:0] alu_res_wb_pipe_reg; 
  reg[31:0] read_data_wb_pipe_reg; 
  reg[31:0] next_seq_pc_wb_pipe_reg; 
  assign rf_en_wb_pipe_reg_o = rf_en_wb_pipe_reg; 
  assign wb_sel_wb_pipe_reg_o = wb_sel_wb_pipe_reg; 
  assign instr_retired_wb_pipe_reg_o = instr_retired_wb_pipe_reg; 
  assign rd_wb_pipe_reg_o = rd_wb_pipe_reg; 
  assign alu_res_wb_pipe_reg_o = alu_res_wb_pipe_reg; 
  assign read_data_wb_pipe_reg_o = read_data_wb_pipe_reg; 
  assign next_seq_pc_wb_pipe_reg_o = next_seq_pc_wb_pipe_reg; 
  [MASKED] 
 endmodule