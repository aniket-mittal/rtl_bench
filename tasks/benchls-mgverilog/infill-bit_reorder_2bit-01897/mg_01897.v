module mg_01897 (din, dout);
parameter din_width = 8; 
  parameter dout_width = 2; 
  parameter num_outputs = 4; 
  input [din_width-1:0] din; 
  output [din_width-1:0] dout; 
  genvar index; 
  generate 
  for (index=0; index<num_outputs; index=index+1) 
  begin:u0 
  [MASKED] 
  end 
  endgenerate 
 endmodule