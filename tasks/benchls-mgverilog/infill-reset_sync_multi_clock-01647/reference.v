module mg_01647 (etx_reset, erx_reset, sys_reset,etx90_reset,erx_ioreset,reset, sys_clk, tx_lclk_div4, rx_lclk_div4,tx_lclk90,rx_lclk);
input reset; 
  input sys_clk; 
  input tx_lclk_div4; 
  input rx_lclk_div4; 
  input tx_lclk90; 
  input rx_lclk; 
  output etx_reset; 
  output erx_reset; 
  output sys_reset; 
  output etx90_reset; 
  output erx_ioreset; 
  reg erx_ioresetb; 
  reg erx_resetb; 
  reg etx_resetb; 
  reg sys_resetb; 
  reg etx90_resetb; 
  always @ (posedge rx_lclk_div4) 
  erx_resetb <= reset; 
  always @ (posedge tx_lclk_div4) 
  etx_resetb <= reset; 
  always @ (posedge sys_clk) 
  sys_resetb <= reset; 
  always @ (posedge tx_lclk90) 
  etx90_resetb <= reset; 
  always @ (posedge rx_lclk) 
  erx_ioresetb <= reset; 
  assign erx_ioreset =erx_ioresetb; 
  assign etx_reset =etx_resetb; 
  assign erx_reset =erx_resetb; 
  assign sys_reset =sys_resetb; 
  assign etx90_reset =etx90_resetb; 
 endmodule