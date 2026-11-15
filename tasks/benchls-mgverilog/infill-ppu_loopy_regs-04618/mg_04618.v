module mg_04618(input clk, input ce,input is_rendering,input [2:0] ain,input [7:0] din,input read,input write,input is_pre_render,input [8:0] cycle,output [14:0] loopy,output [2:0] fine_x_scroll);
reg ppu_incr; 
  reg [14:0] loopy_v; 
  reg [14:0] loopy_t; 
  reg [2:0] loopy_x; 
  reg ppu_address_latch; 
  initial begin 
  ppu_incr = 0; 
  loopy_v = 0; 
  loopy_t = 0; 
  loopy_x = 0; 
  ppu_address_latch = 0; 
  end 
  [MASKED] 
  assign loopy = loopy_v; 
  assign fine_x_scroll = loopy_x; 
 endmodule