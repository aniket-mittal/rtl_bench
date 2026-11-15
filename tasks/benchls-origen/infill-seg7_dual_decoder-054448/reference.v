module origen_054448(
    input [3:0] digit0,
    input [3:0] digit1,
    output reg [6:0] LSD,
    output reg [6:0] MSD
);

    always @* begin
        case(digit0)
            4'h0: LSD = 7'b1000000;
            4'h1: LSD = 7'b1111001;
            4'h2: LSD = 7'b0100100;
            4'h3: LSD = 7'b0110000;
            4'h4: LSD = 7'b0011001;
            4'h5: LSD = 7'b0010010;
            4'h6: LSD = 7'b0000010;
            4'h7: LSD = 7'b1111000;
            4'h8: LSD = 7'b0000000;
            4'h9: LSD = 7'b0010000;
            4'hA: LSD = 7'b0001000;
            4'hB: LSD = 7'b0000011;
            4'hC: LSD = 7'b1000110;
            4'hD: LSD = 7'b0100001;
            4'hE: LSD = 7'b0000110;
            4'hF: LSD = 7'b0001110;
            default: LSD = 7'b1111111;
        endcase
    end

    always @* begin
        case(digit1)
            4'h0: MSD = 7'b1000000;
            4'h1: MSD = 7'b1111001;
            4'h2: MSD = 7'b0100100;
            4'h3: MSD = 7'b0110000;
            4'h4: MSD = 7'b0011001;
            4'h5: MSD = 7'b0010010;
            4'h6: MSD = 7'b0000010;
            4'h7: MSD = 7'b1111000;
            4'h8: MSD = 7'b0000000;
            4'h9: MSD = 7'b0010000;
            4'hA: MSD = 7'b0001000;
            4'hB: MSD = 7'b0000011;
            4'hC: MSD = 7'b1000110;
            4'hD: MSD = 7'b0100001;
            4'hE: MSD = 7'b0000110;
            4'hF: MSD = 7'b0001110;
            default: MSD = 7'b1111111;
        endcase
    end

endmodule