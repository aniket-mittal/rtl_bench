module mg_10593(CLK,RST,CLKOUT,CLKOUTn);
input CLK; 
  input RST; 
  output CLKOUT; 
  output CLKOUTn; 
  reg CLKOUT = 1'b1; 
  parameter cntEndVal = 19'h493E0; 
  reg [18:0] clkCount = 19'h00000; 
  assign CLKOUTn = ~CLKOUT; 
  [MASKED] 
 endmodule