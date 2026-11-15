module mg_01012 (clk,en_in,pre_first,process,inc_dec,cycle_div,decr_on_pulse,period_cur,period_new,encoded_period);
parameter IGNORE_EN=1; 
  input clk; 
  input en_in; 
  input process; 
  input pre_first; 
  input inc_dec; 
  input [11:0] cycle_div; 
  input [4:0] decr_on_pulse; 
  input [8:0] period_cur; 
  output [8:0] period_new; 
  output [4:0] encoded_period; 
  wire en=(IGNORE_EN)?1'b1:en_in; 
  reg [11:0] prescaler; 
  reg inc_period; 
  wire [8:0] period_new; 
  wire [6:0] pri_enc; 
  reg [4:0] pre_enc_per; 
  reg inc_dec_d; 
  reg [4:0] encoded_period; 
  wire [5:0] decreased_pre_enc_per; 
  reg process_d; 
  always @ (posedge clk) if (pre_first) begin 
  prescaler= (!en || (prescaler==0))?cycle_div:(prescaler-1); 
  inc_period= en && (prescaler==0); 
  end 
  assign period_new[8:0]=(inc_dec || !en)?{9{~en}}: 
  ((!inc_period || (period_cur[8:6]==3'h7))? period_cur[8:0]:(period_cur[8:0]+1)); 
  assign pri_enc={period_cur[8], 
  (period_cur[8:7]==2'h1), 
  (period_cur[8:6]==3'h1), 
  (period_cur[8:5]==4'h1), 
  (period_cur[8:4]==5'h1), 
  (period_cur[8:3]==6'h1), 
  (period_cur[8:3]==6'h0)}; 
  always @ (posedge clk) if (process) begin 
  pre_enc_per[4:0] <= {|pri_enc[6:3], 
  |pri_enc[6:5] | |pri_enc[2:1], 
  pri_enc[6] | pri_enc[4] | pri_enc[2] | (pri_enc[0] & period_cur[2]), 
  (pri_enc[6] & period_cur[7]) | 
  (pri_enc[5] & period_cur[6]) | 
  (pri_enc[4] & period_cur[5]) | 
  (pri_enc[3] & period_cur[4]) | 
  (pri_enc[2] & period_cur[3]) | 
  (pri_enc[1] & period_cur[2]) | 
  (pri_enc[0] & period_cur[1]), 
  (pri_enc[6] & period_cur[6]) | 
  (pri_enc[5] & period_cur[5]) | 
  (pri_enc[4] & period_cur[4]) | 
  (pri_enc[3] & period_cur[3]) | 
  (pri_enc[2] & period_cur[2]) | 
  (pri_enc[1] & period_cur[1]) | 
  (pri_enc[0] & period_cur[0]) }; 
  inc_dec_d <= inc_dec; 
  end 
  assign decreased_pre_enc_per[5:0] = {1'b0,pre_enc_per[4:0]}-{1'b0,decr_on_pulse}; 
  always @ (posedge clk) process_d <= process; 
  always @ (posedge clk) if (process_d) begin 
  encoded_period[4:0] <= inc_dec_d? (decreased_pre_enc_per[5]? 5'h0:decreased_pre_enc_per[4:0]):(pre_enc_per[4:0]); 
  end 
 endmodule