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

[MASKED]

endmodule