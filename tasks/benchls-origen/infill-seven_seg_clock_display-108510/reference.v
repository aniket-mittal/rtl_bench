module origen_108510 (
    input [4:0] h,
    input [5:0] m, s,
    input dot,
    output reg [7:0] led0, led1, led2, led3, led4, led5
);

    // LED patterns for digits 0-9 and off state
    localparam [7:0] led_dig_0 = 8'b11000000;
    localparam [7:0] led_dig_1 = 8'b11111001;
    localparam [7:0] led_dig_2 = 8'b10100100;
    localparam [7:0] led_dig_3 = 8'b10110000;
    localparam [7:0] led_dig_4 = 8'b10011001;
    localparam [7:0] led_dig_5 = 8'b10010010;
    localparam [7:0] led_dig_6 = 8'b10000010;
    localparam [7:0] led_dig_7 = 8'b11111000;
    localparam [7:0] led_dig_8 = 8'b10000000;
    localparam [7:0] led_dig_9 = 8'b10010000;
    localparam [7:0] led_off = 8'b11111111;

    always @* begin
        // Seconds ones digit
        case (s % 10)
            0: led0 = led_dig_0;
            1: led0 = led_dig_1;
            2: led0 = led_dig_2;
            3: led0 = led_dig_3;
            4: led0 = led_dig_4;
            5: led0 = led_dig_5;
            6: led0 = led_dig_6;
            7: led0 = led_dig_7;
            8: led0 = led_dig_8;
            9: led0 = led_dig_9;
            default: led0 = led_off;
        endcase

        // Seconds tens digit
        case (s / 10)
            0: led1 = led_dig_0;
            1: led1 = led_dig_1;
            2: led1 = led_dig_2;
            3: led1 = led_dig_3;
            4: led1 = led_dig_4;
            5: led1 = led_dig_5;
            default: led1 = led_off;
        endcase

        // Minutes ones digit
        case (m % 10)
            0: led2 = led_dig_0;
            1: led2 = led_dig_1;
            2: led2 = led_dig_2;
            3: led2 = led_dig_3;
            4: led2 = led_dig_4;
            5: led2 = led_dig_5;
            6: led2 = led_dig_6;
            7: led2 = led_dig_7;
            8: led2 = led_dig_8;
            9: led2 = led_dig_9;
            default: led2 = led_off;
        endcase
        led2[7] = ~dot;  // Control dot for minutes

        // Minutes tens digit
        case (m / 10)
            0: led3 = led_dig_0;
            1: led3 = led_dig_1;
            2: led3 = led_dig_2;
            3: led3 = led_dig_3;
            4: led3 = led_dig_4;
            5: led3 = led_dig_5;
            default: led3 = led_off;
        endcase

        // Hours ones digit
        case (h % 10)
            0: led4 = led_dig_0;
            1: led4 = led_dig_1;
            2: led4 = led_dig_2;
            3: led4 = led_dig_3;
            4: led4 = led_dig_4;
            5: led4 = led_dig_5;
            6: led4 = led_dig_6;
            7: led4 = led_dig_7;
            8: led4 = led_dig_8;
            9: led4 = led_dig_9;
            default: led4 = led_off;
        endcase
        led4[7] = ~dot;  // Control dot for hours

        // Hours tens digit
        case (h / 10)
            0: led5 = led_off;
            1: led5 = led_dig_1;
            2: led5 = led_dig_2;
            default: led5 = led_off;
        endcase
    end

endmodule