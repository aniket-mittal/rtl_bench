module mg_06138(input sys_clk,input sys_rst,input dma_en,input [28:0] dma_base,input [6:0] x,input [6:0] y,input [31:0] dma_d1,input [31:0] dma_d2,output ack,output busy,output [31:0] wbm_dat_o,output [31:0] wbm_adr_o,output wbm_cyc_o,output reg wbm_stb_o,input wbm_ack_i);
reg write_y; 
 reg [28:0] vector_start; 
 reg [31:0] dma_d1_r; 
 reg [31:0] dma_d2_r; 
 [MASKED] 
 assign wbm_adr_o = {vector_start, write_y, 2'b00}; 
 assign wbm_dat_o = write_y ? dma_d2_r : dma_d1_r; 
 assign wbm_cyc_o = wbm_stb_o; 
 assign ack = ~wbm_stb_o; 
 assign busy = wbm_stb_o; 
 endmodule