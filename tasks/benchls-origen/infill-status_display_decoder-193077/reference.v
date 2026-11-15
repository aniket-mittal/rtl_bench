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

always @(*) begin
    case (state)
        4'b0000: begin
            digit_0 = char_;
            digit_1 = char_;
            digit_2 = char_;
            digit_3 = char_;
        end
        4'b0001: begin
            digit_0 = char_U;
            digit_1 = char_U;
            digit_2 = char_;
            digit_3 = char_1;
        end
        4'b0010: begin
            digit_0 = char_P;
            digit_1 = char_D;
            digit_2 = char_N;
            digit_3 = char_2;
        end
        4'b0011: begin
            digit_0 = char_L;
            digit_1 = char_F;
            digit_2 = char_R;
            digit_3 = char_3;
        end
        4'b0100: begin
            digit_0 = char_H;
            digit_1 = char_0;
            digit_2 = char_4;
            digit_3 = char_;
        end
        4'b0101: begin
            digit_0 = char_1;
            digit_1 = char_5;
            digit_2 = char_;
            digit_3 = char_;
        end
        4'b0110: begin
            digit_0 = char_2;
            digit_1 = char_6;
            digit_2 = char_;
            digit_3 = char_;
        end
        4'b0111: begin
            digit_0 = char_9;
            digit_1 = char_7;
            digit_2 = char_;
            digit_3 = char_;
        end
        4'b1000: begin
            digit_0 = char_0;
            digit_1 = char_8;
            digit_2 = char_;
            digit_3 = char_;
        end
        4'b1001: begin
            digit_0 = char_9;
            digit_1 = char_9;
            digit_2 = char_;
            digit_3 = char_;
        end
        default: begin
            digit_0 = char_;
            digit_1 = char_;
            digit_2 = char_;
            digit_3 = char_;
        end
    endcase
end

endmodule