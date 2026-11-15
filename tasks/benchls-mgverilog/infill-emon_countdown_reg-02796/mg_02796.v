module mg_02796 (emon_reg, emon_zero_flag,clk, reset, emon_vector, emon_sel, reg_write, reg_data);
parameter RFAW = 6; 
  parameter DW = 32; 
  input clk; 
  input reset; 
  input [15:0] emon_vector; 
  input [3:0] emon_sel; 
  input reg_write; 
  input [DW-1:0] reg_data; 
  output [DW-1:0] emon_reg; 
  output emon_zero_flag; 
  reg [DW-1:0] emon_reg; 
  reg emon_input; 
  always @(posedge clk) 
  emon_input <= emon_vector[emon_sel[3:0]]; 
  [MASKED] 
  assign emon_zero_flag = ~(|emon_reg[DW-1:0]); 
 endmodule