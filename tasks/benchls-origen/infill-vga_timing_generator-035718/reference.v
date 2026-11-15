module origen_035718 (
    input wire clk,
    input wire reset,
    input wire pxclk,
    input wire med_res,
    output reg video_data_latch,
    output reg [9:0] hcnt,
    output reg [8:0] vcnt,
    output reg href,
    output reg hsync,
    output reg vsync
);

    // Resolution-dependent parameters
    reg [9:0] hline_end, hsync_beg, hsync_end;
    reg [8:0] vframe_end, vsync_beg, vsync_end;

    // Internal counters
    reg [9:0] hreg;
    reg [8:0] vreg;

    // State registers
    reg h_state, v_state;

    // Update resolution-dependent parameters
    always @(med_res) begin
        if (med_res) begin
            hline_end = 10'd587;
            hsync_beg = 10'd378;
            hsync_end = 10'd421;
            vframe_end = 9'd411;
            vsync_beg = 9'd233;
            vsync_end = 9'd242;
        end else begin
            hline_end = 10'd466;
            hsync_beg = 10'd327;
            hsync_end = 10'd361;
            vframe_end = 9'd261;
            vsync_beg = 9'd158;
            vsync_end = 9'd167;
        end
    end

    // Horizontal and vertical counters
    always @(posedge pxclk or posedge reset) begin
        if (reset) begin
            hreg <= 10'd0;
            vreg <= 9'd0;
        end else begin
            if (hreg == hline_end) begin
                hreg <= 10'd0;
                if (vreg == vframe_end)
                    vreg <= 9'd0;
                else
                    vreg <= vreg + 1'b1;
            end else begin
                hreg <= hreg + 1'b1;
            end
        end
    end

    // Horizontal sync state machine
    always @(posedge pxclk or posedge reset) begin
        if (reset)
            h_state <= 1'b0;
        else if (hreg == hsync_beg)
            h_state <= 1'b1;
        else if (hreg == hsync_end)
            h_state <= 1'b0;
    end

    // Vertical sync state machine
    always @(posedge pxclk or posedge reset) begin
        if (reset)
            v_state <= 1'b0;
        else if (hreg == hline_end) begin
            if (vreg == vsync_beg)
                v_state <= 1'b1;
            else if (vreg == vsync_end)
                v_state <= 1'b0;
        end
    end

    // Output assignments
    always @(posedge pxclk or posedge reset) begin
        if (reset) begin
            video_data_latch <= 1'b0;
            hcnt <= 10'd0;
            vcnt <= 9'd0;
            href <= 1'b0;
            hsync <= 1'b0;
            vsync <= 1'b0;
        end else begin
            video_data_latch <= ~video_data_latch;
            hcnt <= hreg;
            vcnt <= vreg;
            href <= (hreg < hline_end) && (vreg < vframe_end);
            hsync <= h_state;
            vsync <= v_state;
        end
    end

endmodule