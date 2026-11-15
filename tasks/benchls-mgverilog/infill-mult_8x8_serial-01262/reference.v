module mg_01262(output reg [7:0] product,output done,input [7:0] A,input [7:0] B,input clk,input start );
reg [4:0] multcounter; 
 reg [7:0] shiftA; 
 reg [7:0] shiftB; 
 wire adden; 
 assign adden = shiftB[7] & !done; 
 assign done = multcounter[3]; 
 always @(posedge clk) begin 
  if( start ) 
  multcounter <= 0; 
  else if( !done ) begin 
  multcounter <= multcounter + 1; 
  end 
  if( start ) 
  shiftB <= B; 
  else 
  shiftB[7:0] <= { shiftB[6:0], 1'b0 }; 
  if( start ) 
  shiftA <= A; 
  else 
  shiftA <= { shiftA[7], shiftA[7:1] }; 
  if( start ) 
  product <= 0; 
  else if( adden ) 
  product <= product + shiftA; 
 end 
 endmodule