module mg_06996 (input clk,input resetn,output ser_tx,input ser_rx,input [ 3:0] reg_div_we,input [31:0] reg_div_di,output [31:0] reg_div_do,input reg_dat_we,input reg_dat_re,input [31:0] reg_dat_di,output [31:0] reg_dat_do,output reg_dat_wait);
reg [31:0] cfg_divider; 
  reg [3:0] recv_state; 
  reg [31:0] recv_divcnt; 
  reg [7:0] recv_pattern; 
  reg [7:0] recv_buf_data; 
  reg recv_buf_valid; 
  reg [9:0] send_pattern; 
  reg [3:0] send_bitcnt; 
  reg [31:0] send_divcnt; 
  reg send_dummy; 
  assign reg_div_do = cfg_divider; 
  assign reg_dat_wait = reg_dat_we && (send_bitcnt || send_dummy); 
  assign reg_dat_do = recv_buf_valid ? recv_buf_data : ~0; 
  always @(posedge clk) begin 
  if (!resetn) begin 
  cfg_divider <= 1; 
  end else begin 
  if (reg_div_we[0]) cfg_divider[7:0] <= reg_div_di[7:0]; 
  if (reg_div_we[1]) cfg_divider[15:8] <= reg_div_di[15:8]; 
  if (reg_div_we[2]) cfg_divider[23:16] <= reg_div_di[23:16]; 
  if (reg_div_we[3]) cfg_divider[31:24] <= reg_div_di[31:24]; 
  end 
  end 
  [MASKED] 
  assign ser_tx = send_pattern[0]; 
  always @(posedge clk) begin 
  if (reg_div_we) send_dummy <= 1; 
  send_divcnt <= send_divcnt + 1; 
  if (!resetn) begin 
  send_pattern <= ~0; 
  send_bitcnt <= 0; 
  send_divcnt <= 0; 
  send_dummy <= 1; 
  end else begin 
  if (send_dummy && !send_bitcnt) begin 
  send_pattern <= ~0; 
  send_bitcnt <= 15; 
  send_divcnt <= 0; 
  send_dummy <= 0; 
  end else if (reg_dat_we && !send_bitcnt) begin 
  send_pattern <= {1'b1, reg_dat_di[7:0], 1'b0}; 
  send_bitcnt <= 10; 
  send_divcnt <= 0; 
  end else if (send_divcnt > cfg_divider && send_bitcnt) begin 
  send_pattern <= {1'b1, send_pattern[9:1]}; 
  send_bitcnt <= send_bitcnt - 1; 
  send_divcnt <= 0; 
  end 
  end 
  end 
 endmodule