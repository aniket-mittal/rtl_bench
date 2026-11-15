module mg_05986 (input tx_clk_i ,input tx_rstn_i ,input tx_rdy_i ,output tx_dv_o ,output [ 16-1: 0] tx_dat_o ,input rx_clk_i ,input rx_rstn_i ,input rx_dv_i ,input [ 16-1: 0] rx_dat_i ,input stat_clr_i ,output [ 32-1: 0] stat_err_o ,output [ 32-1: 0] stat_dat_o);
wire [32-1: 0] rand_temp ; 
 reg [32-1: 0] rand_work ; 
 reg [32-1: 0] rand_dat ; 
 assign rand_temp = rand_work ^ (32'h84C11DB6 & {32{rand_work[0]}}) ; 
 always @(posedge tx_clk_i) begin 
  if (tx_rstn_i == 1'b0) begin 
  rand_work <= 32'h01010101 ; 
  rand_dat <= 32'h0 ; 
  end 
  else begin 
  rand_work <= {rand_work[0], rand_temp[31:1]}; 
  rand_dat <= rand_work ; 
  end 
 end 
 reg [ 5-1: 0] tx_dv_cnt ; 
 reg [16-1: 0] tx_dat ; 
 always @(posedge tx_clk_i) begin 
  if (tx_rstn_i == 1'b0) begin 
  tx_dv_cnt <= 5'h0 ; 
  tx_dat <= 16'h0 ; 
  end 
  else begin 
  tx_dv_cnt <= tx_dv_cnt + 5'h1 ; 
  if ( (tx_dv_cnt[4:2] == 3'h7) && tx_rdy_i ) 
  tx_dat <= rand_dat[15:0] ; 
  end 
 end 
 assign tx_dv_o = (tx_dv_cnt[4:2] == 3'h7) && tx_rdy_i; 
 assign tx_dat_o = rand_dat[15:0] ; 
 reg [32-1: 0] rx_err_cnt ; 
 reg [32-1: 0] rx_dat_cnt ; 
 reg rx_dv ; 
 reg [16-1: 0] rx_dat ; 
 always @(posedge rx_clk_i) begin 
  if (rx_rstn_i == 1'b0) begin 
  rx_err_cnt <= 32'h0 ; 
  rx_dat_cnt <= 32'h0 ; 
  rx_dv <= 1'b0 ; 
  rx_dat <= 16'h0 ; 
  end 
  else begin 
  rx_dv <= rx_dv_i ; 
  rx_dat <= rx_dat_i ; 
  if ( rx_dv && (rx_dat != tx_dat) && (rx_dat != 16'h0)) 
  rx_err_cnt <= rx_err_cnt + 32'h1 ; 
  else if (stat_clr_i) 
  rx_err_cnt <= 32'h0 ; 
  if ( rx_dv && (rx_dat == tx_dat) && (rx_dat != 16'h0)) 
  rx_dat_cnt <= rx_dat_cnt + 32'h1 ; 
  else if (stat_clr_i) 
  rx_dat_cnt <= 32'h0 ; 
  end 
 end 
 assign stat_err_o = rx_err_cnt ; 
 assign stat_dat_o = rx_dat_cnt ; 
 endmodule