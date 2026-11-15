module origen_094513 (
    input  wire [25:0] fraction,
    output reg  [25:0] result,
    output reg  [7:0]  shifted_amount
);

always @* begin
    casez (fraction)
        26'b1?????????????????????????: begin
            result = fraction;
            shifted_amount = 8'd0;
        end
        26'b01????????????????????????: begin
            result = {fraction[24:0], 1'b0};
            shifted_amount = 8'd1;
        end
        26'b001???????????????????????: begin
            result = {fraction[23:0], 2'b0};
            shifted_amount = 8'd2;
        end
        26'b0001??????????????????????: begin
            result = {fraction[22:0], 3'b0};
            shifted_amount = 8'd3;
        end
        26'b00001?????????????????????: begin
            result = {fraction[21:0], 4'b0};
            shifted_amount = 8'd4;
        end
        26'b000001????????????????????: begin
            result = {fraction[20:0], 5'b0};
            shifted_amount = 8'd5;
        end
        26'b0000001???????????????????: begin
            result = {fraction[19:0], 6'b0};
            shifted_amount = 8'd6;
        end
        26'b00000001??????????????????: begin
            result = {fraction[18:0], 7'b0};
            shifted_amount = 8'd7;
        end
        26'b000000001?????????????????: begin
            result = {fraction[17:0], 8'b0};
            shifted_amount = 8'd8;
        end
        26'b0000000001????????????????: begin
            result = {fraction[16:0], 9'b0};
            shifted_amount = 8'd9;
        end
        26'b00000000001???????????????: begin
            result = {fraction[15:0], 10'b0};
            shifted_amount = 8'd10;
        end
        26'b000000000001??????????????: begin
            result = {fraction[14:0], 11'b0};
            shifted_amount = 8'd11;
        end
        26'b0000000000001?????????????: begin
            result = {fraction[13:0], 12'b0};
            shifted_amount = 8'd12;
        end
        26'b00000000000001????????????: begin
            result = {fraction[12:0], 13'b0};
            shifted_amount = 8'd13;
        end
        26'b000000000000001???????????: begin
            result = {fraction[11:0], 14'b0};
            shifted_amount = 8'd14;
        end
        26'b0000000000000001??????????: begin
            result = {fraction[10:0], 15'b0};
            shifted_amount = 8'd15;
        end
        26'b00000000000000001?????????: begin
            result = {fraction[9:0], 16'b0};
            shifted_amount = 8'd16;
        end
        26'b000000000000000001????????: begin
            result = {fraction[8:0], 17'b0};
            shifted_amount = 8'd17;
        end
        26'b0000000000000000001???????: begin
            result = {fraction[7:0], 18'b0};
            shifted_amount = 8'd18;
        end
        26'b00000000000000000001??????: begin
            result = {fraction[6:0], 19'b0};
            shifted_amount = 8'd19;
        end
        26'b000000000000000000001?????: begin
            result = {fraction[5:0], 20'b0};
            shifted_amount = 8'd20;
        end
        26'b0000000000000000000001????: begin
            result = {fraction[4:0], 21'b0};
            shifted_amount = 8'd21;
        end
        26'b00000000000000000000001???: begin
            result = {fraction[3:0], 22'b0};
            shifted_amount = 8'd22;
        end
        26'b000000000000000000000001??: begin
            result = {fraction[2:0], 23'b0};
            shifted_amount = 8'd23;
        end
        26'b0000000000000000000000001?: begin
            result = {fraction[1:0], 24'b0};
            shifted_amount = 8'd24;
        end
        26'b00000000000000000000000001: begin
            result = {fraction[0], 25'b0};
            shifted_amount = 8'd25;
        end
        default: begin
            result = fraction;
            shifted_amount = 8'd0;
        end
    endcase
end

endmodule