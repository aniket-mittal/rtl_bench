module origen_041274 (
    input wire rst_n,
    input wire clk,
    input wire clr,
    input wire en_sw,
    input wire en_tb,
    input wire [11:0] init_mvec,
    output reg [11:0] addr_sw,
    output reg [7:0] addr_tb
);

reg en_sw_pre;
reg [4:0] cnt_h, cnt_w;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        addr_sw <= #1 12'h000;
        addr_tb <= #1 8'h00;
        en_sw_pre <= #1 1'b0;
        cnt_h <= #1 5'h00;
        cnt_w <= #1 5'h00;
    end else if (clr) begin
        addr_sw <= #1 12'h000;
        addr_tb <= #1 8'h00;
        en_sw_pre <= #1 1'b0;
        cnt_h <= #1 5'h00;
        cnt_w <= #1 5'h00;
    end else begin
        en_sw_pre <= #1 en_sw;

        if (en_sw && !en_sw_pre) begin
            addr_sw <= #1 init_mvec;
            cnt_h <= #1 5'h00;
            cnt_w <= #1 5'h00;
        end else if (en_sw) begin
            if (cnt_h < 5'd17) begin
                addr_sw[5:0] <= #1 addr_sw[5:0] + 1'b1;
                cnt_h <= #1 cnt_h + 1'b1;
            end else begin
                addr_sw[11:6] <= #1 addr_sw[11:6] + 1'b1;
                addr_sw[5:0] <= #1 init_mvec[5:0] - 6'd17;
                cnt_h <= #1 5'h00;
                cnt_w <= #1 cnt_w + 1'b1;
            end
        end

        if (en_tb) begin
            addr_tb <= #1 addr_tb + 1'b1;
        end
    end
end

endmodule