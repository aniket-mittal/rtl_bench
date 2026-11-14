module mg_10596 (clk_i,IF_addr_i,IF_req_i,ID_inst_o,MEM_req_i,MEM_we_i,MEM_addr_i,MEM_data_i,MEM_bwsel_i,WB_data_o,dmem_cyc_o,dmem_stb_o,dmem_waddr_o,dmem_raddr_o,dmem_we_o,dmem_bwsel_o,dmem_ack_i,dmem_data_i,dmem_data_o,imem_cyc_o, imem_stb_o, imem_addr_o, imem_ack_i, imem_inst_i,dmem_rdy_o,imem_rdy_o);
input clk_i; 
  input IF_req_i; 
  input [31:0] IF_addr_i; 
  output [31:0] ID_inst_o; 
  output imem_cyc_o; 
  output imem_stb_o; 
  output [31:0] imem_addr_o; 
  input imem_ack_i; 
  input [31:0] imem_inst_i; 
  input MEM_req_i; 
  input MEM_we_i; 
  input [31:0] MEM_addr_i; 
  input [31:0] MEM_data_i; 
  input [3:0] MEM_bwsel_i; 
  output [31:0] WB_data_o; 
  output dmem_cyc_o; 
  output dmem_stb_o; 
  output [31:0] dmem_waddr_o; 
  output [31:0] dmem_raddr_o; 
  output dmem_we_o; 
  output [3:0] dmem_bwsel_o; 
  input dmem_ack_i; 
  input [31:0] dmem_data_i; 
  output [31:0] dmem_data_o; 
  output dmem_rdy_o; 
  output imem_rdy_o; 
  assign imem_cyc_o = IF_req_i; 
  assign imem_stb_o = IF_req_i; 
  assign imem_addr_o = IF_addr_i; 
  assign ID_inst_o = imem_inst_i; 
  assign dmem_we_o = MEM_we_i; 
  assign dmem_cyc_o = MEM_req_i; 
  assign dmem_stb_o = MEM_req_i; 
  assign dmem_waddr_o = {MEM_addr_i[31:2],2'b00}; 
  assign dmem_raddr_o = {MEM_addr_i[31:2],2'b00}; 
  assign dmem_data_o = MEM_data_i; 
  assign dmem_bwsel_o = MEM_bwsel_i; 
  assign WB_data_o = dmem_data_i; 
  reg dmem_req_reged; 
  reg imem_req_reged; 
  always @(posedge clk_i) 
  begin 
  dmem_req_reged <= dmem_cyc_o & dmem_stb_o; 
  imem_req_reged <= IF_req_i; 
  end 
  assign dmem_rdy_o = dmem_ack_i | ~dmem_req_reged; 
  assign imem_rdy_o = imem_ack_i | ~imem_req_reged; 
 endmodule