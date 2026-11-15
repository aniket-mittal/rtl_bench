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

    always @(posedge ClockIn or posedge Reset) begin
        if (Reset) begin
            state <= IDLE;
            scan_counter <= 4'b0000;
            debounce_counter <= 20'b0;
            key_pressed <= 4'b0000;
            key_history <= 16'b0;
            display_digit <= 2'b00;
            Columns <= 4'b1111;
            Locked <= 1'b0;
            Found <= 1'b0;
            Display <= 8'b11111111;
            Transistors <= 4'b1111;
        end else begin
            state <= next_state;
            
            case (state)
                IDLE: begin
                    if (Start) begin
                        scan_counter <= 4'b0000;
                        Columns <= 4'b1110;
                    end
                end
                
                SCANNING: begin
                    if (Rows != 4'b1111) begin
                        key_pressed <= {scan_counter[1:0], Rows[1:0]};
                        debounce_counter <= 20'b0;
                    end else begin
                        scan_counter <= scan_counter + 1;
                        Columns <= {Columns[2:0], Columns[3]};
                    end
                end
                
                DEBOUNCE: begin
                    debounce_counter <= debounce_counter + 1;
                    if (debounce_counter == 20'd100000) begin // Adjust for desired debounce time
                        if (Rows != 4'b1111) begin
                            Found <= 1'b1;
                            key_history <= {key_history[11:0], key_pressed};
                            if (key_history[15:12] != 4'b0000) begin
                                Locked <= 1'b1;
                            end
                        end
                    end
                end
                
                DISPLAY_UPDATE: begin
                    case (display_digit)
                        2'b00: begin
                            Display <= bcd_to_7seg[key_history[3:0]];
                            Transistors <= 4'b1110;
                        end
                        2'b01: begin
                            Display <= bcd_to_7seg[key_history[7:4]];
                            Transistors <= 4'b1101;
                        end
                        2'b10: begin
                            Display <= bcd_to_7seg[key_history[11:8]];
                            Transistors <= 4'b1011;
                        end
                        2'b11: begin
                            Display <= bcd_to_7seg[key_history[15:12]];
                            Transistors <= 4'b0111;
                        end
                    endcase
                    display_digit <= display_digit + 1;
                end
            endcase
        end
    end

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