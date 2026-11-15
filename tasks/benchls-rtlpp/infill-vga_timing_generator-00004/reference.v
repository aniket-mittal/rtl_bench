module rtlpp_00004(
input wire clk_pixel,
input wire test_picture,
output wire fetch_next,
output wire line_repeat,
input wire [7:0] red_byte,
input wire [7:0] green_byte,
input wire [7:0] blue_byte,
output wire [7:0] vga_r,
output wire [7:0] vga_g,
output wire [7:0] vga_b,
output wire next_line,
output wire next_field,
output wire vga_hsync,
output wire vga_vsync,
output wire vga_vblank,
output wire vga_blank
);

parameter C_resolution_x = 640;
parameter C_hsync_front_porch = 16;
parameter C_hsync_pulse = 96;
parameter C_hsync_back_porch = 44;
parameter C_resolution_y = 480;
parameter C_vsync_front_porch = 10;
parameter C_vsync_pulse = 2;
parameter C_vsync_back_porch = 31;
parameter C_bits_x = 10;
parameter C_bits_y = 10;
parameter C_dbl_x = 0;
parameter C_dbl_y = 0;

parameter C_frame_x = C_resolution_x + C_hsync_front_porch + C_hsync_pulse + C_hsync_back_porch;  
parameter C_frame_y = C_resolution_y + C_vsync_front_porch + C_vsync_pulse + C_vsync_back_porch;  

parameter C_synclen = 3;  

reg [C_bits_x - 1:0] CounterX;  
reg [C_bits_y - 1:0] CounterY;  
reg hSync; 
reg vSync; 
reg vBlank; 
reg DrawArea; 
wire fetcharea;

wire [7:0] shift_red; 
wire [7:0] shift_green; 
wire [7:8] shift_blue;  

wire [7:0] W; 
wire [7:0] A; 
wire [7:0] T; 
reg [7:0] test_red; 
reg [7:0] test_green; 
reg [7:0] test_blue;

wire [5:0] Z;

assign next_line = (CounterX == C_resolution_x);
assign next_field = (CounterY == C_resolution_y);

assign fetcharea = (CounterX < C_resolution_x) && (CounterY < C_resolution_y);
assign fetch_next = fetcharea;

always @(posedge clk_pixel) begin
    DrawArea <= fetcharea;
    if (CounterX == (C_frame_x - 1)) begin
        CounterX <= 0;
        if (CounterY == (C_frame_y - 1)) begin
            CounterY <= 0;
        end else begin
            CounterY <= CounterY + 1;
        end
    end else begin
        CounterX <= CounterX + 1;
    end
end

assign vga_blank =  ~DrawArea;

always @(posedge clk_pixel) begin
    if (CounterX == (C_resolution_x + C_hsync_front_porch)) begin
        hSync <= 1'b1;
    end
    if (CounterX == (C_resolution_x + C_hsync_front_porch + C_hsync_pulse)) begin
        hSync <= 1'b0;
    end
    if (CounterY == C_resolution_y) begin
        vBlank <= 1'b1;
    end
    if (CounterY == (C_resolution_y + C_vsync_front_porch)) begin
        vSync <= 1'b1;
    end
    if (CounterY == (C_resolution_y + C_vsync_front_porch + C_vsync_pulse)) begin
        vSync <= 1'b0;
        vBlank <= 1'b0;
    end
end

assign vga_hsync = hSync;
assign vga_vsync = vSync;
assign vga_vblank = vBlank;
assign line_repeat = (C_dbl_y == 0) ? 1'b0 : (hSync &  ~CounterY[0]);

assign A = (CounterX[7:5] == 3'b010 && CounterY[7:5] == 3'b010) ? 8'b11111111 : 8'b00000000;
assign W = (CounterX[7:0] == CounterY[7:0]) ? 8'b11111111 : 8'b00000000;
assign Z = (CounterY[4:3] ==  ~CounterX[4:3]) ? 8'b111111 : 8'b000000;
assign T = {8{CounterY[6]}};

always @(posedge clk_pixel) begin
    test_red <= (({CounterX[5:0] & Z, 2'b00}) | W) &  ~A;
    test_green <= ((CounterX[7:0] & T) | W) &  ~A;
    test_blue <= CounterY[7:0] | W | A;
end

assign vga_r = (DrawArea == 1'b0) ? 8'b00000000 : (test_picture == 1'b0) ? red_byte : test_red;
assign vga_g = (DrawArea == 1'b0) ? 8'b00000000 : (test_picture == 1'b0) ? green_byte : test_green;
assign vga_b = (DrawArea == 1'b0) ? 8'b00000000 : (test_picture == 1'b0) ? blue_byte : test_blue;

endmodule