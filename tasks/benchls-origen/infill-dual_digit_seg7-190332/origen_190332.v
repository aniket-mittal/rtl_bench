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

[MASKED]

assign hex0 = ones;
assign hex1 = tens;

endmodule