module origen_082541 (
    input wire CLOCK_PIXEL,
    input wire RESET,
    output reg [3:0] VGA_RED,
    output reg [3:0] VGA_GREEN,
    output reg [3:0] VGA_BLUE,
    output reg VGA_HS,
    output reg VGA_VS
);

    // Timing parameters
    parameter H_VISIBLE = 800;
    parameter H_FRONT_PORCH = 40;
    parameter H_SYNC_PULSE = 88;
    parameter H_BACK_PORCH = 48;
    parameter H_TOTAL = 976;

    parameter V_VISIBLE = 480;
    parameter V_FRONT_PORCH = 13;
    parameter V_SYNC_PULSE = 3;
    parameter V_BACK_PORCH = 32;
    parameter V_TOTAL = 528;

    // Counter registers
    reg [9:0] hor_reg;
    reg [9:0] ver_reg;

    // Counter logic
    always @(posedge CLOCK_PIXEL or posedge RESET) begin
        if (RESET) begin
            hor_reg <= 10'd0;
            ver_reg <= 10'd0;
        end else begin
            if (hor_reg == H_TOTAL - 1) begin
                hor_reg <= 10'd0;
                if (ver_reg == V_TOTAL - 1)
                    ver_reg <= 10'd0;
                else
                    ver_reg <= ver_reg + 1'b1;
            end else begin
                hor_reg <= hor_reg + 1'b1;
            end
        end
    end

    // Output generation
    always @(posedge CLOCK_PIXEL or posedge RESET) begin
        if (RESET) begin
            VGA_HS <= 1'b1;
            VGA_VS <= 1'b1;
            VGA_RED <= 4'b0000;
            VGA_GREEN <= 4'b0000;
            VGA_BLUE <= 4'b0000;
        end else begin
            // Generate sync signals
            VGA_HS <= ~((hor_reg >= (H_VISIBLE + H_FRONT_PORCH)) && (hor_reg < (H_VISIBLE + H_FRONT_PORCH + H_SYNC_PULSE)));
            VGA_VS <= ~((ver_reg >= (V_VISIBLE + V_FRONT_PORCH)) && (ver_reg < (V_VISIBLE + V_FRONT_PORCH + V_SYNC_PULSE)));

            // Generate color signals
            if ((hor_reg < H_VISIBLE) && (ver_reg < V_VISIBLE)) begin
                // Green square
                if ((hor_reg >= 100) && (hor_reg < 200) && (ver_reg >= 100) && (ver_reg < 200)) begin
                    VGA_RED <= 4'b0000;
                    VGA_GREEN <= 4'b1111;
                    VGA_BLUE <= 4'b0000;
                end
                // Green horizontal lines
                else if ((ver_reg == 0) || (ver_reg == 478)) begin
                    VGA_RED <= 4'b0000;
                    VGA_GREEN <= 4'b1111;
                    VGA_BLUE <= 4'b0000;
                end
                // Red vertical lines
                else if ((hor_reg == 0) || (hor_reg == 798)) begin
                    VGA_RED <= 4'b1111;
                    VGA_GREEN <= 4'b0000;
                    VGA_BLUE <= 4'b0000;
                end
                // White background
                else begin
                    VGA_RED <= 4'b1111;
                    VGA_GREEN <= 4'b1111;
                    VGA_BLUE <= 4'b1111;
                end
            end
            // Black during blanking periods
            else begin
                VGA_RED <= 4'b0000;
                VGA_GREEN <= 4'b0000;
                VGA_BLUE <= 4'b0000;
            end
        end
    end

endmodule