module mg_01262(output reg [7:0] product,output done,input [7:0] A,input [7:0] B,input clk,input start );
reg [4:0] multcounter; 
 reg [7:0] shiftA; 
 reg [7:0] shiftB; 
 wire adden; 
 assign adden = shiftB[7] & !done; 
 assign done = multcounter[3]; 
 [MASKED] 
 endmodule