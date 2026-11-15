module origen_117048(
    input [3:0] kpr,
    input [3:0] kpc,
    output reg [3:0] num,
    output reg kphit
);

always @(*) begin
    kphit = 0;
    num = 4'b0000;
    
    if (kpr != 4'b1111) begin
        kphit = 1;
        case (kpr)
            4'b1110: begin
                case (kpc)
                    4'b0111: num = 4'd1;
                    4'b1011: num = 4'd2;
                    4'b1101: num = 4'd3;
                    4'b1110: num = 4'd10;
                endcase
            end
            4'b1101: begin
                case (kpc)
                    4'b0111: num = 4'd4;
                    4'b1011: num = 4'd5;
                    4'b1101: num = 4'd6;
                    4'b1110: num = 4'd11;
                endcase
            end
            4'b1011: begin
                case (kpc)
                    4'b0111: num = 4'd7;
                    4'b1011: num = 4'd8;
                    4'b1101: num = 4'd9;
                    4'b1110: num = 4'd12;
                endcase
            end
            4'b0111: begin
                case (kpc)
                    4'b0111: num = 4'd14;
                    4'b1011: num = 4'd0;
                    4'b1101: num = 4'd15;
                    4'b1110: num = 4'd13;
                endcase
            end
        endcase
    end
end

endmodule