module mg_07069(input d,output reg q,input clk);
always @(clk) 
  q <= d; 
 endmodule