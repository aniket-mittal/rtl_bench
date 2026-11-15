module mg_03424(input logic clk,input logic rst,input logic u_MyInterfaceInSub2_setting,output logic [3:0] u_MyInterfaceInSub2_other_setting,input logic [1:0] u_MyInterfaceInSub2_mysig_out,input logic u_MyInterfaceInSub3_setting,output logic [21:0] u_MyInterfaceInSub3_other_setting,input logic [1:0] u_MyInterfaceInSub3_mysig_out,output logic [15:0] passThrough);
[MASKED] 
  assign passThrough[7:0] = 124; 
  assign passThrough[15:8] = 200; 
 endmodule