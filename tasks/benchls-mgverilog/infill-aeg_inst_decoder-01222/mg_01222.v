module mg_01222 (input [31:0] cae_inst,input [63:0] cae_data,input cae_inst_vld,output inst_val,output [4:0] inst_caep,output inst_aeg_wr,output inst_aeg_rd,output [17:0] inst_aeg_idx,output err_unimpl);
reg c_val, c_aeg_wr, c_aeg_rd, c_unimpl; 
  reg [4:0] c_caep; 
  reg [17:0] c_aeg_idx; 
  [MASKED] 
  assign inst_val = c_val; 
  assign inst_caep = c_caep; 
  assign inst_aeg_wr = c_aeg_wr; 
  assign inst_aeg_rd = c_aeg_rd; 
  assign inst_aeg_idx = c_aeg_idx; 
  assign err_unimpl = c_unimpl; 
 endmodule