module mg_03424(input logic clk,input logic rst,input logic u_MyInterfaceInSub2_setting,output logic [3:0] u_MyInterfaceInSub2_other_setting,input logic [1:0] u_MyInterfaceInSub2_mysig_out,input logic u_MyInterfaceInSub3_setting,output logic [21:0] u_MyInterfaceInSub3_other_setting,input logic [1:0] u_MyInterfaceInSub3_mysig_out,output logic [15:0] passThrough);
always @(u_MyInterfaceInSub3_mysig_out) begin 
  if (u_MyInterfaceInSub3_mysig_out == 2'b00) 
  u_MyInterfaceInSub3_other_setting[21:0] = 1000; 
  else if (u_MyInterfaceInSub3_mysig_out == 2'b01) 
  u_MyInterfaceInSub3_other_setting[21:0] = 2000; 
  else if (u_MyInterfaceInSub3_mysig_out == 2'b10) 
  u_MyInterfaceInSub3_other_setting[21:0] = 3000; 
  else 
  u_MyInterfaceInSub3_other_setting[21:0] = 4000; 
  end 
  assign passThrough[7:0] = 124; 
  assign passThrough[15:8] = 200; 
 endmodule