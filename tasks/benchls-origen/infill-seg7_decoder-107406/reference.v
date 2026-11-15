module origen_107406 (
    input logic [9:0] SW,
    input logic [3:0] KEY,
    output logic [9:0] LEDR,
    output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
);

    // LED control
    assign LEDR[0] = SW[9] & SW[8] & SW[7];
    assign LEDR[1] = (SW[9] | SW[8]) & (SW[7] | SW[0]);
    assign LEDR[9:2] = 8'b0;  // Turn off unused LEDs

    // 7-segment display control
    always_comb begin
        case (SW[9:7])
            3'b000: begin
                HEX0 = 7'b1000000;  // 0
                HEX1 = 7'b1111001;  // 1
                HEX2 = 7'b0100100;  // 2
                HEX3 = 7'b0110000;  // 3
                HEX4 = 7'b0011001;  // 4
                HEX5 = 7'b0010010;  // 5
            end
            3'b001: begin
                HEX0 = 7'b0000010;  // 6
                HEX1 = 7'b1111000;  // 7
                HEX2 = 7'b0000000;  // 8
                HEX3 = 7'b0010000;  // 9
                HEX4 = 7'b0001000;  // A
                HEX5 = 7'b0000011;  // b
            end
            3'b011: begin
                HEX0 = 7'b1000110;  // C
                HEX1 = 7'b0100001;  // d
                HEX2 = 7'b0000110;  // E
                HEX3 = 7'b0001110;  // F
                HEX4 = 7'b0111111;  // -
                HEX5 = 7'b1111111;  // (blank)
            end
            3'b100: begin
                HEX0 = 7'b0001100;  // P
                HEX1 = 7'b0011000;  // U
                HEX2 = 7'b0111111;  // -
                HEX3 = 7'b0001100;  // P
                HEX4 = 7'b0011000;  // U
                HEX5 = 7'b0111111;  // -
            end
            3'b101: begin
                HEX0 = 7'b1000111;  // L
                HEX1 = 7'b1000000;  // O
                HEX2 = 7'b1000111;  // L
                HEX3 = 7'b1111111;  // (blank)
                HEX4 = 7'b1111111;  // (blank)
                HEX5 = 7'b1111111;  // (blank)
            end
            3'b110: begin
                HEX0 = 7'b0001100;  // P
                HEX1 = 7'b0001000;  // A
                HEX2 = 7'b0101011;  // n
                HEX3 = 7'b0001000;  // A
                HEX4 = 7'b1000110;  // C
                HEX5 = 7'b0001000;  // A
            end
            default: begin
                HEX0 = 7'b1111111;  // All off
                HEX1 = 7'b1111111;
                HEX2 = 7'b1111111;
                HEX3 = 7'b1111111;
                HEX4 = 7'b1111111;
                HEX5 = 7'b1111111;
            end
        endcase
    end
endmodule

