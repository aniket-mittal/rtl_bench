module mg_01767 (datain, dataout, oe);
input datain; 
  input oe; 
  output dataout; 
  reg tmp_tridata; 
  always @(datain or oe) 
  begin 
  if (oe == 0) 
  begin 
  tmp_tridata = 1'bz; 
  end 
  else 
  begin 
  tmp_tridata = datain; 
  end 
  end 
  assign dataout = tmp_tridata; 
 endmodule