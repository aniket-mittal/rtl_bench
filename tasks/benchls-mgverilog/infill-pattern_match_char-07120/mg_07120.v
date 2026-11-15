module mg_07120 (clk,rst,config_valid,config_char,config_chained,input_valid,input_char,prev_matched,this_matched);
input clk; 
  input rst; 
  input config_valid; 
  input [7:0] config_char; 
  input config_chained; 
  input input_valid; 
  input [7:0] input_char; 
  input prev_matched; 
  output this_matched; 
  reg char_match; 
  reg [7:0] char_data; 
  reg is_chained; 
  assign this_matched = char_match; 
  [MASKED] 
 endmodule