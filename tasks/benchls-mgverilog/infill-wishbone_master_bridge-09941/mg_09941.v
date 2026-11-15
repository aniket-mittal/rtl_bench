module mg_09941(input clk,input rst,output reg done_o,input wire d_read_en,input wire d_write_en,input wire [31:0] d_addr,input wire [31:0] d_write_data,output reg [31:0] d_data_out,input wbm_done_pls_i,input [31:0] wbm_dat_i,input wbm_ack_i,output reg [31:0] wbm_dat_o,output reg wbm_we_o,output [3:0] wbm_sel_o,output reg [31:0] wbm_adr_o,output reg wbm_cyc_o,output reg wbm_stb_o);
reg [1:0] state_r; 
  assign wbm_sel_o = 4'b1111; 
  localparam IDLE = 0; 
  localparam WRITE_ACK = 1; 
  localparam READ_ACK = 2; 
  localparam DONE_PLS = 3; 
  reg rd_r, wr_r; 
  [MASKED] 
 endmodule