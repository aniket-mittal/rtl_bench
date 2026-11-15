module mg_09770 (clk,s444_vs,s444_hs,s444_de,s444_data,s422_vs,s422_hs,s422_de,s422_data);
input clk; 
  input s444_vs; 
  input s444_hs; 
  input s444_de; 
  input [23:0] s444_data; 
  output s422_vs; 
  output s422_hs; 
  output s422_de; 
  output [15:0] s422_data; 
  reg s444_vs_d = 'd0; 
  reg s444_hs_d = 'd0; 
  reg s444_de_d = 'd0; 
  reg [23:0] s444_data_d = 'd0; 
  reg s444_vs_2d = 'd0; 
  reg s444_hs_2d = 'd0; 
  reg s444_de_2d = 'd0; 
  reg [23:0] s444_data_2d = 'd0; 
  reg s444_vs_3d = 'd0; 
  reg s444_hs_3d = 'd0; 
  reg s444_de_3d = 'd0; 
  reg [23:0] s444_data_3d = 'd0; 
  reg [ 7:0] Cr = 'd0; 
  reg [ 7:0] Cb = 'd0; 
  reg Cr_Cb_sel = 'd0; 
  reg s422_vs = 'd0; 
  reg s422_hs = 'd0; 
  reg s422_de = 'd0; 
  reg [15:0] s422_data = 'd0; 
  wire [23:0] s444_data_s; 
  wire [ 9:0] Cr_s; 
  wire [ 9:0] Cb_s; 
  assign s444_data_s = (s444_de == 1'b1) ? s444_data : 24'd0; 
  always @(posedge clk) begin 
  s444_vs_d <= s444_vs; 
  s444_hs_d <= s444_hs; 
  s444_de_d <= s444_de; 
  s444_data_d <= s444_data_s; 
  s444_vs_2d <= s444_vs_d; 
  s444_hs_2d <= s444_hs_d; 
  s444_de_2d <= s444_de_d; 
  s444_data_2d <= s444_data_d; 
  s444_vs_3d <= s444_vs_2d; 
  s444_hs_3d <= s444_hs_2d; 
  s444_de_3d <= s444_de_2d; 
  s444_data_3d <= s444_data_2d; 
  end 
  assign Cr_s = {2'd0, s444_data_d[23:16]} + {2'd0, s444_data_3d[23:16]} + 
  {1'd0, s444_data_2d[23:16], 1'd0}; 
  assign Cb_s = {2'd0, s444_data_d[7:0]} + {2'd0, s444_data_3d[7:0]} + 
  {1'd0, s444_data_2d[7:0], 1'd0}; 
  always @(posedge clk) begin 
  Cr <= Cr_s[9:2]; 
  Cb <= Cb_s[9:2]; 
  if (s444_de_3d == 1'b1) begin 
  Cr_Cb_sel <= ~Cr_Cb_sel; 
  end else begin 
  Cr_Cb_sel <= 'd0; 
  end 
  end 
  always @(posedge clk) begin 
  s422_vs <= s444_vs_3d; 
  s422_hs <= s444_hs_3d; 
  s422_de <= s444_de_3d; 
  if (s444_de_3d == 1'b0) begin 
  s422_data <= 'd0; 
  end else if (Cr_Cb_sel == 1'b1) begin 
  s422_data <= {Cr, s444_data_3d[15:8]}; 
  end else begin 
  s422_data <= {Cb, s444_data_3d[15:8]}; 
  end 
  end 
 endmodule