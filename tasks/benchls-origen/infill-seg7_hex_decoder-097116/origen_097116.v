module origen_097116 (
    input wire CLK,
    input wire RST,
    input wire [7:0] in,
    output reg [7:0] HEXHigh,
    output reg [7:0] HEXLow
);

    always @* begin
        case (in[3:0])
            4'h0: HEXLow = 8'b11000000;
            4'h1: HEXLow = 8'b11111001;
            4'h2: HEXLow = 8'b10100100;
            4'h3: HEXLow = 8'b10110000;
            4'h4: HEXLow = 8'b10011001;
            4'h5: HEXLow = 8'b10010010;
            4'h6: HEXLow = 8'b10000010;
            4'h7: HEXLow = 8'b11111000;
            4'h8: HEXLow = 8'b10000000;
            4'h9: HEXLow = 8'b10010000;
            4'hA: HEXLow = 8'b10001000;
            4'hB: HEXLow = 8'b10000011;
            4'hC: HEXLow = 8'b11000110;
            4'hD: HEXLow = 8'b10100001;
            4'hE: HEXLow = 8'b10000110;
            4'hF: HEXLow = 8'b10001110;
            default: HEXLow = 8'b11111111;
        endcase
    end

    [MASKED]

endmodule