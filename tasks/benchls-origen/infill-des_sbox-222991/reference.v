module origen_222991(
    input [5:0] right_xor_key_segment_din,
    output reg [3:0] sbox_dout
);

always @(*) begin
    case (right_xor_key_segment_din[5:4])
        2'b00: begin
            case (right_xor_key_segment_din[3:0])
                4'b0000: sbox_dout = 4'b1110;
                4'b0001: sbox_dout = 4'b0100;
                4'b0010: sbox_dout = 4'b1101;
                4'b0011: sbox_dout = 4'b0001;
                4'b0100: sbox_dout = 4'b0010;
                4'b0101: sbox_dout = 4'b1111;
                4'b0110: sbox_dout = 4'b1011;
                4'b0111: sbox_dout = 4'b1000;
                4'b1000: sbox_dout = 4'b0011;
                4'b1001: sbox_dout = 4'b1010;
                4'b1010: sbox_dout = 4'b0110;
                4'b1011: sbox_dout = 4'b1100;
                4'b1100: sbox_dout = 4'b0101;
                4'b1101: sbox_dout = 4'b1001;
                4'b1110: sbox_dout = 4'b0000;
                4'b1111: sbox_dout = 4'b1101;
            endcase
        end
        2'b01: begin
            case (right_xor_key_segment_din[3:0])
                4'b0000: sbox_dout = 4'b0100;
                4'b0001: sbox_dout = 4'b1101;
                4'b0010: sbox_dout = 4'b0001;
                4'b0011: sbox_dout = 4'b1010;
                4'b0100: sbox_dout = 4'b1011;
                4'b0101: sbox_dout = 4'b1000;
                4'b0110: sbox_dout = 4'b0110;
                4'b0111: sbox_dout = 4'b1100;
                4'b1000: sbox_dout = 4'b1111;
                4'b1001: sbox_dout = 4'b0000;
                4'b1010: sbox_dout = 4'b1110;
                4'b1011: sbox_dout = 4'b0101;
                4'b1100: sbox_dout = 4'b1001;
                4'b1101: sbox_dout = 4'b0011;
                4'b1110: sbox_dout = 4'b1010;
                4'b1111: sbox_dout = 4'b0111;
            endcase
        end
        2'b10: begin
            case (right_xor_key_segment_din[3:0])
                4'b0000: sbox_dout = 4'b1010;
                4'b0001: sbox_dout = 4'b0001;
                4'b0010: sbox_dout = 4'b1111;
                4'b0011: sbox_dout = 4'b1110;
                4'b0100: sbox_dout = 4'b1100;
                4'b0101: sbox_dout = 4'b0100;
                4'b0110: sbox_dout = 4'b0110;
                4'b0111: sbox_dout = 4'b1011;
                4'b1000: sbox_dout = 4'b0101;
                4'b1001: sbox_dout = 4'b1000;
                4'b1010: sbox_dout = 4'b0011;
                4'b1011: sbox_dout = 4'b1101;
                4'b1100: sbox_dout = 4'b0111;
                4'b1101: sbox_dout = 4'b1001;
                4'b1110: sbox_dout = 4'b1010;
                4'b1111: sbox_dout = 4'b0000;
            endcase
        end
        2'b11: begin
            case (right_xor_key_segment_din[3:0])
                4'b0000: sbox_dout = 4'b1111;
                4'b0001: sbox_dout = 4'b0000;
                4'b0010: sbox_dout = 4'b1110;
                4'b0011: sbox_dout = 4'b1001;
                4'b0100: sbox_dout = 4'b1010;
                4'b0101: sbox_dout = 4'b0100;
                4'b0110: sbox_dout = 4'b0001;
                4'b0111: sbox_dout = 4'b1011;
                4'b1000: sbox_dout = 4'b1100;
                4'b1001: sbox_dout = 4'b0110;
                4'b1010: sbox_dout = 4'b1101;
                4'b1011: sbox_dout = 4'b0111;
                4'b1100: sbox_dout = 4'b1000;
                4'b1101: sbox_dout = 4'b0101;
                4'b1110: sbox_dout = 4'b0011;
                4'b1111: sbox_dout = 4'b1010;
            endcase
        end
    endcase
end

endmodule