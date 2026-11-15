module mg_07546(refclk_i, fsclk_i, rst_i, result_o);
input refclk_i; 
  input fsclk_i; 
  input rst_i; 
  output [3:0] result_o; 
  reg [9:0] cnt; 
  reg [9:0] l_cnt; 
  reg [2:0] s_fsclk; 
  always @ (posedge rst_i or negedge refclk_i) begin 
  if(rst_i) begin 
  s_fsclk[0] <= 1'b0; 
  end 
  else begin 
  s_fsclk[2:0] <= {s_fsclk[1:0], fsclk_i}; 
  end 
  end 
  wire edgedet = (s_fsclk[1] ^ s_fsclk[2]) & ~s_fsclk[1]; 
  always @ (posedge refclk_i or posedge rst_i) begin 
  if(rst_i) begin 
  l_cnt[9:0] <= 10'b0; 
  cnt[9:0] <= 10'b0; 
  end 
  else begin 
  if(edgedet) begin 
  l_cnt[9:0] <= cnt[9:0]; 
  cnt[9:0] <= 10'b0; 
  end 
  else begin 
  cnt[9:0] <= cnt[9:0] + 1'b1; 
  end 
  end 
  end 
  assign result_o = (l_cnt[9:0] >= 10'd662) ? 4'b0000 : 
  (l_cnt[9:0] >= 10'd534 && l_cnt[9:0] < 662) ? 4'b0001 : 
  (l_cnt[9:0] >= 10'd448 && l_cnt[9:0] < 534) ? 4'b0010 : 
  (l_cnt[9:0] >= 10'd331 && l_cnt[9:0] < 448) ? 4'b0100 : 
  (l_cnt[9:0] >= 10'd267 && l_cnt[9:0] < 331) ? 4'b0101 : 
  (l_cnt[9:0] >= 10'd224 && l_cnt[9:0] < 267) ? 4'b0110 : 
  (l_cnt[9:0] >= 10'd165 && l_cnt[9:0] < 224) ? 4'b1000 : 
  (l_cnt[9:0] >= 10'd133 && l_cnt[9:0] < 165) ? 4'b1001 : 
  (l_cnt[9:0] >= 10'd112 && l_cnt[9:0] < 133) ? 4'b1010 : 
  (l_cnt[9:0] >= 10'd82 && l_cnt[9:0] < 112) ? 4'b1100 : 
  (l_cnt[9:0] >= 10'd66 && l_cnt[9:0] < 82) ? 4'b1101 : 
  (l_cnt[9:0] >= 10'd1 && l_cnt[9:0] < 66) ? 4'b1110 : 
  4'b1111; 
 endmodule