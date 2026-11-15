module origen_085400(
    input [3:0] sec_ones,
    input [3:0] sec_tens,
    input [3:0] min,
    output reg [6:0] sec_ones_segs,
    output reg [6:0] sec_tens_segs,
    output reg [6:0] min_segs
);

    always @(*) begin
        case(sec_ones)
            4'd0: sec_ones_segs = 7'b0000001;
            4'd1: sec_ones_segs = 7'b1001111;
            4'd2: sec_ones_segs = 7'b0010010;
            4'd3: sec_ones_segs = 7'b0000110;
            4'd4: sec_ones_segs = 7'b1001100;
            4'd5: sec_ones_segs = 7'b0100100;
            4'd6: sec_ones_segs = 7'b0100000;
            4'd7: sec_ones_segs = 7'b0001111;
            4'd8: sec_ones_segs = 7'b0000000;
            4'd9: sec_ones_segs = 7'b0000100;
            default: sec_ones_segs = 7'bXXXXXXX;
        endcase
    end

    always @(*) begin
        case(sec_tens)
            4'd0: sec_tens_segs = 7'b0000001;
            4'd1: sec_tens_segs = 7'b1001111;
            4'd2: sec_tens_segs = 7'b0010010;
            4'd3: sec_tens_segs = 7'b0000110;
            4'd4: sec_tens_segs = 7'b1001100;
            4'd5: sec_tens_segs = 7'b0100100;
            default: sec_tens_segs = 7'bXXXXXXX;
        endcase
    end

    always @(*) begin
        case(min)
            4'd0: min_segs = 7'b0000001;
            4'd1: min_segs = 7'b1001111;
            4'd2: min_segs = 7'b0010010;
            4'd3: min_segs = 7'b0000110;
            4'd4: min_segs = 7'b1001100;
            4'd5: min_segs = 7'b0100100;
            4'd6: min_segs = 7'b0100000;
            4'd7: min_segs = 7'b0001111;
            4'd8: min_segs = 7'b0000000;
            4'd9: min_segs = 7'b0000100;
            default: min_segs = 7'bXXXXXXX;
        endcase
    end

endmodule