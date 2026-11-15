module mg_01626(q_out,t_in,clock,clear);
input t_in,clock,clear; 
  output reg q_out; 
  always @(posedge clock or negedge clear) 
  begin 
  if(~clear) 
  q_out <= 1'b0; 
  else 
  q_out <= t_in ^ q_out; 
  end 
 endmodule