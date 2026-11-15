module mg_07030(clk,rst,tx_en,tx_data_ready,tx_data,tx_data_loaded,tx_complete,rb0,rb1,rb2,rb3,rb4,rb5,rb6,rb7,rb8,rb9,rb10,rb11,rb12,rb13,rb14);
parameter N_READBACKS = 15; 
 input clk; 
 input rst; 
 input tx_en; 
 input tx_data_loaded; 
 output reg tx_data_ready; 
 output [6:0] tx_data; 
 output reg tx_complete; 
 input [6:0] rb0; 
 input [6:0] rb1; 
 input [6:0] rb2; 
 input [6:0] rb3; 
 input [6:0] rb4; 
 input [6:0] rb5; 
 input [6:0] rb6; 
 input [6:0] rb7; 
 input [6:0] rb8; 
 input [6:0] rb9; 
 input [6:0] rb10; 
 input [6:0] rb11; 
 input [6:0] rb12; 
 input [6:0] rb13; 
 input [6:0] rb14; 
 reg [6:0] readbacks_a [0:N_READBACKS-1]; 
 reg [6:0] readbacks_b [0:N_READBACKS-1]; 
 integer i; 
 always @(posedge clk) begin 
  if (rst) begin 
  for (i=0; i < N_READBACKS; i=i+1) begin 
  readbacks_a[i] <= 0; 
  readbacks_b[i] <= 0; 
  end 
  end else begin 
  readbacks_a[0] <= rb0; 
  readbacks_a[1] <= rb1; 
  readbacks_a[2] <= rb2; 
  readbacks_a[3] <= rb3; 
  readbacks_a[4] <= rb4; 
  readbacks_a[5] <= rb5; 
  readbacks_a[6] <= rb6; 
  readbacks_a[7] <= rb7; 
  readbacks_a[8] <= rb8; 
  readbacks_a[9] <= rb9; 
  readbacks_a[10] <= rb10; 
  readbacks_a[11] <= rb11; 
  readbacks_a[12] <= rb12; 
  readbacks_a[13] <= rb13; 
  readbacks_a[14] <= rb14; 
  for (i=0; i < N_READBACKS; i=i+1) begin 
  readbacks_b[i] <= readbacks_a[i]; 
  end 
  end 
 end 
 reg [4:0] tx_cnt; 
 reg tx_data_loaded1; 
 reg tx_data_loaded2; 
 always @(posedge clk) begin 
  if (rst) begin 
  tx_cnt <= 0; 
  tx_data_ready <= 0; 
  tx_data_loaded1 <= 0; 
  tx_data_loaded2 <= 0; 
  tx_complete <= 0; 
  end else begin 
  tx_data_loaded1 <= tx_data_loaded; 
  tx_data_loaded2 <= tx_data_loaded1; 
  if (!tx_complete) begin 
  if (tx_en) begin 
  if (!tx_data_ready && !tx_data_loaded2) begin 
  if (tx_cnt == N_READBACKS) begin 
  tx_complete <= 1; 
  end else begin 
  tx_data_ready <= 1; 
  end 
  end else begin 
  if (tx_data_ready && tx_data_loaded2) begin 
  tx_data_ready <= 0; 
  tx_cnt <= tx_cnt + 1; 
  end 
  end 
  end 
  end else begin 
  if (!tx_en) begin 
  tx_cnt <= 0; 
  tx_data_ready <= 0; 
  tx_data_loaded1 <= 0; 
  tx_data_loaded2 <= 0; 
  tx_complete <= 0; 
  end 
  end 
  end 
 end 
 assign tx_data = readbacks_b[tx_cnt]; 
 endmodule