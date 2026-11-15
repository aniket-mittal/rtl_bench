module mg_01310 (ctrl,td_mode);
output [ 3: 0] td_mode; 
  input [ 8: 0] ctrl; 
  wire [ 2: 0] ctrl_bits_for_mux; 
  reg [ 3: 0] td_mode; 
  assign ctrl_bits_for_mux = ctrl[7 : 5]; 
  [MASKED] 
 endmodule