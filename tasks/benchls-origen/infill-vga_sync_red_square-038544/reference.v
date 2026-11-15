module origen_038544(
    input CLOCK_50,
    input RESET,
    output [3:0] VGA_RED,
    output [3:0] VGA_GREEN,
    output [3:0] VGA_BLUE,
    output VGA_HS,
    output VGA_VS
);

reg [10:0] hor_reg;
reg [9:0] ver_reg;
reg hor_sync;
reg ver_sync;
wire active_area;
wire red_square;

always @(posedge CLOCK_50 or posedge RESET) begin
    if (RESET) begin
        hor_reg <= 11'd0;
        ver_reg <= 10'd0;
    end else begin
        if (hor_reg == 11'd1039) begin
            hor_reg <= 11'd0;
            if (ver_reg == 10'd665) begin
                ver_reg <= 10'd0;
            end else begin
                ver_reg <= ver_reg + 1'b1;
            end
        end else begin
            hor_reg <= hor_reg + 1'b1;
        end
    end
end

always @(posedge CLOCK_50 or posedge RESET) begin
    if (RESET) begin
        hor_sync <= 1'b0;
        ver_sync <= 1'b0;
    end else begin
        hor_sync <= (hor_reg >= 11'd856 && hor_reg < 11'd976);
        ver_sync <= (ver_reg >= 10'd637 && ver_reg < 10'd643);
    end
end

assign active_area = (hor_reg < 11'd800 && ver_reg < 10'd600);
assign red_square = (hor_reg >= 11'd100 && hor_reg <= 11'd200 && ver_reg >= 10'd100 && ver_reg <= 10'd200);

assign VGA_HS = ~hor_sync;
assign VGA_VS = ~ver_sync;
assign VGA_RED = (active_area) ? (red_square ? 4'hF : 4'hF) : 4'h0;
assign VGA_GREEN = (active_area) ? (red_square ? 4'h0 : 4'hF) : 4'h0;
assign VGA_BLUE = (active_area) ? (red_square ? 4'h0 : 4'hF) : 4'h0;

endmodule