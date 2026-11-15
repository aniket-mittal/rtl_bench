module origen_004926(
    input clk,
    input key,
    input reset,
    input sw,
    output reg [3:0] led,
    output reg [8:0] Count1,
    output reg [8:0] Count2
);

reg [3:0] count1, count2;
reg [23:0] cnt;
reg [18:0] debounce_cnt;
reg key_flag;

reg [8:0] num [9:0];

initial begin
    num[0] = 9'b0_0011_1111;
    num[1] = 9'b0_0000_0110;
    num[2] = 9'b0_0101_1011;
    num[3] = 9'b0_0100_1111;
    num[4] = 9'b0_0110_0110;
    num[5] = 9'b0_0110_1101;
    num[6] = 9'b0_0111_1101;
    num[7] = 9'b0_0000_0111;
    num[8] = 9'b0_0111_1111;
    num[9] = 9'b0_0110_1111;
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        cnt <= 24'd0;
    end else if (sw == 1'b0) begin
        if (cnt == 24'd12000000) begin
            cnt <= 24'd0;
        end else begin
            cnt <= cnt + 1'b1;
        end
    end else begin
        cnt <= 24'd0;
    end
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count1 <= 4'd0;
        count2 <= 4'd0;
        key_flag <= 1'b0;
        debounce_cnt <= 19'd0;
    end else if (sw == 1'b1) begin
        if (key == 1'b0 && key_flag == 1'b0) begin
            if (debounce_cnt == 19'd500000) begin
                key_flag <= 1'b1;
                debounce_cnt <= 19'd0;
                if (count2 == 4'd9) begin
                    count2 <= 4'd0;
                    if (count1 == 4'd3) begin
                        count1 <= 4'd0;
                    end else begin
                        count1 <= count1 + 1'b1;
                    end
                end else begin
                    count2 <= count2 + 1'b1;
                end
            end else begin
                debounce_cnt <= debounce_cnt + 1'b1;
            end
        end else if (key == 1'b1) begin
            key_flag <= 1'b0;
            debounce_cnt <= 19'd0;
        end
    end else begin
        if (cnt == 24'd12000000) begin
            if (count1 == 4'd0 && count2 == 4'd0) begin
                count1 <= 4'd0;
                count2 <= 4'd0;
            end else if (count2 == 4'd0) begin
                count2 <= 4'd9;
                count1 <= count1 - 1'b1;
            end else begin
                count2 <= count2 - 1'b1;
            end
        end
    end
end

always @(posedge clk) begin
    Count1 <= num[count1];
    Count2 <= num[count2];
end

endmodule