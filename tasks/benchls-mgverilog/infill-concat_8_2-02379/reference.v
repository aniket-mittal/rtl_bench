module mg_02379 (input [(8 - 1):0] in0,input [(2 - 1):0] in1,output [(10 - 1):0] y,input clk,input ce,input clr);
wire [(8 - 1):0] in0_1_23; 
  wire [(2 - 1):0] in1_1_27; 
  wire [(10 - 1):0] y_2_1_concat; 
  assign in0_1_23 = in0; 
  assign in1_1_27 = in1; 
  assign y_2_1_concat = {in0_1_23, in1_1_27}; 
  assign y = y_2_1_concat; 
 endmodule