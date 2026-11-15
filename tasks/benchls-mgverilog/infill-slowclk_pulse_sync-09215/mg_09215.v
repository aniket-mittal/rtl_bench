module mg_09215(input CLK,input SLOWCLK,input RESET,output EN_OUT);
reg internal_rst; 
  reg cur; 
  [MASKED] 
  assign EN_OUT = internal_rst; 
 endmodule