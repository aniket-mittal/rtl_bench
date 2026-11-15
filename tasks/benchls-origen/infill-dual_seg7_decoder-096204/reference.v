module origen_096204(
    input [3:0] LEDt,
    input [3:0] LEDc,
    output reg [7:0] ledst,
    output reg [7:0] ledsc
);

    always @* begin
        case(LEDt)
            4'h0: ledst = 8'b11000000;
            4'h1: ledst = 8'b11111001;
            4'h2: ledst = 8'b10100100;
            4'h3: ledst = 8'b10110000;
            4'h4: ledst = 8'b10011001;
            4'h5: ledst = 8'b10010010;
            4'h6: ledst = 8'b10000010;
            4'h7: ledst = 8'b11111000;
            4'h8: ledst = 8'b10000000;
            4'h9: ledst = 8'b10010000;
            4'hA: ledst = 8'b10000111;
            4'hB: ledst = 8'b10000011;
            4'hC: ledst = 8'b11000110;
            4'hD: ledst = 8'b10100001;
            4'hE: ledst = 8'b10000110;
            4'hF: ledst = 8'b10001110;
            default: ledst = 8'b10001110;
        endcase
    end

    always @* begin
        case(LEDc)
            4'h0: ledsc = 8'b11000000;
            4'h1: ledsc = 8'b11111001;
            4'h2: ledsc = 8'b10100100;
            4'h3: ledsc = 8'b10110000;
            4'h4: ledsc = 8'b10011001;
            4'h5: ledsc = 8'b10010010;
            4'h6: ledsc = 8'b10000010;
            4'h7: ledsc = 8'b11111000;
            4'h8: ledsc = 8'b10000000;
            4'h9: ledsc = 8'b10010000;
            4'hA: ledsc = 8'b10001000;
            4'hB: ledsc = 8'b10000011;
            4'hC: ledsc = 8'b11000110;
            4'hD: ledsc = 8'b10100001;
            4'hE: ledsc = 8'b10000110;
            4'hF: ledsc = 8'b10001110;
            default: ledsc = 8'b10001110;
        endcase
    end

endmodule