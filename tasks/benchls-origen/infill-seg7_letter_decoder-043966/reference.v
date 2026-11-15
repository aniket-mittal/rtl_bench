module origen_043966(
    input [4:0] enter,
    input letter,
    output reg [6:0] display
);

always @(enter) begin
    if (letter) begin
        case (enter)
            5'd0: display = 7'b1110111;
            5'd1: display = 7'b0011111;
            5'd2: display = 7'b1011011;
            5'd3: display = 7'b1001111;
            5'd4: display = 7'b0111110;
            5'd5: display = 7'b1111001;
            5'd6: display = 7'b1110001;
            5'd7: display = 7'b0011111;
            5'd8: display = 7'b1111111;
            5'd9: display = 7'b1111011;
            5'd10: display = 7'b1111110;
            5'd11: display = 7'b1110001;
            5'd12: display = 7'b1010001;
            5'd13: display = 7'b1011110;
            5'd14: display = 7'b1111001;
            5'd15: display = 7'b1110001;
            5'd16: display = 7'b1111011;
            5'd17: display = 7'b1110111;
            5'd18: display = 7'b1111001;
            5'd19: display = 7'b0011111;
            5'd20: display = 7'b1011110;
            5'd21: display = 7'b1111110;
            5'd22: display = 7'b1101101;
            5'd23: display = 7'b1101101;
            5'd24: display = 7'b1111011;
            5'd25: display = 7'b1101110;
            5'd26: display = 7'b1011011;
            5'd27: display = 7'b1001111;
            5'd28: display = 7'b1010000;
            5'd29: display = 7'b1000100;
            5'd30: display = 7'b1001000;
            5'd31: display = 7'b1100000;
            default: display = 7'bxxxxxxx;
        endcase
    end
    else begin
        display = 7'b1111110;
    end
end

endmodule