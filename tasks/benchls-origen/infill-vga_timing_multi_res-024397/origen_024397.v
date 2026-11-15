module origen_024397 #(
    parameter TYPE = 2'b00
) (
    input wire pclk,
    input wire reset,
    output wire hsync,
    output wire vsync,
    output wire valid,
    output wire [10:0] h_cnt,
    output wire [9:0] v_cnt
);

    // Resolution parameters
    reg [10:0] HT, HD, HF, HS, HB;
    reg [9:0] VT, VD, VF, VS, VB;
    reg hsync_pol, vsync_pol;

    // Internal counters and signals
    reg [10:0] pixel_cnt;
    reg [9:0] line_cnt;
    reg hsync_i, vsync_i;

    // Resolution configuration
    [MASKED]

    // Horizontal timing
    always @(posedge pclk or posedge reset) begin
        if (reset) begin
            pixel_cnt <= 11'd0;
            hsync_i <= hsync_pol;
        end else begin
            if (pixel_cnt == HT - 1) begin
                pixel_cnt <= 11'd0;
            end else begin
                pixel_cnt <= pixel_cnt + 1'b1;
            end

            if ((pixel_cnt >= (HD + HF)) && (pixel_cnt < (HD + HF + HS))) begin
                hsync_i <= ~hsync_pol;
            end else begin
                hsync_i <= hsync_pol;
            end
        end
    end

    // Vertical timing
    always @(posedge pclk or posedge reset) begin
        if (reset) begin
            line_cnt <= 10'd0;
            vsync_i <= vsync_pol;
        end else if (pixel_cnt == HT - 1) begin
            if (line_cnt == VT - 1) begin
                line_cnt <= 10'd0;
            end else begin
                line_cnt <= line_cnt + 1'b1;
            end

            if ((line_cnt >= (VD + VF)) && (line_cnt < (VD + VF + VS))) begin
                vsync_i <= ~vsync_pol;
            end else begin
                vsync_i <= vsync_pol;
            end
        end
    end

    // Output assignments
    assign hsync = hsync_i;
    assign vsync = vsync_i;
    assign valid = (pixel_cnt < HD) && (line_cnt < VD);
    assign h_cnt = (pixel_cnt < HD) ? pixel_cnt : 11'd0;
    assign v_cnt = (line_cnt < VD) ? line_cnt : 10'd0;

endmodule