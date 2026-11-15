module origen_038500 #(
    parameter PIXELS = 640,
    parameter LINES = 480,
    parameter H_FP = 16,
    parameter H_SYNC = 96,
    parameter H_BP = 48,
    parameter V_FP = 10,
    parameter V_SYNC = 2,
    parameter V_BP = 33,
    parameter HSYNC_NEG = 1'b0,
    parameter VSYNC_NEG = 1'b0,
    parameter BITS = 8,
    parameter VRAM_DELAY = 2
) (
    input wire clk,
    input wire rst_n,
    output reg [9:0] vram_h,
    output reg [9:0] vram_v,
    output reg vram_read,
    input wire [3*BITS-1:0] vram_data,
    output reg vblank,
    output reg rgb_en,
    output reg hsync,
    output reg vsync,
    output reg [BITS-1:0] r,
    output reg [BITS-1:0] g,
    output reg [BITS-1:0] b
);

    localparam H_TOTAL = PIXELS + H_FP + H_SYNC + H_BP;
    localparam V_TOTAL = LINES + V_FP + V_SYNC + V_BP;

    reg [9:0] hcnt;
    reg [9:0] vcnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            hcnt <= 10'd0;
            vcnt <= 10'd0;
        end else begin
            if (hcnt == H_TOTAL - 1) begin
                hcnt <= 10'd0;
                if (vcnt == V_TOTAL - 1)
                    vcnt <= 10'd0;
                else
                    vcnt <= vcnt + 10'd1;
            end else begin
                hcnt <= hcnt + 10'd1;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            hsync <= HSYNC_NEG;
            vsync <= VSYNC_NEG;
        end else begin
            hsync <= (hcnt >= (PIXELS + H_FP) && hcnt < (PIXELS + H_FP + H_SYNC)) ? ~HSYNC_NEG : HSYNC_NEG;
            vsync <= (vcnt >= (LINES + V_FP) && vcnt < (LINES + V_FP + V_SYNC)) ? ~VSYNC_NEG : VSYNC_NEG;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            vram_read <= 1'b0;
            vram_h <= 10'd0;
            vram_v <= 10'd0;
        end else begin
            vram_read <= (hcnt < PIXELS && vcnt < LINES);
            vram_h <= (hcnt < PIXELS) ? hcnt + VRAM_DELAY : 10'd0;
            vram_v <= (vcnt < LINES) ? vcnt : 10'd0;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rgb_en <= 1'b0;
            r <= {BITS{1'b0}};
            g <= {BITS{1'b0}};
            b <= {BITS{1'b0}};
        end else begin
            rgb_en <= (hcnt < PIXELS && vcnt < LINES);
            if (hcnt < PIXELS && vcnt < LINES) begin
                r <= vram_data[3*BITS-1:2*BITS];
                g <= vram_data[2*BITS-1:BITS];
                b <= vram_data[BITS-1:0];
            end else begin
                r <= {BITS{1'b0}};
                g <= {BITS{1'b0}};
                b <= {BITS{1'b0}};
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            vblank <= 1'b0;
        else
            vblank <= (vcnt >= LINES);
    end

endmodule