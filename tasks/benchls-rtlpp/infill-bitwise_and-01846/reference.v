module rtlpp_01846 (
   c_o, 
   a_i, b_i
) ;
   parameter dw = 8; // Assuming a default value for W_DATA
   input [dw-1:0] a_i,b_i;
   output [dw-1:0]  c_o;
   assign c_o = a_i & b_i;
endmodule