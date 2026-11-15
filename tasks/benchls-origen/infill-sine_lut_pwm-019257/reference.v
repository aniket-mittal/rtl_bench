module origen_019257 (
    input wire fin_out,
    input wire rst_n,
    output reg [7:0] dout
);

reg [7:0] d;
reg [5:0] q;

always @(posedge fin_out or negedge rst_n) begin
    if (!rst_n) begin
        q <= 6'd0;
        dout <= 8'd0;
    end else begin
        q <= (q == 6'd63) ? 6'd0 : q + 1'b1;
        dout <= d;
    end
end

always @(*) begin
    case (q)
        6'd0: d = 8'd128;
        6'd1: d = 8'd140;
        6'd2: d = 8'd152;
        6'd3: d = 8'd165;
        6'd4: d = 8'd176;
        6'd5: d = 8'd188;
        6'd6: d = 8'd198;
        6'd7: d = 8'd208;
        6'd8: d = 8'd217;
        6'd9: d = 8'd224;
        6'd10: d = 8'd231;
        6'd11: d = 8'd236;
        6'd12: d = 8'd240;
        6'd13: d = 8'd242;
        6'd14: d = 8'd244;
        6'd15: d = 8'd244;
        6'd16: d = 8'd242;
        6'd17: d = 8'd240;
        6'd18: d = 8'd236;
        6'd19: d = 8'd231;
        6'd20: d = 8'd224;
        6'd21: d = 8'd217;
        6'd22: d = 8'd208;
        6'd23: d = 8'd198;
        6'd24: d = 8'd188;
        6'd25: d = 8'd176;
        6'd26: d = 8'd165;
        6'd27: d = 8'd152;
        6'd28: d = 8'd140;
        6'd29: d = 8'd128;
        6'd30: d = 8'd115;
        6'd31: d = 8'd103;
        6'd32: d = 8'd90;
        6'd33: d = 8'd79;
        6'd34: d = 8'd67;
        6'd35: d = 8'd57;
        6'd36: d = 8'd47;
        6'd37: d = 8'd38;
        6'd38: d = 8'd31;
        6'd39: d = 8'd24;
        6'd40: d = 8'd19;
        6'd41: d = 8'd15;
        6'd42: d = 8'd13;
        6'd43: d = 8'd11;
        6'd44: d = 8'd11;
        6'd45: d = 8'd13;
        6'd46: d = 8'd15;
        6'd47: d = 8'd19;
        6'd48: d = 8'd24;
        6'd49: d = 8'd31;
        6'd50: d = 8'd38;
        6'd51: d = 8'd47;
        6'd52: d = 8'd57;
        6'd53: d = 8'd67;
        6'd54: d = 8'd79;
        6'd55: d = 8'd90;
        6'd56: d = 8'd103;
        6'd57: d = 8'd115;
        6'd58: d = 8'd128;
        6'd59: d = 8'd140;
        6'd60: d = 8'd152;
        6'd61: d = 8'd165;
        6'd62: d = 8'd176;
        6'd63: d = 8'd188;
        default: d = 8'd128;
    endcase
end

endmodule