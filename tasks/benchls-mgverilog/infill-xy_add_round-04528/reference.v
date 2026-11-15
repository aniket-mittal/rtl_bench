module mg_04528(input clk,input rst,input arg_0,input arg_1,input [14:0] arg_2,input [14:0] arg_3,input [7:0] arg_4,input arg_5,input arg_6,output [15:0] ret_0,output ret_1,output ret_2,output [7:0] ret_3,output ret_4,output ret_5);
wire xn; 
  wire yn; 
  wire [15:0] rxy; 
  wire diff_sign; 
  wire [15:0] r_final; 
  assign xn = arg_5; 
  assign yn = arg_6; 
  assign diff_sign = (xn != yn); 
  assign rxy = arg_2 + arg_3; 
  assign r_final = diff_sign ? (rxy + 1) : rxy; 
  assign ret_0 = r_final; 
  assign ret_1 = arg_0; 
  assign ret_2 = arg_1; 
  assign ret_3 = arg_4; 
  assign ret_4 = arg_5; 
  assign ret_5 = arg_6; 
 endmodule