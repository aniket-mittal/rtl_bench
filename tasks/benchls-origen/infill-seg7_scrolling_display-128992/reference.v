module origen_128992 (
    input wire clk,
    input wire change,
    input wire reset,
    input wire [615:0] string_in, // 77 characters * 8 bits per character
    output reg [6:0] segments,
    output reg [7:0] display_control
);

reg [6:0] char_to_seg [0:127];
reg [615:0] current_string;
reg [6:0] current_char;
reg [6:0] char_count;
reg [6:0] display_pos;
reg [25:0] scroll_counter;

initial begin
    // Initialize 7-segment mappings (simplified for brevity)
    char_to_seg[8'h30] = 7'b1111110; // 0
    char_to_seg[8'h31] = 7'b0110000; // 1
    char_to_seg[8'h32] = 7'b1101101; // 2
    // ... Add more character mappings as needed
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_string <= 616'b0;
        char_count <= 7'b0;
        display_pos <= 7'b0;
        scroll_counter <= 26'b0;
    end else if (change) begin
        current_string <= string_in;
        char_count <= 7'd77;
        display_pos <= 7'b0;
        scroll_counter <= 26'b0;
    end else begin
        if (scroll_counter == 26'd50000000) begin // 1 second at 50MHz
            scroll_counter <= 26'b0;
            if (display_pos == char_count - 1)
                display_pos <= 7'b0;
            else
                display_pos <= display_pos + 1'b1;
        end else begin
            scroll_counter <= scroll_counter + 1'b1;
        end
    end
end

always @(*) begin
    current_char = current_string[display_pos*8 +: 8];
    segments = char_to_seg[current_char];
    display_control = 8'b11111111; // All digits on
end

endmodule