module origen_122978(
    input [3:0] kpr,
    input [3:0] kpc,
    output reg [3:0] buttons
);

always @(*) begin
    buttons = 4'b0000; // Default output

    case(kpr)
        4'b1110: begin
            case(kpc)
                4'b0111: buttons = 4'd3;
                4'b1011: buttons = 4'd2;
                4'b1101: buttons = 4'd1;
                4'b1110: buttons = 4'd0;
                default: buttons = 4'd0;
            endcase
        end
        4'b1101: begin
            case(kpc)
                4'b0111: buttons = 4'd7;
                4'b1011: buttons = 4'd6;
                4'b1101: buttons = 4'd5;
                4'b1110: buttons = 4'd4;
                default: buttons = 4'd0;
            endcase
        end
        4'b1011: begin
            case(kpc)
                4'b0111: buttons = 4'd11;
                4'b1011: buttons = 4'd10;
                4'b1101: buttons = 4'd9;
                4'b1110: buttons = 4'd8;
                default: buttons = 4'd0;
            endcase
        end
        4'b0111: begin
            case(kpc)
                4'b0111: buttons = 4'd15;
                4'b1011: buttons = 4'd14;
                4'b1101: buttons = 4'd13;
                4'b1110: buttons = 4'd12;
                default: buttons = 4'd0;
            endcase
        end
        default: buttons = 4'd0;
    endcase
end

endmodule