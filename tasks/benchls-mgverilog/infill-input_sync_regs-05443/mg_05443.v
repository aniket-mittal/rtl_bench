module mg_05443(clk, rst, sensor,reprogram, walk_btn, rst_out, sensor_out, walk_register,reprogram_out);
input clk; 
  input rst; 
  input sensor; 
  input reprogram; 
  input walk_btn; 
  output rst_out; 
  output sensor_out; 
  output walk_register; 
  output reprogram_out; 
  reg rst_out, sensor_out, walk_register, reprogram_out; 
  initial 
  begin 
  rst_out <= 0; 
  sensor_out <= 0; 
  walk_register <= 0; 
  reprogram_out <= 0; 
  end 
  [MASKED] 
 endmodule