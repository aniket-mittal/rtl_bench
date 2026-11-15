module mg_10645(input PWRDN, output reg CLKOUT_HARDIP, output reg CLKOUT_FABRIC);
parameter PWRDN_EN = 0; 
  parameter AUTO_PWRDN = 0; 
  parameter HARDIP_DIV = 1; 
  parameter FABRIC_DIV = 1; 
  parameter OSC_FREQ = "25k"; 
  initial CLKOUT_HARDIP = 0; 
  initial CLKOUT_FABRIC = 0; 
  [MASKED] 
 endmodule