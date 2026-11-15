module origen_026307(
    input [9:0] SW,
    output [6:0] HEX3, HEX2, HEX1, HEX0
);

    wire [5:0] addrOut0, addrOut1;
    reg [3:0] BCD0, BCD1, BCD2, BCD3;

    assign HEX3 = 7'b1111111; // All segments off

    assign addrOut0 = 2 * SW[3:0] + SW[5];
    assign addrOut1 = 2 * SW[9:6] + BCD1[0];

    always @(*) begin
        if (addrOut0 <= 9) begin
            BCD0 = addrOut0[3:0];
            BCD1 = 4'b0000;
        end else begin
            BCD0 = addrOut0 - 10;
            BCD1 = 4'b0001;
        end

        if (addrOut1 <= 9) begin
            BCD2 = addrOut1[3:0];
            BCD3 = 4'b0000;
        end else begin
            BCD2 = addrOut1 - 10;
            BCD3 = 4'b0001;
        end
    end

    bcdToSevSeg bcd2_display(.bcd(BCD2), .seg(HEX2));
    bcdToSevSeg bcd1_display(.bcd(BCD1), .seg(HEX1));
    bcdToSevSeg bcd0_display(.bcd(BCD0), .seg(HEX0));

endmodule

module bcdToSevSeg(
    input [3:0] bcd,
    output reg [6:0] seg
);

    [MASKED]

endmodule