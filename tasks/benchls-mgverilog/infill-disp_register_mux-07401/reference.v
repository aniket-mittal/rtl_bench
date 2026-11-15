module mg_07401(input wire clk,input wire rst,input wire GPIOe0000000_we,input wire [2:0] Test,input wire [31:0] disp_cpudata,input wire [31:0] Test_data0,input wire [31:0] Test_data1,input wire [31:0] Test_data2,input wire [31:0] Test_data3,input wire [31:0] Test_data4,input wire [31:0] Test_data5,input wire [31:0] Test_data6,output reg [31:0] disp_num);
always @(negedge clk or posedge rst) begin 
  if (rst) disp_num <= 32'h0000; 
  else begin 
  case (Test) 
  0: begin 
  if(GPIOe0000000_we) disp_num <= disp_cpudata; 
  else disp_num <= disp_num; 
  end 
  1: disp_num <= Test_data0; 
  2: disp_num <= Test_data1; 
  3: disp_num <= Test_data2; 
  4: disp_num <= Test_data3; 
  5: disp_num <= Test_data4; 
  6: disp_num <= Test_data5; 
  7: disp_num <= Test_data6; 
  endcase 
  end 
  end 
 endmodule