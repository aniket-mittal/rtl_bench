module origen_147258(
    input mclk,
    input [3:0] btn,
    input [7:0] sw,
    output [7:0] led,
    output reg [6:0] seg,
    output reg [3:0] an,
    output dp,
    output [2:1] OutBlue,
    output [2:0] OutGreen,
    output [2:0] OutRed,
    output HS,
    output VS
);

// Parameters for VGA timing
parameter H_DISPLAY = 640;
parameter H_BACK = 48;
parameter H_FRONT = 16;
parameter H_SYNC = 96;
parameter V_DISPLAY = 480;
parameter V_BACK = 33;
parameter V_FRONT = 10;
parameter V_SYNC = 2;

// Parameters for square
parameter SQUARE_SIZE = 50;
reg [9:0] square_x = H_DISPLAY/2 - SQUARE_SIZE/2;
reg [9:0] square_y = V_DISPLAY/2 - SQUARE_SIZE/2;

// Counter for 7-segment display
reg [3:0] digit_counter = 0;

// VGA signals
reg [9:0] h_count = 0;
reg [9:0] v_count = 0;
wire h_active, v_active, display_on;
reg vga_HS, vga_VS;

// Button debounce
reg [3:0] btn_prev = 0;
reg [19:0] debounce_counter = 0;

// 7-segment display patterns
reg [6:0] seg_patterns [9:0];
initial begin
    seg_patterns[0] = 7'b1000000; // 0
    seg_patterns[1] = 7'b1111001; // 1
    seg_patterns[2] = 7'b0100100; // 2
    seg_patterns[3] = 7'b0110000; // 3
    seg_patterns[4] = 7'b0011001; // 4
    seg_patterns[5] = 7'b0010010; // 5
    seg_patterns[6] = 7'b0000010; // 6
    seg_patterns[7] = 7'b1111000; // 7
    seg_patterns[8] = 7'b0000000; // 8
    seg_patterns[9] = 7'b0010000; // 9
end

// LED control
assign led = sw;

// 7-segment display control
always @(posedge mclk) begin
    if (btn[2] && !btn_prev[2] && debounce_counter == 0) begin
        digit_counter <= (digit_counter + 1) % 10;
        debounce_counter <= 20'hFFFFF; // Set debounce counter
    end
    
    if (debounce_counter > 0)
        debounce_counter <= debounce_counter - 1;
        
    btn_prev <= btn;
    
    seg <= seg_patterns[digit_counter];
    an <= 4'b1110; // Enable only the rightmost digit
end

// VGA timing generation
always @(posedge mclk) begin
    if (h_count == H_DISPLAY + H_FRONT + H_SYNC + H_BACK - 1) begin
        h_count <= 0;
        if (v_count == V_DISPLAY + V_FRONT + V_SYNC + V_BACK - 1)
            v_count <= 0;
        else
            v_count <= v_count + 1;
    end
    else
        h_count <= h_count + 1;
        
    vga_HS <= (h_count >= H_DISPLAY + H_FRONT) && (h_count < H_DISPLAY + H_FRONT + H_SYNC);
    vga_VS <= (v_count >= V_DISPLAY + V_FRONT) && (v_count < V_DISPLAY + V_FRONT + V_SYNC);
end

assign h_active = (h_count < H_DISPLAY);
assign v_active = (v_count < V_DISPLAY);
assign display_on = h_active && v_active;

// Square movement
always @(posedge mclk) begin
    if (btn[0] && !btn_prev[0] && square_x > 0)
        square_x <= square_x - 1; // Move left
    if (btn[1] && !btn_prev[1] && square_x < H_DISPLAY - SQUARE_SIZE)
        square_x <= square_x + 1; // Move right
    if (btn[2] && !btn_prev[2] && square_y > 0)
        square_y <= square_y - 1; // Move up
    if (btn[3] && !btn_prev[3] && square_y < V_DISPLAY - SQUARE_SIZE)
        square_y <= square_y + 1; // Move down
end

// VGA output
assign OutRed = (display_on && h_count >= square_x && h_count < square_x + SQUARE_SIZE &&
                 v_count >= square_y && v_count < square_y + SQUARE_SIZE) ? 3'b111 : 3'b000;
assign OutGreen = (display_on && h_count >= square_x && h_count < square_x + SQUARE_SIZE &&
                   v_count >= square_y && v_count < square_y + SQUARE_SIZE) ? 3'b111 : 3'b000;
assign OutBlue = (display_on && h_count >= square_x && h_count < square_x + SQUARE_SIZE &&
                  v_count >= square_y && v_count < square_y + SQUARE_SIZE) ? 2'b11 : 2'b00;

assign HS = ~vga_HS;
assign VS = ~vga_VS;
assign dp = 1'b1; // Turn off decimal point

endmodule