module mg_01906 (input reset_i,input mclkout_i,input mdata_i,output data_rdy_o,output reg [15:0] data_o);
reg [23:0] ip_data1; 
 reg [23:0] acc1; 
 reg [23:0] acc2; 
 reg [23:0] acc3; 
 reg [23:0] acc3_d1; 
 reg [23:0] acc3_d2; 
 reg [23:0] diff1; 
 reg [23:0] diff2; 
 reg [23:0] diff3; 
 reg [23:0] diff1_d; 
 reg [23:0] diff2_d; 
 reg [7:0] word_count; 
 reg word_clk; 
 assign data_rdy_o = word_clk; 
 always @(mdata_i) 
 begin 
  if(mdata_i == 0) 
  begin 
  ip_data1 <= 0; 
  end 
  else 
  begin 
  ip_data1 <= 1; 
  end 
 end 
 always @(negedge mclkout_i or posedge reset_i) 
 begin 
  if( reset_i == 1'b1 ) 
  begin 
  acc1 <= 0; 
  acc2 <= 0; 
  acc3 <= 0; 
  end 
  else 
  begin 
  acc1 <= acc1 + ip_data1; 
  acc2 <= acc2 + acc1; 
  acc3 <= acc3 + acc2; 
  end 
 end 
 always@(posedge mclkout_i or posedge reset_i ) 
 begin 
  if(reset_i == 1'b1) 
  begin 
  word_count <= 0; 
  end 
  else 
  begin 
  word_count <= word_count + 1; 
  end 
 end 
 always @(word_count) 
 begin 
  word_clk <= word_count[7]; 
 end 
 always @(posedge word_clk or posedge reset_i) 
 begin 
  if(reset_i == 1'b1) 
  begin 
  acc3_d2 <= 0; 
  diff1_d <= 0; 
  diff2_d <= 0; 
  diff1 <= 0; 
  diff2 <= 0; 
  diff3 <= 0; 
  end 
  else 
  begin 
  diff1 <= acc3 - acc3_d2; 
  diff2 <= diff1 - diff1_d; 
  diff3 <= diff2 - diff2_d; 
  acc3_d2 <= acc3; 
  diff1_d <= diff1; 
  diff2_d <= diff2; 
  end 
 end 
 always @(posedge word_clk) 
 begin 
  data_o[15] <= diff3[23]; 
  data_o[14] <= diff3[22]; 
  data_o[13] <= diff3[21]; 
  data_o[12] <= diff3[20]; 
  data_o[11] <= diff3[19]; 
  data_o[10] <= diff3[18]; 
  data_o[9] <= diff3[17]; 
  data_o[8] <= diff3[16]; 
  data_o[7] <= diff3[15]; 
  data_o[6] <= diff3[14]; 
  data_o[5] <= diff3[13]; 
  data_o[4] <= diff3[12]; 
  data_o[3] <= diff3[11]; 
  data_o[2] <= diff3[10]; 
  data_o[1] <= diff3[9]; 
  data_o[0] <= diff3[8]; 
 end 
 endmodule