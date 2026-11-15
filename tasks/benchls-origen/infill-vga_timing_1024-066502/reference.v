module origen_066502 (
    input wire xclk,
    output reg hsync,
    output reg vsync,
    output reg de,
    output reg [10:0] cnt_x,
    output reg [10:0] cnt_y
);

    // Horizontal timing parameters
    localparam H_FRONT_PORCH = 24;
    localparam H_SYNC_PULSE = 56;
    localparam H_BACK_PORCH = 124;
    localparam H_ACTIVE = 640;
    localparam H_TOTAL = 844;

    // Vertical timing parameters
    localparam V_FRONT_PORCH = 1;
    localparam V_SYNC_PULSE = 3;
    localparam V_BACK_PORCH = 38;
    localparam V_ACTIVE = 1024;
    localparam V_TOTAL = 1066;

    always @(posedge xclk) begin
        // Horizontal counter
        if (cnt_x == H_TOTAL - 1)
            cnt_x <= 11'd0;
        else
            cnt_x <= cnt_x + 11'd1;

        // Vertical counter
        if (cnt_x == H_TOTAL - 1) begin
            if (cnt_y == V_TOTAL - 1)
                cnt_y <= 11'd0;
            else
                cnt_y <= cnt_y + 11'd1;
        end

        // Horizontal sync
        if (cnt_x >= (H_ACTIVE + H_FRONT_PORCH) && cnt_x < (H_ACTIVE + H_FRONT_PORCH + H_SYNC_PULSE))
            hsync <= 1'b0;
        else
            hsync <= 1'b1;

        // Vertical sync
        if (cnt_y >= (V_ACTIVE + V_FRONT_PORCH) && cnt_y < (V_ACTIVE + V_FRONT_PORCH + V_SYNC_PULSE))
            vsync <= 1'b0;
        else
            vsync <= 1'b1;

        // Data enable
        if (cnt_x < H_ACTIVE && cnt_y < V_ACTIVE)
            de <= 1'b1;
        else
            de <= 1'b0;
    end

endmodule