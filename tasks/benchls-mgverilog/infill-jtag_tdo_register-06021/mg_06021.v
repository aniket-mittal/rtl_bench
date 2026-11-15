module mg_06021 (input CLK,input RESET_N,input CLKEN,input TDI,output TDO,input DATA_IN,input CAPTURE_DR);
reg tdoInt; 
  [MASKED] 
  assign TDO = tdoInt; 
 endmodule