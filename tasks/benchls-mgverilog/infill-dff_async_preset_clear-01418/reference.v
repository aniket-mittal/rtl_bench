module mg_01418(clk, preset, clear, d, q);
input clk, preset, clear, d; 
 output reg q; 
 always @(posedge clk, posedge preset, posedge clear) begin 
  if (preset) 
  q <= 1; 
  else if (clear) 
  q <= 0; 
  else 
  q <= d; 
 end 
 endmodule