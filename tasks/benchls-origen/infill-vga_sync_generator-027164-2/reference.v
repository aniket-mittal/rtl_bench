module origen_027164 (
    input wire vga_clk,
    input wire clrn,
    output reg hsync_out,
    output reg vsync_out,
    output reg [7:0] r,
    output reg [7:0] g,
    output reg [7:0] b,
    output wire vga_sync_n,
    output wire vga_blank_n,
    output reg [9:0] row_addr,
    output reg [9:0] col_addr
);

    // VGA 640x480 @ 60Hz timing parameters
    parameter H_COUNTER_MAX = 10'd799;
    parameter H_SYNC_START = 10'd656;
    parameter H_SYNC_END = 10'd752;
    parameter H_READ_MIN = 10'd0;
    parameter H_READ_MAX = 10'd639;
    parameter H_ADDR_OFFSET = 10'd0;

    parameter V_COUNTER_MAX = 10'd524;
    parameter V_SYNC_START = 10'd490;
    parameter V_SYNC_END = 10'd492;
    parameter V_READ_MIN = 10'd0;
    parameter V_READ_MAX = 10'd479;
    parameter V_ADDR_OFFSET = 10'd0;

    reg [9:0] h_count;
    reg [9:0] v_count;
    reg read;

    // Horizontal and vertical counters
    always @(posedge vga_clk or negedge clrn) begin
        if (!clrn) begin
            h_count <= 10'd0;
            v_count <= 10'd0;
        end else begin
            if (h_count == H_COUNTER_MAX) begin
                h_count <= 10'd0;
                if (v_count == V_COUNTER_MAX)
                    v_count <= 10'd0;
                else
                    v_count <= v_count + 10'd1;
            end else begin
                h_count <= h_count + 10'd1;
            end
        end
    end

    // Active display area and read signal
    always @(posedge vga_clk or negedge clrn) begin
        if (!clrn)
            read <= 1'b0;
        else
            read <= (h_count >= H_READ_MIN) && (h_count <= H_READ_MAX) &&
                    (v_count >= V_READ_MIN) && (v_count <= V_READ_MAX);
    end

    // Address generation
    always @(posedge vga_clk or negedge clrn) begin
        if (!clrn) begin
            row_addr <= 10'd0;
            col_addr <= 10'd0;
        end else begin
            row_addr <= v_count - V_ADDR_OFFSET;
            col_addr <= h_count - H_ADDR_OFFSET;
        end
    end

    // Color output
    always @(posedge vga_clk or negedge clrn) begin
        if (!clrn) begin
            r <= 8'd0;
            g <= 8'd0;
            b <= 8'd0;
        end else if (read) begin
            r <= 8'd0;
            g <= 8'd0;
            b <= 8'd255;
        end else begin
            r <= 8'd0;
            g <= 8'd0;
            b <= 8'd0;
        end
    end

    // Sync outputs
    always @(posedge vga_clk or negedge clrn) begin
        if (!clrn) begin
            hsync_out <= 1'b1;
            vsync_out <= 1'b1;
        end else begin
            hsync_out <= ~((h_count >= H_SYNC_START) && (h_count <= H_SYNC_END));
            vsync_out <= ~((v_count >= V_SYNC_START) && (v_count <= V_SYNC_END));
        end
    end

    // VGA control signals
    assign vga_sync_n = 1'b0;
    assign vga_blank_n = 1'b1;

endmodule