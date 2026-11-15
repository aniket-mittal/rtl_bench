module origen_194864(
    input rst_n,
    input clk,
    input de,
    input hsync,
    input vsync,
    input pclk,
    input [23:0] rgb,
    output reg [23:0] rgb0,
    output reg start
);

reg pclk_q, vsync_q, hsync_q, de_q;
reg pclk_risingedge, hsync_risingedge, vsync_risingedge, de_risingedge;
reg vsync_detected;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        pclk_q <= 1'b0;
        vsync_q <= 1'b0;
        hsync_q <= 1'b0;
        de_q <= 1'b0;
        pclk_risingedge <= 1'b0;
        hsync_risingedge <= 1'b0;
        vsync_risingedge <= 1'b0;
        de_risingedge <= 1'b0;
        vsync_detected <= 1'b0;
        rgb0 <= 24'b0;
        start <= 1'b0;
    end else begin
        pclk_q <= pclk;
        vsync_q <= vsync;
        hsync_q <= hsync;
        de_q <= de;
        pclk_risingedge <= pclk & ~pclk_q;
        hsync_risingedge <= hsync & ~hsync_q;
        vsync_risingedge <= vsync & ~vsync_q;
        de_risingedge <= de & ~de_q;
        if (vsync_risingedge) begin
            vsync_detected <= 1'b1;
        end else if (de_risingedge && vsync_detected) begin
            vsync_detected <= 1'b0;
            start <= 1'b1;
            rgb0 <= rgb;
        end else begin
            start <= 1'b0;
        end
    end
end

endmodule