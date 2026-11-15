module origen_195922 (
    input clk,
    input reset,
    output hsync,
    output vsync,
    output p_tick,
    output [9:0] pixel_x,
    output [9:0] pixel_y
);

    // Timing parameters
    parameter HD = 640;
    parameter HF = 16;
    parameter HB = 48;
    parameter HR = 96;
    parameter VD = 480;
    parameter VF = 10;
    parameter VB = 33;
    parameter VR = 2;

    // Internal counters
    reg [9:0] h_count_reg;
    reg [9:0] v_count_reg;

    // Pixel clock generator
    reg [1:0] counter_50;
    reg [1:0] counter_25;
    wire pixel_tick;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter_50 <= 2'b00;
            counter_25 <= 2'b00;
        end else begin
            counter_50 <= counter_50 + 1;
            counter_25 <= counter_25 + 1;
        end
    end

    assign pixel_tick = (counter_50 == 2'b11) ? 1'b1 : 1'b0;

    // Horizontal and vertical counters
    always @(negedge pixel_tick or posedge reset) begin
        if (reset) begin
            h_count_reg <= 10'd0;
            v_count_reg <= 10'd0;
        end else begin
            if (h_count_reg < (HD + HF + HB + HR - 1)) begin
                h_count_reg <= h_count_reg + 1;
            end else begin
                h_count_reg <= 10'd0;
                if (v_count_reg < (VD + VF + VB + VR - 1)) begin
                    v_count_reg <= v_count_reg + 1;
                end else begin
                    v_count_reg <= 10'd0;
                end
            end
        end
    end

    // Horizontal and vertical sync signals
    reg h_sync_next;
    reg v_sync_next;

    always @(*) begin
        if ((h_count_reg >= (HD + HF)) && (h_count_reg < (HD + HF + HR))) begin
            h_sync_next = 1'b0;
        end else begin
            h_sync_next = 1'b1;
        end

        if ((v_count_reg >= (VD + VF)) && (v_count_reg < (VD + VF + VR))) begin
            v_sync_next = 1'b0;
        end else begin
            v_sync_next = 1'b1;
        end
    end

    // Registered sync signals
    reg hsync_reg;
    reg vsync_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            hsync_reg <= 1'b1;
            vsync_reg <= 1'b1;
        end else begin
            hsync_reg <= h_sync_next;
            vsync_reg <= v_sync_next;
        end
    end

    // Outputs
    assign hsync = hsync_reg;
    assign vsync = vsync_reg;
    assign p_tick = pixel_tick;
    assign pixel_x = h_count_reg;
    assign pixel_y = v_count_reg;

endmodule