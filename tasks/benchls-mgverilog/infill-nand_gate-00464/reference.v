module mg_00464 (input [(1 - 1):0] d0,input [(1 - 1):0] d1,output [(1 - 1):0] y,input clk,input ce,input clr);
wire d0_1_24; 
  wire d1_1_27; 
  wire bit_2_27; 
  wire fully_2_1_bitnot; 
  assign d0_1_24 = d0; 
  assign d1_1_27 = d1; 
  assign bit_2_27 = d0_1_24 & d1_1_27; 
  assign fully_2_1_bitnot = ~bit_2_27; 
  assign y = fully_2_1_bitnot; 
 endmodule