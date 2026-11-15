module mg_10618(clk, pulse, button);
parameter TIME = 32767; 
  input clk; 
  output pulse; 
  input button; 
  reg [15:0] delay; 
  assign pulse = (delay != 0) | (!button); 
  [MASKED] 
 endmodule