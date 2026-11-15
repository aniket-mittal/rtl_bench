module mg_10390(input clk,output reg vga_h, output reg vga_v,output reg [3:0] vga_r, output reg[3:0] vga_g, output reg[3:0] vga_b,output [9:0] vga_hcounter,output [9:0] vga_vcounter,output [9:0] next_pixel_x,input [14:0] pixel,input sync,input border);
reg [9:0] h, v; 
 wire hpicture = (h < 512); 
 wire hsync_on = (h == 512 + 23 + 35); 
 wire hsync_off = (h == 512 + 23 + 35 + 82); 
 wire hend = (h == 681); 
 wire vpicture = (v < 480); 
 wire vsync_on = hsync_on && (v == 480 + 10); 
 wire vsync_off = hsync_on && (v == 480 + 12); 
 wire vend = (v == 523); 
 wire inpicture = hpicture && vpicture; 
 assign vga_hcounter = h; 
 assign vga_vcounter = v; 
 wire [9:0] new_h = (hend || sync) ? 0 : h + 1; 
 assign next_pixel_x = {sync ? 1'b0 : hend ? !v[0] : v[0], new_h[8:0]}; 
 [MASKED] 
 endmodule