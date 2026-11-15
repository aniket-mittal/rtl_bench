module mg_06631(input clk, input [11:0] pixel_count, line_count, input fb_reset, fb_enable, output reg [11:0] x, y);
parameter FB_X_MAX = 1280; 
  parameter FB_Y_MAX = 1024; 
  [MASKED] 
  reg [11:0] next_x, next_y; 
  always @(*) begin 
  next_x = (x == FB_X_MAX-1) ? 0 : x + 1; 
  next_y = (x == FB_X_MAX-1) ? ((y == FB_Y_MAX-1) ? 0 : y + 1) : y; 
  end 
 endmodule