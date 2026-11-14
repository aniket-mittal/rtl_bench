module origen_013554(
    input            clk,
    input            cen,
    input      [1:0] sel,
    output reg       cen_lo,
    output reg       cenb_lo,
    output reg       cen_mid,
    output reg       vclk_o
);

reg [6:0] cnt;
reg [6:0] lim;
reg pre, preb;

always @(*) begin
    case(sel)
        2'b00: lim = 7'd95;
        2'b01: lim = 7'd63;
        2'b10: lim = 7'd47;
        2'b11: lim = 7'd1;
    endcase
end

always @(posedge clk) begin
    if (cen) begin
        if (sel == 2'b11) begin
            cnt <= 7'd0;
            vclk_o <= 1'b0;
        end else begin
            if (cnt == lim) begin
                cnt <= 7'd0;
                vclk_o <= 1'b1;
            end else begin
                cnt <= cnt + 7'd1;
                if (cnt == {1'b0, lim[6:1]}) begin
                    vclk_o <= 1'b0;
                end
            end
        end
    end
end

always @(posedge clk) begin
    pre <= (cnt == lim);
    preb <= (cnt == {1'b0, lim[6:1]});
end

always @(posedge clk) begin
    cen_lo <= pre & cen;
    cenb_lo <= preb & cen;
    cen_mid <= (pre | preb) & cen;
end

endmodule