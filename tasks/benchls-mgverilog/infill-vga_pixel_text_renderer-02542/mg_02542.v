module mg_02542(input clk,input [15:0] data_in,input [10:0] vga_h,input [10:0] vga_v,input [2:0] bg,output [2:0] pixel_out,output display_on);
parameter START_H = 10; 
  parameter START_V = 380; 
  reg [2:0] out = 0; 
  assign pixel_out = out; 
  reg on = 0; 
  assign display_on = on; 
  [MASKED] 
  endmodule