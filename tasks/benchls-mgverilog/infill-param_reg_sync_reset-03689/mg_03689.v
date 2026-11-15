module mg_03689(DataIn, DataOut, Write, Clk, Reset, SyncReset);
parameter WIDTH = 8; 
 parameter RESET_VALUE = 0; 
 input [WIDTH-1:0] DataIn; 
 input Write; 
 input Clk; 
 input Reset; 
 input SyncReset; 
 output [WIDTH-1:0] DataOut; 
 reg [WIDTH-1:0] DataOut; 
 [MASKED] 
 endmodule