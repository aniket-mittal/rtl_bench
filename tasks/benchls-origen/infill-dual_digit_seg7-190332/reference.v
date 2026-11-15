module origen_190332(
    input [7:0] number,
    output [6:0] hex0,
    output [6:0] hex1
);

parameter ZERO = 7'b1000000;
parameter ONE = 7'b1111001;
parameter TWO = 7'b0100100;
parameter THREE = 7'b0110000;
parameter FOUR = 7'b0011001;
parameter FIVE = 7'b0010010;
parameter SIX = 7'b0000010;
parameter SEVEN = 7'b1111000;
parameter EIGHT = 7'b0000000;
parameter NINE = 7'b0010000;

reg [6:0] ones, tens;

always @(*) begin
    ones = ZERO;
    tens = ZERO;

    case (number % 10)
        0: ones = ZERO;
        1: ones = ONE;
        2: ones = TWO;
        3: ones = THREE;
        4: ones = FOUR;
        5: ones = FIVE;
        6: ones = SIX;
        7: ones = SEVEN;
        8: ones = EIGHT;
        9: ones = NINE;
        default: ones = ZERO;
    endcase

    case (number / 10)
        0: tens = ZERO;
        1: tens = ONE;
        2: tens = TWO;
        3: tens = THREE;
        4: tens = FOUR;
        5: tens = FIVE;
        6: tens = SIX;
        7: tens = SEVEN;
        8: tens = EIGHT;
        9: tens = NINE;
        default: tens = ZERO;
    endcase
end

assign hex0 = ones;
assign hex1 = tens;

endmodule