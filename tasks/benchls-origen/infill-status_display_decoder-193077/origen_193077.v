module origen_193077(
    input [3:0] state,
    output reg [6:0] digit_0,
    output reg [6:0] digit_1,
    output reg [6:0] digit_2,
    output reg [6:0] digit_3
);

parameter char_U = 7'b1000001;
parameter char_P = 7'b1000000;
parameter char_D = 7'b0100001;
parameter char_N = 7'b0100101;
parameter char_L = 7'b0000111;
parameter char_F = 7'b0001100;
parameter char_R = 7'b0001001;
parameter char_H = 7'b0000010;
parameter char_0 = 7'b1000000;
parameter char_1 = 7'b1111001;
parameter char_2 = 7'b0100100;
parameter char_3 = 7'b0110000;
parameter char_4 = 7'b0011001;
parameter char_5 = 7'b0010010;
parameter char_6 = 7'b0000010;
parameter char_7 = 7'b1111000;
parameter char_8 = 7'b0000000;
parameter char_9 = 7'b0010000;
parameter char_   = 7'b0000000;

[MASKED]

endmodule