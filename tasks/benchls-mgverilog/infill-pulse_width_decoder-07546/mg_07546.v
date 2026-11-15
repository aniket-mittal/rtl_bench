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
  [MASKED] 
 endmodule