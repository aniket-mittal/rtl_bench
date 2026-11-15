module mg_03405 ( data_in,data_out,we,clk,rst_sync);
parameter WIDTH = 8; 
 parameter RESET_VALUE = 0; 
 input [WIDTH-1:0] data_in; 
 input we; 
 input clk; 
 input rst_sync; 
 output [WIDTH-1:0] data_out; 
 reg [WIDTH-1:0] data_out; 
 [MASKED] 
 endmodule