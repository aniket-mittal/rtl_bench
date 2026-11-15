module mg_01767 (datain, dataout, oe);
input datain; 
  input oe; 
  output dataout; 
  reg tmp_tridata; 
  [MASKED] 
  assign dataout = tmp_tridata; 
 endmodule