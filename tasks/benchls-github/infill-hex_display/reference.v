module hex_display #(
    parameter INVERT = 0
)
(
    input  wire [3:0] in,
    input  wire       enable,

    output wire [6:0] out
);

reg [6:0] enc;

always @* begin
    enc <= 7'b0000000;
    if (enable) begin
        case (in)
            4'h0: enc <= 7'b0111111;
            4'h1: enc <= 7'b0000110;
            4'h2: enc <= 7'b1011011;
            4'h3: enc <= 7'b1001111;
            4'h4: enc <= 7'b1100110;
            4'h5: enc <= 7'b1101101;
            4'h6: enc <= 7'b1111101;
            4'h7: enc <= 7'b0000111;
            4'h8: enc <= 7'b1111111;
            4'h9: enc <= 7'b1101111;
            4'ha: enc <= 7'b1110111;
            4'hb: enc <= 7'b1111100;
            4'hc: enc <= 7'b0111001;
            4'hd: enc <= 7'b1011110;
            4'he: enc <= 7'b1111001;
            4'hf: enc <= 7'b1110001;
        endcase
    end
end

assign out = INVERT ? ~enc : enc;

endmodule