module origen_063356(
    input [1:0] AN_count,
    input [3:0] CNT0_1s, CNT1s, CNT1m, CNT1h,
    input [2:0] CNT10s, CNT10m,
    input [1:0] CNT10h,
    input sw,
    output [3:0] AN,
    output [0:6] LED
);

    reg [3:0] AN_temp;
    reg [3:0] digit;
    reg [0:6] LED_temp;

    [MASKED]

    always @(*) begin
        case(AN_count)
            2'b00: AN_temp = 4'b1110;
            2'b01: AN_temp = 4'b1101;
            2'b10: AN_temp = 4'b1011;
            2'b11: AN_temp = 4'b0111;
        endcase
    end

    always @(*) begin
        case({sw, AN_count})
            3'b000: digit = CNT1m;
            3'b001: digit = CNT10m;
            3'b010: digit = CNT1h;
            3'b011: digit = {2'b0, CNT10h};
            3'b100: digit = CNT0_1s;
            3'b101: digit = CNT1s;
            3'b110: digit = {1'b0, CNT10s};
            3'b111: digit = CNT1m;
        endcase
    end

    assign AN = AN_temp;
    assign LED = LED_temp;

endmodule