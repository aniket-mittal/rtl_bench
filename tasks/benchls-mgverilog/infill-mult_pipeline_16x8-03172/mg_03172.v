module mg_03172(clk, ce, a, b, p);
input clk; 
 input ce; 
 input[16 - 1 : 0] a; 
 input[8 - 1 : 0] b; 
 output[24 - 1 : 0] p; 
 reg[16 - 1 : 0] a_reg; 
 reg[8 - 1 : 0] b_reg; 
 wire [24 - 1 : 0] tmp_product; 
 reg[24 - 1 : 0] buff0; 
 reg[24 - 1 : 0] buff1; 
 assign p = buff1; 
 assign tmp_product = a_reg * b_reg; 
 [MASKED] 
 endmodule