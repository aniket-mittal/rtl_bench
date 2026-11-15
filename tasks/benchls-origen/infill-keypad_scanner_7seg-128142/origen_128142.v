module origen_128142 (
    input wire [3:0] Rows,
    input wire ClockIn,
    input wire Start,
    input wire Reset,
    output reg [3:0] Columns,
    output reg Locked,
    output reg Found,
    output reg [7:0] Display,
    output reg [3:0] Transistors
);

    // State definitions
    localparam IDLE = 2'b00;
    localparam SCANNING = 2'b01;
    localparam DEBOUNCE = 2'b10;
    localparam DISPLAY_UPDATE = 2'b11;

    reg [1:0] state;
    reg [1:0] next_state;
    reg [3:0] scan_counter;
    reg [19:0] debounce_counter;
    reg [3:0] key_pressed;
    reg [15:0] key_history;
    reg [1:0] display_digit;
    reg [7:0] bcd_to_7seg [0:15];

    // BCD to 7-segment lookup table
    initial begin
        bcd_to_7seg[0] = 8'b11000000;  // 0
        bcd_to_7seg[1] = 8'b11111001;  // 1
        bcd_to_7seg[2] = 8'b10100100;  // 2
        bcd_to_7seg[3] = 8'b10110000;  // 3
        bcd_to_7seg[4] = 8'b10011001;  // 4
        bcd_to_7seg[5] = 8'b10010010;  // 5
        bcd_to_7seg[6] = 8'b10000010;  // 6
        bcd_to_7seg[7] = 8'b11111000;  // 7
        bcd_to_7seg[8] = 8'b10000000;  // 8
        bcd_to_7seg[9] = 8'b10010000;  // 9
        bcd_to_7seg[10] = 8'b10001000; // A
        bcd_to_7seg[11] = 8'b10000011; // B
        bcd_to_7seg[12] = 8'b11000110; // C
        bcd_to_7seg[13] = 8'b10100001; // D
        bcd_to_7seg[14] = 8'b10000110; // E
        bcd_to_7seg[15] = 8'b10001110; // F
    end

    [MASKED]

    always @(*) begin
        case (state)
            IDLE: next_state = (Start) ? SCANNING : IDLE;
            SCANNING: next_state = (Rows != 4'b1111) ? DEBOUNCE : SCANNING;
            DEBOUNCE: next_state = (debounce_counter == 20'd100000) ? DISPLAY_UPDATE : DEBOUNCE;
            DISPLAY_UPDATE: next_state = (Locked) ? DISPLAY_UPDATE : SCANNING;
            default: next_state = IDLE;
        endcase
    end

endmodule