module mg_06957(clock, reset, start, N, dp, done, counter, sr);
input clock; 
 input start; 
 input reset; 
 input [8:0] N; 
 output [8:0] dp; 
 output done; 
 output [7:0] counter; 
 output [7:0] sr; 
 reg [8:0] dp; 
 reg [7:0] sr; 
 reg [7:0] counter; 
 reg [1:0] startbuf; 
 reg done; 
 reg [2:0] state; 
 parameter INIT = 3'b000; 
 parameter RUN = 3'b001; 
 parameter ALMOSTDONE = 3'b010; 
 parameter DONE = 3'b011; 
 parameter WAIT = 3'b100; 
 [MASKED] 
 endmodule