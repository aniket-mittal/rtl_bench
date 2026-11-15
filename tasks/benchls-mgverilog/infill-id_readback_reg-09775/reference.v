module mg_09775 (address,clock,reset_n,readdata);
output [ 31: 0] readdata; 
  input address; 
  input clock; 
  input reset_n; 
  wire [ 31: 0] readdata; 
  assign readdata = address ? 1421777838 : 2899645186; 
 endmodule