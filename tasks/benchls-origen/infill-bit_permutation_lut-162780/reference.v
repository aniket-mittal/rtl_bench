module origen_162780 (
    input [1:6] initial_bits,
    output reg [1:4] output_bits
);

always @(*) begin
    case ({initial_bits[1], initial_bits[6]})
        2'b00: begin
            case (initial_bits[2:5])
                4'b0000: output_bits = 4'b0001;
                4'b0001: output_bits = 4'b0010;
                4'b0010: output_bits = 4'b0011;
                4'b0011: output_bits = 4'b0100;
                4'b0100: output_bits = 4'b0101;
                4'b0101: output_bits = 4'b0110;
                4'b0110: output_bits = 4'b0111;
                4'b0111: output_bits = 4'b1000;
                4'b1000: output_bits = 4'b1001;
                4'b1001: output_bits = 4'b1010;
                4'b1010: output_bits = 4'b1011;
                4'b1011: output_bits = 4'b1100;
                4'b1100: output_bits = 4'b1101;
                4'b1101: output_bits = 4'b1110;
                4'b1110: output_bits = 4'b1111;
                4'b1111: output_bits = 4'b0000;
                default: output_bits = 4'b1111;
            endcase
        end
        2'b01: begin
            case (initial_bits[2:5])
                4'b0000: output_bits = 4'b1000;
                4'b0001: output_bits = 4'b1001;
                4'b0010: output_bits = 4'b1010;
                4'b0011: output_bits = 4'b1011;
                4'b0100: output_bits = 4'b1100;
                4'b0101: output_bits = 4'b1101;
                4'b0110: output_bits = 4'b1110;
                4'b0111: output_bits = 4'b1111;
                4'b1000: output_bits = 4'b0000;
                4'b1001: output_bits = 4'b0001;
                4'b1010: output_bits = 4'b0010;
                4'b1011: output_bits = 4'b0011;
                4'b1100: output_bits = 4'b0100;
                4'b1101: output_bits = 4'b0101;
                4'b1110: output_bits = 4'b0110;
                4'b1111: output_bits = 4'b0111;
                default: output_bits = 4'b1111;
            endcase
        end
        2'b10: begin
            case (initial_bits[2:5])
                4'b0000: output_bits = 4'b0100;
                4'b0001: output_bits = 4'b0101;
                4'b0010: output_bits = 4'b0110;
                4'b0011: output_bits = 4'b0111;
                4'b0100: output_bits = 4'b1000;
                4'b0101: output_bits = 4'b1001;
                4'b0110: output_bits = 4'b1010;
                4'b0111: output_bits = 4'b1011;
                4'b1000: output_bits = 4'b1100;
                4'b1001: output_bits = 4'b1101;
                4'b1010: output_bits = 4'b1110;
                4'b1011: output_bits = 4'b1111;
                4'b1100: output_bits = 4'b0000;
                4'b1101: output_bits = 4'b0001;
                4'b1110: output_bits = 4'b0010;
                4'b1111: output_bits = 4'b0011;
                default: output_bits = 4'b1111;
            endcase
        end
        2'b11: begin
            case (initial_bits[2:5])
                4'b0000: output_bits = 4'b1100;
                4'b0001: output_bits = 4'b1101;
                4'b0010: output_bits = 4'b1110;
                4'b0011: output_bits = 4'b1111;
                4'b0100: output_bits = 4'b0000;
                4'b0101: output_bits = 4'b0001;
                4'b0110: output_bits = 4'b0010;
                4'b0111: output_bits = 4'b0011;
                4'b1000: output_bits = 4'b0100;
                4'b1001: output_bits = 4'b0101;
                4'b1010: output_bits = 4'b0110;
                4'b1011: output_bits = 4'b0111;
                4'b1100: output_bits = 4'b1000;
                4'b1101: output_bits = 4'b1001;
                4'b1110: output_bits = 4'b1010;
                4'b1111: output_bits = 4'b1011;
                default: output_bits = 4'b1111;
            endcase
        end
        default: output_bits = 4'b1111;
    endcase
end

endmodule