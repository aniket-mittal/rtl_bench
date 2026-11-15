module origen_196266(
    input AMSCK,
    input lrck,
    input bclk,
    input sdin,
    output sdout,
    output mclk,
    output [23:0] dout,
    output valid_l,
    output valid_r
);

reg [2:0] mclk_cnt = 0;
always @(posedge AMSCK) begin
    mclk_cnt <= mclk_cnt + 1;
end
assign mclk = mclk_cnt[2];

reg lrck_sync1 = 0, lrck_sync2 = 0;
wire lrck_rise, lrck_fall;
assign lrck_rise = ~lrck_sync1 & lrck_sync2;
assign lrck_fall = lrck_sync1 & ~lrck_sync2;

reg bclk_sync1 = 0, bclk_sync2 = 0;
wire bclk_rise;
assign bclk_rise = ~bclk_sync1 & bclk_sync2;

reg [31:0] shr_l = 0, shr_r = 0;
reg [23:0] dout_reg = 0;

always @(posedge bclk) begin
    bclk_sync1 <= lrck;
    bclk_sync2 <= bclk_sync1;

    if (lrck_rise) begin
        shr_l <= {shr_l[30:0], sdin};
    end else if (lrck_fall) begin
        shr_r <= {shr_r[30:0], sdin};
    end
end

always @(posedge AMSCK) begin
    lrck_sync1 <= lrck;
    lrck_sync2 <= lrck_sync1;

    if (lrck_rise) begin
        dout_reg[23:0] <= shr_l[31:8];
    end else if (lrck_fall) begin
        dout_reg[23:0] <= shr_r[31:8];
    end
end

assign sdout = sdin;
assign dout = dout_reg;
assign valid_l = lrck_rise;
assign valid_r = lrck_fall;

endmodule