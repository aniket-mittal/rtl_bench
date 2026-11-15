module origen_119271(
    input clk,
    output reg vga_h_sync,
    output reg vga_v_sync,
    output reg inDisplayArea,
    output reg [9:0] HCounterX,
    output reg [9:0] HCounterY
);

    // Horizontal timing constants
    localparam H_DISPLAY = 640;
    localparam H_FRONT_PORCH = 16;
    localparam H_SYNC = 96;
    localparam H_BACK_PORCH = 48;
    localparam H_TOTAL = 800;

    // Vertical timing constants
    localparam V_DISPLAY = 480;
    localparam V_FRONT_PORCH = 10;
    localparam V_SYNC = 2;
    localparam V_BACK_PORCH = 33;
    localparam V_TOTAL = 525;

    always @(posedge clk) begin
        // Horizontal counter
        if (HCounterX < H_TOTAL - 1)
            HCounterX <= HCounterX + 1;
        else begin
            HCounterX <= 0;
            // Vertical counter
            if (HCounterY < V_TOTAL - 1)
                HCounterY <= HCounterY + 1;
            else
                HCounterY <= 0;
        end

        // Generate horizontal sync signal
        if (HCounterX >= (H_DISPLAY + H_FRONT_PORCH) && HCounterX < (H_DISPLAY + H_FRONT_PORCH + H_SYNC))
            vga_h_sync <= 1'b0;
        else
            vga_h_sync <= 1'b1;

        // Generate vertical sync signal
        if (HCounterY >= (V_DISPLAY + V_FRONT_PORCH) && HCounterY < (V_DISPLAY + V_FRONT_PORCH + V_SYNC))
            vga_v_sync <= 1'b0;
        else
            vga_v_sync <= 1'b1;

        // Set display area flag
        if (HCounterX < H_DISPLAY && HCounterY < V_DISPLAY)
            inDisplayArea <= 1'b1;
        else
            inDisplayArea <= 1'b0;
    end

endmodule