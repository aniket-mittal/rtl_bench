module mg_08518 (data_out,clk,data_in,rst);
output data_out; 
 input clk; 
 input data_in; 
 input rst; 
 reg [1:0] data_sync; 
 [MASKED] 
 assign data_out = data_sync[1]; 
 endmodule