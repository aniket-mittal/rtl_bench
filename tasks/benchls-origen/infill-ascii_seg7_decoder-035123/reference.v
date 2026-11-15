module origen_035123 (
    input [7:0] INDEX,
    output reg [7:0] CODE
);

always @(*) begin
    case (INDEX)
        8'h30: CODE = 8'b11000000; // 0
        8'h31: CODE = 8'b11111001; // 1
        8'h32: CODE = 8'b10100100; // 2
        8'h33: CODE = 8'b10110000; // 3
        8'h34: CODE = 8'b10011001; // 4
        8'h35: CODE = 8'b10010010; // 5
        8'h36: CODE = 8'b10000010; // 6
        8'h37: CODE = 8'b11111000; // 7
        8'h38: CODE = 8'b10000000; // 8
        8'h39: CODE = 8'b10010000; // 9
        8'h41, 8'h61: CODE = 8'b10001000; // A, a
        8'h42, 8'h62: CODE = 8'b10000011; // B, b
        8'h43: CODE = 8'b11000110; // C
        8'h63: CODE = 8'b10100111; // c
        8'h44, 8'h64: CODE = 8'b10100001; // D, d
        8'h45, 8'h65: CODE = 8'b10000110; // E, e
        8'h46, 8'h66: CODE = 8'b10001110; // F, f
        8'h47, 8'h67: CODE = 8'b11000010; // G, g
        8'h48, 8'h68: CODE = 8'b10001001; // H, h
        8'h49, 8'h69: CODE = 8'b11111001; // I, i
        8'h4A, 8'h6A: CODE = 8'b11100001; // J, j
        8'h4B, 8'h6B: CODE = 8'b10001010; // K, k
        8'h4C, 8'h6C: CODE = 8'b11000111; // L, l
        8'h4D, 8'h6D: CODE = 8'b11001000; // M, m
        8'h4E, 8'h6E: CODE = 8'b10101011; // N, n
        8'h4F, 8'h6F: CODE = 8'b10100011; // O, o
        8'h50, 8'h70: CODE = 8'b10001100; // P, p
        8'h51, 8'h71: CODE = 8'b10011000; // Q, q
        8'h52, 8'h72: CODE = 8'b10101111; // R, r
        8'h53, 8'h73: CODE = 8'b10010010; // S, s
        8'h54, 8'h74: CODE = 8'b10000111; // T, t
        8'h55, 8'h75: CODE = 8'b11000001; // U, u
        8'h56, 8'h76: CODE = 8'b11100011; // V, v
        8'h57, 8'h77: CODE = 8'b10000001; // W, w
        8'h58, 8'h78: CODE = 8'b10001001; // X, x
        8'h59, 8'h79: CODE = 8'b10010001; // Y, y
        8'h5A, 8'h7A: CODE = 8'b10100100; // Z, z
        8'h20: CODE = 8'b11111111; // Space
        8'h2E: CODE = 8'b01111111; // Period
        default: CODE = 8'b11111111; // All segments off
    endcase
end

endmodule