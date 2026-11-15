module mg_01490(color_depth_i, mem_i, mem_lsb_i,color_o, sel_o);
input [1:0] color_depth_i; 
 input [31:0] mem_i; 
 input [1:0] mem_lsb_i; 
 output [31:0] color_o; 
 output [3:0] sel_o; 
 assign sel_o = color_depth_i == 2'b00 ? 4'b0001 : 
  color_depth_i == 2'b01 ? 4'b0011 : 
  4'b1111; 
 [MASKED] 
 endmodule