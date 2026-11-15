module oks8_sbc (
   c_o, 
   a_i, b_i, c_i
) ;
   parameter dw = 8; // Assuming a default value for W_DATA
   input [dw-1:0] a_i,b_i;
   input c_i;
   output [dw:0]  c_o;
   reg [dw:0] c_o;
   
   always @(a_i or b_i or c_i)
     c_o <= a_i - b_i - c_i;
endmodule