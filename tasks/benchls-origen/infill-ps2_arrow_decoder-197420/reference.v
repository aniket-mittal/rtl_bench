module origen_197420(
    input clk,
    input rst_n,
    input ps2_data,
    input ps2_clk,
    output reg left,
    output reg down,
    output reg right,
    output reg up
);

reg [21:0] data_temp;
reg ps2clk_neg, left_temp, down_temp, right_temp, up_temp;
reg left_neg, down_neg, right_neg, up_neg;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        data_temp <= 22'b0;
        ps2clk_neg <= 1'b0;
        left_temp <= 1'b0;
        down_temp <= 1'b0;
        right_temp <= 1'b0;
        up_temp <= 1'b0;
        left <= 1'b0;
        down <= 1'b0;
        right <= 1'b0;
        up <= 1'b0;
    end
    else begin
        ps2clk_neg <= ps2_clk;
        left_temp <= data_temp[9:0] == 10'h075;
        down_temp <= data_temp[9:0] == 10'h072;
        right_temp <= data_temp[9:0] == 10'h074;
        up_temp <= data_temp[9:0] == 10'h073;

        left_neg <= left_temp & ~ps2clk_neg;
        down_neg <= down_temp & ~ps2clk_neg;
        right_neg <= right_temp & ~ps2clk_neg;
        up_neg <= up_temp & ~ps2clk_neg;

        if (left_neg | down_neg | right_neg | up_neg) begin
            data_temp <= 22'b0;
        end
        else begin
            data_temp <= {data_temp[20:0], ps2_data};
        end

        left <= left_temp;
        down <= down_temp;
        right <= right_temp;
        up <= up_temp;
    end
end

endmodule