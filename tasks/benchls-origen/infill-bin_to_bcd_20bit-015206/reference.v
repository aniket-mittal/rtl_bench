module origen_015206 (
    input [19:0] score,
    output reg [3:0] hundred_thousands,
    output reg [3:0] ten_thousands,
    output reg [3:0] thousands,
    output reg [3:0] hundreds,
    output reg [3:0] tens,
    output reg [3:0] ones
);

    integer i;

    always @(*) begin
        // Initialize BCD output registers
        hundred_thousands = 4'd0;
        ten_thousands = 4'd0;
        thousands = 4'd0;
        hundreds = 4'd0;
        tens = 4'd0;
        ones = 4'd0;

        // Iterate through all bits of input
        for (i = 19; i >= 0; i = i - 1) begin
            // Add 3 to columns >= 5
            if (hundred_thousands >= 5)
                hundred_thousands = hundred_thousands + 3;
            if (ten_thousands >= 5)
                ten_thousands = ten_thousands + 3;
            if (thousands >= 5)
                thousands = thousands + 3;
            if (hundreds >= 5)
                hundreds = hundreds + 3;
            if (tens >= 5)
                tens = tens + 3;
            if (ones >= 5)
                ones = ones + 3;

            // Shift left one bit
            hundred_thousands = hundred_thousands << 1;
            hundred_thousands[0] = ten_thousands[3];
            ten_thousands = ten_thousands << 1;
            ten_thousands[0] = thousands[3];
            thousands = thousands << 1;
            thousands[0] = hundreds[3];
            hundreds = hundreds << 1;
            hundreds[0] = tens[3];
            tens = tens << 1;
            tens[0] = ones[3];
            ones = ones << 1;
            ones[0] = score[i];
        end
    end

endmodule