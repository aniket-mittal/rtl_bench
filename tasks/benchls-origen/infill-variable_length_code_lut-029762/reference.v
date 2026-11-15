module origen_029762(
    input [5:0] data,
    output reg [4:0] code,
    output reg [2:0] width
);

always @(*) begin
    case(data)
        6'd0:  begin code = 5'b11111; width = 3'd5; end
        6'd1:  begin code = 5'b01111; width = 3'd5; end
        6'd2:  begin code = 5'b00111; width = 3'd5; end
        6'd3:  begin code = 5'b00011; width = 3'd5; end
        6'd4:  begin code = 5'b00001; width = 3'd5; end
        6'd5:  begin code = 5'b00000; width = 3'd5; end
        6'd6:  begin code = 5'b10000; width = 3'd5; end
        6'd7:  begin code = 5'b11000; width = 3'd5; end
        6'd8:  begin code = 5'b11100; width = 3'd5; end
        6'd9:  begin code = 5'b11110; width = 3'd5; end
        6'd10: begin code = 5'b01;    width = 3'd2; end
        6'd11: begin code = 5'b1000;  width = 3'd4; end
        6'd12: begin code = 5'b1010;  width = 3'd4; end
        6'd13: begin code = 5'b100;   width = 3'd3; end
        6'd14: begin code = 5'b0;     width = 3'd1; end
        6'd15: begin code = 5'b0010;  width = 3'd4; end
        6'd16: begin code = 5'b110;   width = 3'd3; end
        6'd17: begin code = 5'b0000;  width = 3'd4; end
        6'd18: begin code = 5'b00;    width = 3'd2; end
        6'd19: begin code = 5'b0111;  width = 3'd4; end
        6'd20: begin code = 5'b10;    width = 3'd2; end
        6'd21: begin code = 5'b0100;  width = 3'd4; end
        6'd22: begin code = 5'b11;    width = 3'd2; end
        6'd23: begin code = 5'b1001;  width = 3'd4; end
        6'd24: begin code = 5'b111;   width = 3'd3; end
        6'd25: begin code = 5'b0110;  width = 3'd4; end
        6'd26: begin code = 5'b1100;  width = 3'd4; end
        6'd27: begin code = 5'b010;   width = 3'd3; end
        6'd28: begin code = 5'b000;   width = 3'd3; end
        6'd29: begin code = 5'b1;     width = 3'd1; end
        6'd30: begin code = 5'b001;   width = 3'd3; end
        6'd31: begin code = 5'b0001;  width = 3'd4; end
        6'd32: begin code = 5'b011;   width = 3'd3; end
        6'd33: begin code = 5'b1011;  width = 3'd4; end
        6'd34: begin code = 5'b101;   width = 3'd3; end
        6'd35: begin code = 5'b1101;  width = 3'd4; end
        default: begin code = 5'b11111; width = 3'd5; end
    endcase
end

endmodule