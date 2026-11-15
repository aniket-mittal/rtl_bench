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
    always @(*) begin
        case (TYPE)
            2'b00: begin // 640x480
                HT = 11'd800; HD = 11'd640; HF = 11'd16; HS = 11'd96; HB = 11'd48;
                VT = 10'd525; VD = 10'd480; VF = 10'd10; VS = 10'd2;  VB = 10'd33;
                hsync_pol = 0; vsync_pol = 0;
            end
            2'b01: begin // 800x600
                HT = 11'd1056; HD = 11'd800; HF = 11'd40; HS = 11'd128; HB = 11'd88;
                VT = 10'd628;  VD = 10'd600; VF = 10'd1;  VS = 10'd4;   VB = 10'd23;
                hsync_pol = 1; vsync_pol = 1;
            end
            2'b10: begin // 1024x768
                HT = 11'd1344; HD = 11'd1024; HF = 11'd24; HS = 11'd136; HB = 11'd160;
                VT = 10'd806;  VD = 10'd768;  VF = 10'd3;  VS = 10'd6;   VB = 10'd29;
                hsync_pol = 0; vsync_pol = 0;
            end
            2'b11: begin // 1280x1024
                HT = 11'd1688; HD = 11'd1280; HF = 11'd48; HS = 11'd112; HB = 11'd248;
                VT = 10'd1066; VD = 10'd1024; VF = 10'd1;  VS = 10'd3;   VB = 10'd38;
                hsync_pol = 1; vsync_pol = 1;
            end
        endcase
    end

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