module mg_07802 (wb_rst_i, wb_clk_i, wb_dat_i, wb_dat_o,wb_we_i, wb_sel_i, wb_stb_i, wb_ack_o, wb_cyc_i,port_output);
input wb_rst_i; 
  input wb_clk_i; 
  input wire [31:0] wb_dat_i; 
  output wire [31:0] wb_dat_o; 
  input wb_we_i; 
  input wire [3:0] wb_sel_i; 
  input wb_stb_i; 
  output wb_ack_o; 
  input wb_cyc_i; 
  output wire [31:0] port_output; 
  reg [31:0] internal_reg; 
  [MASKED] 
  assign wb_dat_o = internal_reg; 
  assign port_output = internal_reg; 
  assign wb_ack_o = wb_stb_i; 
 endmodule