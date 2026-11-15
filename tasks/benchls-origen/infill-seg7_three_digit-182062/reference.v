module origen_182062(
    input [3:0] hundreds,
    input [3:0] tens,
    input [3:0] ones,
    output reg [6:0] display_0,
    output reg [6:0] display_1,
    output reg [6:0] display_2
);

always @(*) begin
    case (ones)
        4'b0000: display_0 = 7'b1000000; // 0
        4'b0001: display_0 = 7'b1111001; // 1
        4'b0010: display_0 = 7'b0100100; // 2
        4'b0011: display_0 = 7'b0110000; // 3
        4'b0100: display_0 = 7'b0011001; // 4
        4'b0101: display_0 = 7'b0010010; // 5
        4'b0110: display_0 = 7'b0000010; // 6
        4'b0111: display_0 = 7'b1111000; // 7
        4'b1000: display_0 = 7'b0000000; // 8
        4'b1001: display_0 = 7'b0011000; // 9
        default: display_0 = 7'b1111111; // Blank
    endcase

    case (tens)
        4'b0000: display_1 = 7'b1000000; // 0
        4'b0001: display_1 = 7'b1111001; // 1
        4'b0010: display_1 = 7'b0100100; // 2
        4'b0011: display_1 = 7'b0110000; // 3
        4'b0100: display_1 = 7'b0011001; // 4
        4'b0101: display_1 = 7'b0010010; // 5
        4'b0110: display_1 = 7'b0000010; // 6
        4'b0111: display_1 = 7'b1111000; // 7
        4'b1000: display_1 = 7'b0000000; // 8
        4'b1001: display_1 = 7'b0011000; // 9
        default: display_1 = 7'b1111111; // Blank
    endcase

    case (hundreds)
        4'b0000: display_2 = 7'b1000000; // 0
        4'b0001: display_2 = 7'b1111001; // 1
        4'b0010: display_2 = 7'b0100100; // 2
        4'b0011: display_2 = 7'b0110000; // 3
        4'b0100: display_2 = 7'b0011001; // 4
        4'b0101: display_2 = 7'b0010010; // 5
        4'b0110: display_2 = 7'b0000010; // 6
        4'b0111: display_2 = 7'b1111000; // 7
        4'b1000: display_2 = 7'b0000000; // 8
        4'b1001: display_2 = 7'b0011000; // 9
        default: display_2 = 7'b1111111; // Blank
    endcase
end

endmodule