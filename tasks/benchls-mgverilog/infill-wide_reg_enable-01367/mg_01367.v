module mg_01367 (clk,we, din, dout);
parameter WIDTH=32; 
 input we; 
 input clk; 
 input [WIDTH-1:0] din; 
 output [WIDTH-1:0] dout; 
 reg [WIDTH-1:0] store; 
 [MASKED] 
 assign dout = store ; 
 endmodule