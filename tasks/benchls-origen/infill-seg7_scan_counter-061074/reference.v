module origen_061074(
    input CLK_50M,
    input RST_N,
    output reg [7:0] SEG_DATA,
    output reg [5:0] SEG_EN
);

    parameter SET_TIME_10MS = 500000;

    reg [15:0] time_cnt;
    reg [2:0] led_cnt;

    always @(posedge CLK_50M or negedge RST_N) begin
        if (!RST_N) begin
            time_cnt <= 16'd0;
            led_cnt <= 3'd0;
        end else begin
            if (time_cnt == SET_TIME_10MS - 1) begin
                time_cnt <= 16'd0;
                if (led_cnt == 3'd5)
                    led_cnt <= 3'd0;
                else
                    led_cnt <= led_cnt + 1'b1;
            end else begin
                time_cnt <= time_cnt + 1'b1;
            end
        end
    end

    always @(*) begin
        case (led_cnt)
            3'd0: SEG_DATA = 8'b00111111;
            3'd1: SEG_DATA = 8'b00000110;
            3'd2: SEG_DATA = 8'b01011011;
            3'd3: SEG_DATA = 8'b01001111;
            3'd4: SEG_DATA = 8'b01100110;
            3'd5: SEG_DATA = 8'b01101101;
            default: SEG_DATA = 8'b10111111;
        endcase
    end

    always @(*) begin
        case (led_cnt)
            3'd0: SEG_EN = 6'b111110;
            3'd1: SEG_EN = 6'b111101;
            3'd2: SEG_EN = 6'b111011;
            3'd3: SEG_EN = 6'b110111;
            3'd4: SEG_EN = 6'b101111;
            3'd5: SEG_EN = 6'b011111;
            default: SEG_EN = 6'b111111;
        endcase
    end

endmodule