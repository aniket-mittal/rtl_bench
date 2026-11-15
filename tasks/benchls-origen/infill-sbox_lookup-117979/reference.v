module origen_117979(
    input [5:0] in_6bit,
    output [3:0] out_4bit
);

    wire [3:0] col;
    wire [1:0] row;
    reg [3:0] temp_out;

    assign col = in_6bit[4:1];
    assign row = {in_6bit[5], in_6bit[0]};
    assign out_4bit = temp_out;

    always @* begin
        case(row)
            2'b00: begin
                case(col)
                    4'b0000: temp_out = 4'd15;
                    4'b0001: temp_out = 4'd1;
                    4'b0010: temp_out = 4'd8;
                    4'b0011: temp_out = 4'd14;
                    4'b0100: temp_out = 4'd6;
                    4'b0101: temp_out = 4'd11;
                    4'b0110: temp_out = 4'd3;
                    4'b0111: temp_out = 4'd4;
                    4'b1000: temp_out = 4'd9;
                    4'b1001: temp_out = 4'd7;
                    4'b1010: temp_out = 4'd2;
                    4'b1011: temp_out = 4'd13;
                    4'b1100: temp_out = 4'd12;
                    4'b1101: temp_out = 4'd0;
                    4'b1110: temp_out = 4'd5;
                    4'b1111: temp_out = 4'd10;
                endcase
            end
            2'b01: begin
                case(col)
                    4'b0000: temp_out = 4'd3;
                    4'b0001: temp_out = 4'd13;
                    4'b0010: temp_out = 4'd4;
                    4'b0011: temp_out = 4'd7;
                    4'b0100: temp_out = 4'd15;
                    4'b0101: temp_out = 4'd2;
                    4'b0110: temp_out = 4'd8;
                    4'b0111: temp_out = 4'd14;
                    4'b1000: temp_out = 4'd12;
                    4'b1001: temp_out = 4'd0;
                    4'b1010: temp_out = 4'd1;
                    4'b1011: temp_out = 4'd10;
                    4'b1100: temp_out = 4'd6;
                    4'b1101: temp_out = 4'd9;
                    4'b1110: temp_out = 4'd11;
                    4'b1111: temp_out = 4'd5;
                endcase
            end
            2'b10: begin
                case(col)
                    4'b0000: temp_out = 4'd0;
                    4'b0001: temp_out = 4'd14;
                    4'b0010: temp_out = 4'd7;
                    4'b0011: temp_out = 4'd11;
                    4'b0100: temp_out = 4'd10;
                    4'b0101: temp_out = 4'd4;
                    4'b0110: temp_out = 4'd13;
                    4'b0111: temp_out = 4'd1;
                    4'b1000: temp_out = 4'd5;
                    4'b1001: temp_out = 4'd8;
                    4'b1010: temp_out = 4'd12;
                    4'b1011: temp_out = 4'd6;
                    4'b1100: temp_out = 4'd9;
                    4'b1101: temp_out = 4'd3;
                    4'b1110: temp_out = 4'd2;
                    4'b1111: temp_out = 4'd15;
                endcase
            end
            2'b11: begin
                case(col)
                    4'b0000: temp_out = 4'd13;
                    4'b0001: temp_out = 4'd8;
                    4'b0010: temp_out = 4'd10;
                    4'b0011: temp_out = 4'd1;
                    4'b0100: temp_out = 4'd3;
                    4'b0101: temp_out = 4'd15;
                    4'b0110: temp_out = 4'd4;
                    4'b0111: temp_out = 4'd2;
                    4'b1000: temp_out = 4'd11;
                    4'b1001: temp_out = 4'd6;
                    4'b1010: temp_out = 4'd7;
                    4'b1011: temp_out = 4'd12;
                    4'b1100: temp_out = 4'd0;
                    4'b1101: temp_out = 4'd5;
                    4'b1110: temp_out = 4'd14;
                    4'b1111: temp_out = 4'd9;
                endcase
            end
            default: temp_out = 4'd0;
        endcase
    end

endmodule