module mg_04561(clk,s_in,s_out);
input clk; 
  input s_in; 
  output s_out; 
  reg s_tmp; 
  reg [31:0]counter_low, counter_high; 
  initial begin 
  counter_low <= 0; 
  counter_high <= 0; 
  end 
  assign s_out = s_tmp; 
  always @(posedge clk) begin 
  if(s_in == 1'b0) 
  counter_low <= counter_low + 1; 
  else 
  counter_low <= 0; 
  end 
  always @(posedge clk) begin 
  if(s_in == 1'b1) 
  counter_high <= counter_high + 1; 
  else 
  counter_high <= 0; 
  end 
  always @(posedge clk) begin 
  if (counter_low == 4) s_tmp <= 0; 
  else if (counter_high == 4) s_tmp <= 1; 
  end 
 endmodule