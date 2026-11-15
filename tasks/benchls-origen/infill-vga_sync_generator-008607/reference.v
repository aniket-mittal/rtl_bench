module origen_008607 (
    input wire pixel_clk,
    output wire hs,
    output wire vs,
    output wire [9:0] x,
    output wire [9:0] y
);

    // Timing parameters
    parameter H_DISPLAY = 640;
    parameter H_FRONT_PORCH = 16;
    parameter H_SYNC_PULSE = 96;
    parameter H_BACK_PORCH = 48;
    parameter H_TOTAL = H_DISPLAY + H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH;

    parameter V_DISPLAY = 480;
    parameter V_FRONT_PORCH = 10;
    parameter V_SYNC_PULSE = 2;
    parameter V_BACK_PORCH = 33;
    parameter V_TOTAL = V_DISPLAY + V_FRONT_PORCH + V_SYNC_PULSE + V_BACK_PORCH;

    // Counters
    reg [9:0] hcount = 0;
    reg [9:0] vcount = 0;

    // End of line and frame flags
    wire htop, vtop;
    assign htop = (hcount == H_TOTAL - 1);
    assign vtop = (vcount == V_TOTAL - 1);

    // Horizontal counter
    always @(posedge pixel_clk) begin
        if (htop)
            hcount <= 0;
        else
            hcount <= hcount + 1;
    end

    // Vertical counter
    always @(posedge pixel_clk) begin
        if (htop) begin
            if (vtop)
                vcount <= 0;
            else
                vcount <= vcount + 1;
        end
    end

    // Sync signals
    assign hs = ~((hcount >= (H_DISPLAY + H_FRONT_PORCH)) && (hcount < (H_DISPLAY + H_FRONT_PORCH + H_SYNC_PULSE)));
    assign vs = ~((vcount >= (V_DISPLAY + V_FRONT_PORCH)) && (vcount < (V_DISPLAY + V_FRONT_PORCH + V_SYNC_PULSE)));

    // Coordinate outputs
    assign x = hcount;
    assign y = vcount;

endmodule