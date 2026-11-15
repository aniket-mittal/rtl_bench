module origen_054772 (
    input [3:0] seconds_ones,
    input [3:0] seconds_tens,
    input [3:0] minutes,
    output reg [6:0] seconds_ones_out,
    output reg [6:0] seconds_tens_out,
    output reg [6:0] minutes_out
);

    always @(*) begin
        case (seconds_ones)
            4'd0: seconds_ones_out = 7'b0000001;
            4'd1: seconds_ones_out = 7'b1001111;
            4'd2: seconds_ones_out = 7'b0010010;
            4'd3: seconds_ones_out = 7'b0000110;
            4'd4: seconds_ones_out = 7'b1001100;
            4'd5: seconds_ones_out = 7'b0100100;
            4'd6: seconds_ones_out = 7'b0100000;
            4'd7: seconds_ones_out = 7'b0001101;
            4'd8: seconds_ones_out = 7'b0000000;
            4'd9: seconds_ones_out = 7'b0000100;
            default: seconds_ones_out = 7'b1111111;
        endcase
    end

    always @(*) begin
        case (seconds_tens)
            4'd0: seconds_tens_out = 7'b0000001;
            4'd1: seconds_tens_out = 7'b1001111;
            4'd2: seconds_tens_out = 7'b0010010;
            4'd3: seconds_tens_out = 7'b0000110;
            4'd4: seconds_tens_out = 7'b1001100;
            4'd5: seconds_tens_out = 7'b0100100;
            default: seconds_tens_out = 7'b1111111;
        endcase
    end

    always @(*) begin
        case (minutes)
            4'd0: minutes_out = 7'b0000001;
            4'd1: minutes_out = 7'b1001111;
            4'd2: minutes_out = 7'b0010010;
            4'd3: minutes_out = 7'b0000110;
            4'd4: minutes_out = 7'b1001100;
            4'd5: minutes_out = 7'b0100100;
            4'd6: minutes_out = 7'b0100000;
            4'd7: minutes_out = 7'b0001101;
            4'd8: minutes_out = 7'b0000000;
            4'd9: minutes_out = 7'b0000100;
            default: minutes_out = 7'b1111111;
        endcase
    end

endmodule