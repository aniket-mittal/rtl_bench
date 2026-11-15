module origen_164521(
    input [3:0] SW,
    output reg [7:0] HEX0,
    output reg [7:0] HEX1
);

    parameter ZERO   = 8'b11000000;
    parameter ONE    = 8'b11111001;
    parameter TWO    = 8'b10100100;
    parameter THREE  = 8'b10110000;
    parameter FOUR   = 8'b10011001;
    parameter FIVE   = 8'b10010010;
    parameter SIX    = 8'b10000010;
    parameter SEVEN  = 8'b11111000;
    parameter EIGHT  = 8'b10000000;
    parameter NINE   = 8'b10010000;
    parameter A      = 8'b10001000;
    parameter B      = 8'b10000011;
    parameter C      = 8'b11000110;
    parameter D      = 8'b10100001;
    parameter E      = 8'b10000110;
    parameter F      = 8'b10001110;

    [MASKED]

endmodule