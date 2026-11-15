module mg_06900(input_a,input_a_stb,output_z_ack,clk,rst,output_z,output_z_stb,input_a_ack);
input clk; 
  input rst; 
  input [63:0] input_a; 
  input input_a_stb; 
  output input_a_ack; 
  output [63:0] output_z; 
  output output_z_stb; 
  input output_z_ack; 
  reg s_output_z_stb; 
  reg [63:0] s_output_z; 
  reg s_input_a_ack; 
  reg [2:0] state; 
  parameter get_a = 3'd0, 
  special_cases = 3'd1, 
  unpack = 3'd2, 
  convert = 3'd3, 
  put_z = 3'd4; 
  reg [63:0] a_m, a, z; 
  reg [11:0] a_e; 
  reg a_s; 
  [MASKED] 
  assign input_a_ack = s_input_a_ack; 
  assign output_z_stb = s_output_z_stb; 
  assign output_z = s_output_z; 
 endmodule