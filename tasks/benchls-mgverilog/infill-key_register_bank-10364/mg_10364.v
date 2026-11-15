module mg_10364 (input clk_i,input reset_i,input [5:0] addr_i,input write_i,input read_i,input [31:0] data_i,output reg [31:0] data_o,output [79:0] keys);
reg [79:0] keys_r = 80'hffffffffffffffff; 
  assign keys = keys_r; 
  [MASKED] 
 endmodule