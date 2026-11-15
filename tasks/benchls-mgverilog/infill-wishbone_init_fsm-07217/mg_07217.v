module mg_07217(input clk,input reset,input waitrequest,input [31:0] readdata,output reg [7:0] address,output reg write,output reg read,output reg [31:0] writedata);
reg [2:0] reg_count; 
 reg [3:0] count; 
 reg [1:0] current_state; 
 parameter idle_s = 2'b00, 
  wait_clk_s = 2'b01, 
  write_s = 2'b10, 
  wait_s = 2'b11; 
 [MASKED] 
  endmodule