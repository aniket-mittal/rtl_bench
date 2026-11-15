module mg_07256 (clk,rst,config_valid,config_low,config_high,config_chained,input_valid,input_char,prev_matched,this_matched);
input clk; 
  input rst; 
  input config_valid; 
  input [7:0] config_low; 
  input [7:0] config_high; 
  input [1:0] config_chained; 
  input input_valid; 
  input [7:0] input_char; 
  input prev_matched; 
  output this_matched; 
  reg char_match; 
  reg [7:0] char_low; 
  reg [7:0] char_high; 
  reg is_chained; 
  assign this_matched = char_match; 
  [MASKED] 
 endmodule