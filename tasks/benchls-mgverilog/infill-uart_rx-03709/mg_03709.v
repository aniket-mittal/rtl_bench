module mg_03709(clk,rst_n,bps_start,clk_bps,RS232_rx,rx_data,rx_int,data_out);
input clk; 
  input rst_n; 
  input RS232_rx; 
  input clk_bps; 
  output bps_start; 
  output [7:0] rx_data; 
  output rx_int; 
  output reg [7:0]data_out; 
  reg RS232_rx0,RS232_rx1,RS232_rx2,RS232_rx3; 
  wire neg_RS232_rx; 
  always @(posedge clk or negedge rst_n) begin 
  if(!rst_n) begin 
  RS232_rx0 <= 1'b0; 
  RS232_rx1 <= 1'b0; 
  RS232_rx2 <= 1'b0; 
  RS232_rx3 <= 1'b0; 
  end 
  else begin 
  RS232_rx0 <= RS232_rx; 
  RS232_rx1 <= RS232_rx0; 
  RS232_rx2 <= RS232_rx1; 
  RS232_rx3 <= RS232_rx2; 
  end 
  end 
  assign neg_RS232_rx = RS232_rx3 & RS232_rx2 & ~RS232_rx1 & ~RS232_rx0; 
  reg bps_start_r; 
  reg [3:0] num; 
  reg rx_int; 
  always @(posedge clk or negedge rst_n) 
  if(!rst_n) begin 
  bps_start_r <=1'bz; 
  rx_int <= 1'b0; 
  end 
  else if(neg_RS232_rx) begin 
  bps_start_r <= 1'b1; 
  rx_int <= 1'b1; 
  end 
  else if(num==4'd12) begin 
  bps_start_r <=1'b0; 
  rx_int <= 1'b0; 
  end 
  assign bps_start = bps_start_r; 
  reg [7:0] rx_data_r; 
  reg [7:0] rx_temp_data; 
  [MASKED] 
  assign rx_data = rx_data_r; 
 endmodule