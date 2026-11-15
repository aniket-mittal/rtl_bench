module mg_00331(input wire clk,input wire rst,input wire [3:0] rdport1_ctrl_add,output wire [31:0] rdport1_data_out,input wire [3:0] rdport2_ctrl_add,output wire [31:0] rdport2_data_out,input wire [3:0] rdport3_ctrl_add,output wire [31:0] rdport3_data_out,input wire [3:0] rdport4_ctrl_add,output wire [31:0] rdport4_data_out,input wire [3:0] wrport1_ctrl_add,input wire [31:0] wrport1_data_in,input wire wrport1_wren,input wire [3:0] wrport2_ctrl_add,input wire [31:0] wrport2_data_in,input wire wrport2_wren);
reg [31:0] regFile [15:0]; 
  integer i = 0; 
  assign rdport1_data_out = regFile[rdport1_ctrl_add]; 
  assign rdport2_data_out = regFile[rdport2_ctrl_add]; 
  assign rdport3_data_out = regFile[rdport3_ctrl_add]; 
  assign rdport4_data_out = regFile[rdport4_ctrl_add]; 
  [MASKED] 
 endmodule