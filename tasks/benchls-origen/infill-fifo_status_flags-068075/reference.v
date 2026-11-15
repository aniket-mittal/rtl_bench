module origen_068075 (
    input [7:0] diff_ptr,
    output reg full_flag,
    output reg empty_flag,
    output reg almost_empty,
    output reg almost_full,
    output reg half_flag
);

initial begin
    full_flag = 0;
    empty_flag = 0;
    almost_empty = 0;
    almost_full = 0;
    half_flag = 0;
end

always @(*) begin
    case (diff_ptr)
        8'b00000000: begin
            empty_flag = 1;
            almost_empty = 1;
            full_flag = 0;
            almost_full = 0;
            half_flag = 0;
        end
        8'b11111111: begin
            full_flag = 1;
            almost_full = 1;
            empty_flag = 0;
            almost_empty = 0;
            half_flag = 0;
        end
        8'b01111111: begin
            half_flag = 1;
            full_flag = 0;
            empty_flag = 0;
            almost_empty = 0;
            almost_full = 0;
        end
        8'b11111000,
        8'b11111001,
        8'b11111010,
        8'b11111011,
        8'b11111100,
        8'b11111101,
        8'b11111110: begin
            almost_full = 1;
            full_flag = 0;
            empty_flag = 0;
            almost_empty = 0;
            half_flag = 0;
        end
        8'b00000001,
        8'b00000010,
        8'b00000011,
        8'b00000100,
        8'b00000101,
        8'b00000110,
        8'b00000111: begin
            almost_empty = 1;
            full_flag = 0;
            empty_flag = 0;
            almost_full = 0;
            half_flag = 0;
        end
        default: begin
            full_flag = 0;
            empty_flag = 0;
            almost_empty = 0;
            almost_full = 0;
            half_flag = 0;
        end
    endcase
end

endmodule

