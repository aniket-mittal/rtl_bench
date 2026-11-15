module SEG7_LUT(
    output [6:0] oSEG,
    input  [3:0] iDIG
);
    reg [6:0] seg_data;
    always @(*) begin
        case(iDIG)
            4'h0: seg_data = 7'b1000000;
            4'h1: seg_data = 7'b1111001;
            4'h2: seg_data = 7'b0100100;
            4'h3: seg_data = 7'b0110000;
            4'h4: seg_data = 7'b0011001;
            4'h5: seg_data = 7'b0010010;
            4'h6: seg_data = 7'b0000010;
            4'h7: seg_data = 7'b1111000;
            4'h8: seg_data = 7'b0000000;
            4'h9: seg_data = 7'b0011000;
            4'hA: seg_data = 7'b0001000;
            4'hB: seg_data = 7'b0000011;
            4'hC: seg_data = 7'b1000110;
            4'hD: seg_data = 7'b0100001;
            4'hE: seg_data = 7'b0000110;
            4'hF: seg_data = 7'b0001110;
            default: seg_data = 7'b1111111;
        endcase
    end
    assign oSEG = seg_data;
endmodule