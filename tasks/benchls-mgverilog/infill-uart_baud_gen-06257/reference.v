module mg_06257(clk, rst_n, rx_enable, tx_enable, buad_clk_rx, buad_clk_tx);
input clk; 
 input rst_n; 
 input rx_enable; 
 input tx_enable; 
 output buad_clk_rx; 
 output buad_clk_tx; 
 parameter bps9600 = 5208, 
  bps19200 = 2603, 
  bps38400 = 1301, 
  bps57600 = 867, 
  bps115200 = 434, 
  bps256000 = 195; 
 parameter bps9600_2 = 2604, 
  bps19200_2 = 1301, 
  bps38400_2 = 650, 
  bps57600_2 = 433, 
  bps115200_2 = 217, 
  bps256000_2 = 97; 
 reg[12:0] bps_para; 
 reg[12:0] bps_para_2; 
 reg[2:0] uart_ctrl; 
 always @ (posedge clk or negedge rst_n) begin 
  if(!rst_n) 
  begin 
  uart_ctrl <= 3'd4; 
  end 
  else 
  begin 
  case (uart_ctrl) 
  3'd0: begin 
  bps_para <= bps9600; 
  bps_para_2 <= bps9600_2; 
  end 
  3'd1: begin 
  bps_para <= bps19200; 
  bps_para_2 <= bps19200_2; 
  end 
  3'd2: begin 
  bps_para <= bps38400; 
  bps_para_2 <= bps38400_2; 
  end 
  3'd3: begin 
  bps_para <= bps57600; 
  bps_para_2 <= bps57600_2; 
  end 
  3'd4: begin 
  bps_para <= bps115200; 
  bps_para_2 <= bps115200_2; 
  end 
  3'd5: begin 
  bps_para <= bps256000; 
  bps_para_2 <= bps256000_2; 
  end 
  default:uart_ctrl <= 3'd0; 
  endcase 
  end 
 end 
 reg[12:0] cnt_rx; 
 reg buad_clk_rx_reg; 
 always @ (posedge clk or negedge rst_n) 
 begin 
  if (!rst_n) 
  cnt_rx <= 13'd0; 
  else if (cnt_rx < bps_para && rx_enable) 
  cnt_rx <= cnt_rx + 13'd1; 
  else 
  cnt_rx <= 13'd0; 
 end 
 always @ (posedge clk or negedge rst_n) 
 begin 
  if (!rst_n) 
  buad_clk_rx_reg <= 1'b0; 
  else if (cnt_rx < bps_para_2 && rx_enable && cnt_rx > 13'd10) 
  buad_clk_rx_reg <= 1'b1; 
  else 
  buad_clk_rx_reg <= 1'b0; 
 end 
 assign buad_clk_rx = buad_clk_rx_reg; 
 reg[12:0] cnt_tx; 
 reg buad_clk_tx_reg; 
 always @ (posedge clk or negedge rst_n) 
 begin 
  if (!rst_n) 
  cnt_tx <= 13'd0; 
  else if (cnt_tx < bps_para && tx_enable) 
  cnt_tx <= cnt_tx + 13'd1; 
  else 
  cnt_tx <= 13'd0; 
 end 
 always @ (posedge clk or negedge rst_n) 
 begin 
  if (!rst_n) 
  buad_clk_tx_reg <= 1'b0; 
  else if (cnt_tx < bps_para_2 && tx_enable && cnt_tx > 13'd10) 
  buad_clk_tx_reg <= 1'b1; 
  else 
  buad_clk_tx_reg <= 1'b0; 
 end 
 assign buad_clk_tx = buad_clk_tx_reg; 
 endmodule