module mg_10085(input d,output reg q,input clk);
always @(posedge clk) 
  q <= d; 
 endmodule