module rtlpp_09050 (
    input ddr_rstn_i,
    input clk,
    output ddr_rstn,
    output ddr_cfg_seq_rst,
    output reg ddr_cfg_seq_start,
    output reg ddr_init_done
);
    parameter FREQ = 100;             
    localparam CNT_INIT = 1.5 * FREQ * 1000;

    reg [1:0] rstn_dly;
    reg [19:0] cnt;
    reg [1:0] cnt_start;

    always @(posedge clk or negedge ddr_rstn_i) begin
        if (!ddr_rstn_i) begin
            rstn_dly <= 2'd0;
        end else begin
            rstn_dly[0] <= 1'b1;
            rstn_dly[1] <= rstn_dly[0];
        end
    end

    assign ddr_rstn = ddr_rstn_i;
    assign ddr_cfg_seq_rst = ~rstn_dly[1];

    always @(posedge clk or negedge ddr_rstn_i) begin
        if (!ddr_rstn_i) begin
            ddr_init_done <= 1'b0;
            cnt <= CNT_INIT;
        end else begin
            if (cnt != 20'd0) begin
                cnt <= cnt - 20'd1;
            end else begin
                cnt <= cnt;
                ddr_init_done <= 1'b1;
            end
        end
    end

    always @(posedge clk or negedge rstn_dly[1]) begin
        if (!rstn_dly[1]) begin
            ddr_cfg_seq_start <= 1'b0;
            cnt_start <= 2'd0;
        end else begin
            if (cnt_start == 2'b11) begin
                ddr_cfg_seq_start <= 1'b1;
                cnt_start <= cnt_start;
            end else begin
                cnt_start <= cnt_start + 1'b1;
            end
        end
    end
endmodule