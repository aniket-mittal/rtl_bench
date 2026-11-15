module mg_05423(ck_1356meg,pwr_lo, pwr_hi, pwr_oe1, pwr_oe2, pwr_oe3, pwr_oe4,adc_d, adc_clk,ssp_frame, ssp_din, ssp_clk);
input ck_1356meg; 
  output pwr_lo, pwr_hi, pwr_oe1, pwr_oe2, pwr_oe3, pwr_oe4; 
  input [7:0] adc_d; 
  output adc_clk; 
  output ssp_frame, ssp_din, ssp_clk; 
 assign pwr_hi = 1'b0; 
 assign pwr_lo = 1'b0; 
 assign pwr_oe1 = 1'b0; 
 assign pwr_oe2 = 1'b0; 
 assign pwr_oe3 = 1'b0; 
 assign pwr_oe4 = 1'b0; 
 reg ssp_frame; 
 reg [7:0] adc_d_out = 8'd0; 
 reg [2:0] ssp_cnt = 3'd0; 
 assign adc_clk = ck_1356meg; 
 assign ssp_clk = ~ck_1356meg; 
 [MASKED] 
 assign ssp_din = adc_d_out[0]; 
 endmodule