module origen_090202 (
    input wire reset,
    input wire clk50,
    output reg vSync,
    output reg hSync,
    output reg pClk,
    output reg [8:0] row,
    output reg [9:0] col,
    output reg row0,
    output reg col0,
    output reg active
);

    // Timing parameters
    parameter HSYNC   = 96;
    parameter HBACK   = 48;
    parameter HACTIVE = 640;
    parameter HFRONT  = 16;
    parameter VSYNC   = 2;
    parameter VBACK   = 33;
    parameter VACTIVE = 480;
    parameter VFRONT  = 10;

    // Internal counters
    reg [12:0] hClock;
    reg [11:0] vClock;

    // Pixel clock generation
    reg clkDiv;
    always @(posedge clk50 or posedge reset) begin
        if (reset)
            clkDiv <= 1'b0;
        else
            clkDiv <= ~clkDiv;
    end
    assign pClk = clkDiv;

    // Horizontal counter
    always @(posedge pClk or posedge reset) begin
        if (reset)
            hClock <= 0;
        else if (hClock == HSYNC + HBACK + HACTIVE + HFRONT - 1)
            hClock <= 0;
        else
            hClock <= hClock + 1;
    end

    // Vertical counter
    always @(posedge pClk or posedge reset) begin
        if (reset)
            vClock <= 0;
        else if (hClock == HSYNC + HBACK + HACTIVE + HFRONT - 1) begin
            if (vClock == VSYNC + VBACK + VACTIVE + VFRONT - 1)
                vClock <= 0;
            else
                vClock <= vClock + 1;
        end
    end

    // Sync signals
    always @(posedge pClk or posedge reset) begin
        if (reset) begin
            hSync <= 1'b1;
            vSync <= 1'b1;
        end else begin
            hSync <= (hClock >= HSYNC) ? 1'b1 : 1'b0;
            vSync <= (vClock >= VSYNC) ? 1'b1 : 1'b0;
        end
    end

    // Active display area
    always @(posedge pClk or posedge reset) begin
        if (reset)
            active <= 1'b0;
        else
            active <= (hClock >= HSYNC + HBACK) && (hClock < HSYNC + HBACK + HACTIVE) &&
                      (vClock >= VSYNC + VBACK) && (vClock < VSYNC + VBACK + VACTIVE);
    end

    // Pixel coordinates
    always @(posedge pClk or posedge reset) begin
        if (reset) begin
            row <= 9'd0;
            col <= 10'd0;
        end else if (active) begin
            col <= hClock - (HSYNC + HBACK);
            row <= vClock - (VSYNC + VBACK);
        end
    end

    // Start of frame and line signals
    always @(posedge pClk or posedge reset) begin
        if (reset) begin
            row0 <= 1'b0;
            col0 <= 1'b0;
        end else begin
            row0 <= (vClock == VSYNC + VBACK) && (hClock == HSYNC + HBACK);
            col0 <= (hClock == HSYNC + HBACK);
        end
    end

endmodule