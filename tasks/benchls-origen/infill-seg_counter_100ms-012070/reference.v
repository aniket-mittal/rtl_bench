module origen_012070 #(
    parameter CNT_MAX = 49_999_999,
    parameter DATA_MAX = 100
)(
    input wire sys_clk,
    input wire sys_rst_n,
    output reg [19:0] data,
    output wire [5:0] point,
    output wire sign,
    output reg seg_en
);

reg [25:0] cnt_100ms;
reg cnt_flag;

// 100ms counter
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        cnt_100ms <= 26'd0;
        cnt_flag <= 1'b0;
    end else if (cnt_100ms == CNT_MAX) begin
        cnt_100ms <= 26'd0;
        cnt_flag <= 1'b1;
    end else begin
        cnt_100ms <= cnt_100ms + 1'b1;
        cnt_flag <= 1'b0;
    end
end

// Data counter
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        data <= 20'd0;
    end else if (cnt_flag) begin
        if (data == DATA_MAX) begin
            data <= 20'd0;
        end else begin
            data <= data + 1'b1;
        end
    end
end

// Segment enable
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        seg_en <= 1'b0;
    end else begin
        seg_en <= 1'b1;
    end
end

// Fixed outputs
assign point = 6'b000_000;
assign sign = 1'b0;

endmodule