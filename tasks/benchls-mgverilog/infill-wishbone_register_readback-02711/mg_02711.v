module mg_02711 (input wb_clk_i,input wb_rst_i,input wb_stb_i,input [15:0] wb_adr_i,output reg [31:0] wb_dat_o,output reg wb_ack_o,input [31:0] word00,input [31:0] word01,input [31:0] word02,input [31:0] word03,input [31:0] word04,input [31:0] word05,input [31:0] word06,input [31:0] word07,input [31:0] word08,input [31:0] word09,input [31:0] word10,input [31:0] word11,input [31:0] word12,input [31:0] word13,input [31:0] word14,input [31:0] word15);
always @(posedge wb_clk_i) 
  if(wb_rst_i) 
  wb_ack_o <= 0; 
  else 
  wb_ack_o <= wb_stb_i & ~wb_ack_o; 
  [MASKED] 
 endmodule