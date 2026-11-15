module origen_101552(
    input [15:0] displayValue,
    input [2:0] digitSelect,
    output reg [3:0] displayDigit,
    output reg [7:0] LEDs
);

    wire [3:0] thousands, hundreds, tens, ones;

    // Instantiate DigitSeparator
    DigitSeparator digit_separator (
        .value(displayValue),
        .thousands(thousands),
        .hundreds(hundreds),
        .tens(tens),
        .ones(ones)
    );

    // Instantiate FourToOneMux
    FourToOneMux four_to_one_mux (
        .thousands(thousands),
        .hundreds(hundreds),
        .tens(tens),
        .ones(ones),
        .select(digitSelect),
        .out(displayDigit)
    );

    // LED control logic
    always @(*) begin
        if (digitSelect == 3'b100) begin
            LEDs = displayValue[15:8];
        end else begin
            LEDs = 8'b0;
        end
    end

endmodule

module DigitSeparator(
    input [15:0] value,
    output reg [3:0] thousands,
    output reg [3:0] hundreds,
    output reg [3:0] tens,
    output reg [3:0] ones
);

    integer i;
    reg [15:0] temp;

    always @(*) begin
        temp = value;
        thousands = 4'd0;
        hundreds = 4'd0;
        tens = 4'd0;
        ones = 4'd0;

        for (i = 0; i < 16; i = i + 1) begin
            if (thousands >= 5)
                thousands = thousands + 3;
            if (hundreds >= 5)
                hundreds = hundreds + 3;
            if (tens >= 5)
                tens = tens + 3;
            if (ones >= 5)
                ones = ones + 3;

            thousands = thousands << 1;
            thousands[0] = hundreds[3];
            hundreds = hundreds << 1;
            hundreds[0] = tens[3];
            tens = tens << 1;
            tens[0] = ones[3];
            ones = ones << 1;
            ones[0] = temp[15];
            temp = temp << 1;
        end
    end

endmodule

module FourToOneMux(
    input [3:0] thousands,
    input [3:0] hundreds,
    input [3:0] tens,
    input [3:0] ones,
    input [2:0] select,
    output reg [3:0] out
);

    always @(*) begin
        case (select)
            3'b100: out = thousands;
            3'b011: out = hundreds;
            3'b001: out = tens;
            3'b000: out = ones;
            default: out = ones;
        endcase
    end

endmodule