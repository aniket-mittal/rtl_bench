module mg_10408(input reset,input clk,input push_in,output push_out,input [31:0] in_col_index,output [31:0] out_col_index,output [4:0] out_count);
reg r_push_out; 
  reg [31:0] col_index; 
  reg [4:0] counter; 
  reg [5:0] timer; 
  reg [4:0] r_out_count; 
  reg [31:0] col_out_index; 
  [MASKED] 
  assign push_out = r_push_out; 
  assign out_col_index = col_out_index; 
  assign out_count = r_out_count; 
 endmodule