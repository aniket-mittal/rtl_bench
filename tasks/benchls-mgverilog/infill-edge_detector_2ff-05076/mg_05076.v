module mg_05076(input clk,input reset,input in,output p);
reg [1:0] x; 
  [MASKED] 
  assign p = x[0] & !x[1]; 
 endmodule