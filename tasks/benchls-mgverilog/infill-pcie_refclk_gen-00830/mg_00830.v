module mg_00830 (ref_clk_sel_code,ref_clk_out,pcie_rstn,ep_core_clk_out,rp_rstn);
input [3:0] ref_clk_sel_code; 
 output ref_clk_out; 
 output pcie_rstn; 
 output rp_rstn; 
 input ep_core_clk_out; 
 integer half_period; 
 reg ref_clk_out; 
 reg pcie_rstn; 
 reg rp_rstn; 
 integer core_clk_out_period; 
 integer core_clk_cnt = 0; 
 integer refclk_cnt = 0; 
 always @(ref_clk_sel_code) 
  case (ref_clk_sel_code) 
  4'h0: half_period = 5000; 
  4'h1: half_period = 4000; 
  4'h2: half_period = 3200; 
  4'h3: half_period = 2000; 
  default: half_period = 5000; 
  endcase 
  always 
  #half_period ref_clk_out <= ~ref_clk_out; 
 always @(posedge ref_clk_out) 
  begin 
  if (rp_rstn == 0) 
  refclk_cnt <= 0; 
  else 
  refclk_cnt <= refclk_cnt + 1; 
  if ((refclk_cnt == 200) & (core_clk_cnt > 10)) 
  ; 
  end 
 [MASKED] 
  initial 
  begin 
  pcie_rstn = 1'b1; 
  rp_rstn = 1'b0; 
  ref_clk_out = 1'b0; 
  #1000 
  pcie_rstn = 1'b0; 
  rp_rstn = 1'b1; 
  #1000 
  rp_rstn = 1'b0; 
  #1000 
  rp_rstn = 1'b1; 
  #1000 
  rp_rstn = 1'b0; 
  #200000 pcie_rstn = 1'b1; 
  #100000 rp_rstn = 1'b1; 
  end 
 endmodule