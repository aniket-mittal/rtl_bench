// Seven-Segment Display Decoder Module
module origen_016040(
    input [3:0] inp,
    output reg [6:0] out
);

always @(*) begin
    case(inp)
        4'h0: out = 7'b1111110; // 0
        4'h1: out = 7'b0110000; // 1
        4'h2: out = 7'b1101101; // 2
        4'h3: out = 7'b1111001; // 3
        4'h4: out = 7'b0110011; // 4
        4'h5: out = 7'b1011011; // 5
        4'h6: out = 7'b1011111; // 6
        4'h7: out = 7'b1110000; // 7
        4'h8: out = 7'b1111111; // 8
        4'h9: out = 7'b1111011; // 9
        4'hA: out = 7'b1110111; // A
        4'hB: out = 7'b0011111; // B
        4'hC: out = 7'b1001110; // C
        4'hD: out = 7'b0111101; // D
        4'hE: out = 7'b1001111; // E
        4'hF: out = 7'b1000111; // F
        default: out = 7'b0000000; // All segments off
    endcase
end

endmodule

// Testbench
