module rtlpp_04105(
   input clk,
   input rst,
   output [3:0] count,
   output [3:0] countbar
   );

   reg q0, q1, q2, q3;
   
   assign count[0] = q0;
   assign countbar[0] = ~q0;
   assign count[1] = q1;
   assign countbar[1] = ~q1;
   assign count[2] = q2;
   assign countbar[2] = ~q2;
   assign count[3] = q3;
   assign countbar[3] = ~q3;

   [MASKED] 

endmodule