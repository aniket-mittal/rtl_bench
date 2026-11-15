module rtlpp_01002 (clk, a, b, c, max, mid, min);

   parameter width  = 8;
   input clk; 
   input [width - 1:0] a; 
   input [width - 1:0] b; 
   input [width - 1:0] c; 
   output [width - 1:0] max; 
   output [width - 1:0] mid; 
   output [width - 1:0] min; 
   
   reg [width - 1:0] max;
   reg [width - 1:0] mid;
   reg [width - 1:0] min;

   [MASKED] 
endmodule