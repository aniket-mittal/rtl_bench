module origen_075002 (
    input wire pixel_clk,
    input wire [7:0] pixel_color,
    output reg [3:0] R, G, B,
    output reg hsync, vsync
);

    reg [9:0] hcount;
    reg [9:0] vcount;
    wire visible;

    // Horizontal and vertical counters
    always @(posedge pixel_clk) begin
        if (hcount == 10'd799) begin
            hcount <= 10'd0;
            if (vcount == 10'd524)
                vcount <= 10'd0;
            else
                vcount <= vcount + 1'b1;
        end
        else
            hcount <= hcount + 1'b1;
    end

    // Visible area
    assign visible = (hcount < 640) && (vcount < 480);

    // Color output
    always @(*) begin
        if (visible) begin
            case (pixel_color)
                8'd1:   {R, G, B} = 12'h000; // Black
                8'd2:   {R, G, B} = 12'h00F; // Blue
                8'd4:   {R, G, B} = 12'h800; // Dark Red
                8'd8:   {R, G, B} = 12'h0FF; // Cyan
                8'd16:  {R, G, B} = 12'hF00; // Red
                8'd32:  {R, G, B} = 12'hF0F; // Magenta
                8'd64:  {R, G, B} = 12'hFF0; // Yellow
                8'd128: {R, G, B} = 12'hFFF; // White
                default:{R, G, B} = 12'h000; // Black
            endcase
        end
        else
            {R, G, B} = 12'h000; // Black during blanking
    end

    // Horizontal sync
    always @(*) begin
        hsync = ~((hcount >= 659) && (hcount < 756));
    end

    // Vertical sync
    always @(*) begin
        vsync = ~((vcount >= 493) && (vcount < 495));
    end

endmodule