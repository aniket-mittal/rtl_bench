module oks8_rlc (
   c_o, 
   a_i
) ;
   parameter dw = 8; // Assuming a default value for W_DATA
   input [dw:0] a_i;
   output [dw:0]  c_o;
   assign c_o = {a_i[dw-1:0],a_i[dw]};
endmodule