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

   always @(posedge clk)
   begin
      if (a >= b && a >= c && b >= c)
      begin
         max <= a ; 
         mid <= b ; 
         min <= c ; 
      end
      else if (a >= b && a >= c && c >= b)
      begin
         max <= a ; 
         mid <= c ; 
         min <= b ; 
      end
      else if (b >= a && b >= c && a >= c)
      begin
         max <= b ; 
         mid <= a ; 
         min <= c ; 
      end
      else if (b >= a && b >= c && c >= a)
      begin
         max <= b ; 
         mid <= c ; 
         min <= a ; 
      end
      else if (c >= a && c >= b && a >= b)
      begin
         max <= c ; 
         mid <= a ; 
         min <= b ; 
      end
      else if (c >= a && c >= b && b >= a)
      begin
         max <= c ; 
         mid <= b ; 
         min <= a ; 
      end 
   end 
endmodule