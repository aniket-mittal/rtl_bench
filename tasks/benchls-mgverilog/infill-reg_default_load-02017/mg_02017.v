module mg_02017(DataIn, DataOut, Write, Clk, Reset, Default);
parameter WIDTH = 8; 
 input [WIDTH-1:0] DataIn; 
 input Write; 
 input Clk; 
 input Reset; 
 input [WIDTH-1:0] Default; 
 output [WIDTH-1:0] DataOut; 
 reg [WIDTH-1:0] DataOut; 
 [MASKED] 
 endmodule