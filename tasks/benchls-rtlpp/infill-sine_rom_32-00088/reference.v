module rtlpp_00088 (
    input clock,
    input res,
    output reg [4:0] counter_out,
    output reg [13:0] sin_out
);

always @(posedge res) begin
    counter_out <= 5'b00000;
    sin_out <= 14'b00000_00000_0000;
end

always @(posedge clock) begin
    if (counter_out != 29)
        counter_out <= counter_out + 1;
    else
        counter_out <= 0;

    case (counter_out)
        0: sin_out <= 14'b10011_01010_0111;
        1: sin_out <= 14'b10110_10000_0100;
        2: sin_out <= 14'b11001_01100_1111;
        3: sin_out <= 14'b11011_11100_1000;
        4: sin_out <= 14'b11101_11011_0110;
        5: sin_out <= 14'b11111_00110_1111;
        6: sin_out <= 14'b11111_11101_0011;
        7: sin_out <= 14'b11111_11101_0011;
        8: sin_out <= 14'b11111_00110_1111;
        9: sin_out <= 14'b11101_11011_0110;
        10: sin_out <= 14'b11011_11100_1000;
        11: sin_out <= 14'b11001_01100_1111;
        12: sin_out <= 14'b10110_10000_0100;
        13: sin_out <= 14'b10011_01010_0111;
        14: sin_out <= 14'b10000_00000_0000;
        15: sin_out <= 14'b01100_10101_1001;
        16: sin_out <= 14'b01001_01111_1100;
        17: sin_out <= 14'b00110_10011_0001;
        18: sin_out <= 14'b00100_00011_1000;
        19: sin_out <= 14'b00010_00100_1010;
        20: sin_out <= 14'b00000_11001_0001;
        21: sin_out <= 14'b00000_00010_1101;
        22: sin_out <= 14'b00000_00010_1101;
        23: sin_out <= 14'b00000_11001_0001;
        24: sin_out <= 14'b00010_00100_1010;
        25: sin_out <= 14'b00100_00011_1000;
        26: sin_out <= 14'b00110_10011_0001;
        27: sin_out <= 14'b01001_01111_1100;
        28: sin_out <= 14'b01100_10101_1001;
        default: sin_out <= 14'b00000_00000_0000;
    endcase
end

endmodule