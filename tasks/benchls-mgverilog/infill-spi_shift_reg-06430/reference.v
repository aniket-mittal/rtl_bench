module mg_06430 (clk, rst, len, lsb, go,pos_edge, neg_edge, rx_negedge, tx_negedge,tip, last,p_in, p_out, s_clk, s_out);
parameter Tp = 1; 
  input clk; 
  input rst; 
  input [4:0] len; 
  input lsb; 
  input go; 
  input pos_edge; 
  input neg_edge; 
  input rx_negedge; 
  input tx_negedge; 
  output tip; 
  output last; 
  input [17:0] p_in; 
  output [17:0] p_out; 
  input s_clk; 
  output s_out; 
  reg s_out; 
  reg tip; 
  reg [5:0] cnt; 
  wire [17:0] data; 
  wire [5:0] tx_bit_pos; 
  wire [5:0] rx_bit_pos; 
  wire rx_clk; 
  wire tx_clk; 
  assign data = p_in; 
  assign tx_bit_pos = lsb ? {!(|len), len} - cnt : cnt - {{5{1'b0}},1'b1}; 
  assign rx_bit_pos = lsb ? {!(|len), len} - (rx_negedge ? cnt + {{5{1'b0}},1'b1} : cnt) : 
  (rx_negedge ? cnt : cnt - {{5{1'b0}},1'b1}); 
  assign last = !(|cnt); 
  assign rx_clk = (rx_negedge ? neg_edge : pos_edge) && (!last || s_clk); 
  assign tx_clk = (tx_negedge ? neg_edge : pos_edge) && !last; 
  always @(posedge clk or posedge rst) 
  begin 
  if(rst) 
  cnt <= #Tp {6{1'b0}}; 
  else 
  begin 
  if(tip) 
  cnt <= #Tp pos_edge ? (cnt - {{5{1'b0}}, 1'b1}) : cnt; 
  else 
  cnt <= #Tp !(|len) ? {1'b1, {5{1'b0}}} : {1'b0, len}; 
  end 
  end 
  always @(posedge clk or posedge rst) 
  begin 
  if(rst) 
  tip <= #Tp 1'b0; 
  else if(go && ~tip) 
  tip <= #Tp 1'b1; 
  else if(tip && last && pos_edge) 
  tip <= #Tp 1'b0; 
  end 
  always @(posedge clk or posedge rst) 
  begin 
  if (rst) 
  s_out <= #Tp 1'b0; 
  else 
  s_out <= #Tp (tx_clk || !tip) ? data[tx_bit_pos[4:0]] : s_out; 
  end 
 endmodule