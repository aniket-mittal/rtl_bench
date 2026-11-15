module mg_08121 (input clk ,input reset_n ,output [11:0] Data_A ,output [11:0] Data_B ,output [11:0] Data_C ,output [11:0] Data_D ,output [11:0] Data_E ,output [11:0] Data_F ,output [11:0] Data_G ,output [11:0] Data_H);
reg [11:0] data_buf ; 
  [MASKED] 
  assign Data_A = data_buf ; 
  assign Data_B = Data_A+1 ; 
  assign Data_C = Data_B+1 ; 
  assign Data_D = Data_C+1 ; 
  assign Data_E = data_buf ; 
  assign Data_F = Data_E+1 ; 
  assign Data_G = Data_F+1 ; 
  assign Data_H = Data_G+1 ; 
 endmodule