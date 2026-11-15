module origen_197846 #(
    parameter H_RESOLUTION = 640,
    parameter V_RESOLUTION = 480,
    parameter H_SYNC_START = 656,
    parameter H_SYNC_END = 752,
    parameter V_SYNC_START = 490,
    parameter V_SYNC_END = 492,
    parameter H_MAX_COUNT = 800,
    parameter V_MAX_COUNT = 525
) (
    input wire pixelClock,
    input wire [1:0] sw,
    input wire [3:0] btn,
    input wire [15:0] ppu_addr,
    input wire [23:0] vd,
    output reg [7:0] red, green, blue,
    output reg hSync, vSync,
    output reg blank,
    output wire [15:0] va
);

    reg [9:0] x, line;
    reg [15:0] px, py;
    reg [15:0] va_reg;

    always @(posedge pixelClock) begin
        if (x == H_MAX_COUNT - 1) begin
            x <= 0;
            if (line == V_MAX_COUNT - 1) begin
                line <= 0;
            end else begin
                line <= line + 1;
            end
        end else begin
            x <= x + 1;
        end

        if (x >= H_SYNC_START && x < H_SYNC_END) begin
            hSync <= 0;
        end else begin
            hSync <= 1;
        end

        if (line >= V_SYNC_START && line < V_SYNC_END) begin
            vSync <= 0;
        end else begin
            vSync <= 1;
        end

        if (x < H_RESOLUTION && line < V_RESOLUTION) begin
            blank <= 1;
            px <= x;
            py <= line;
            va_reg <= ppu_addr + (py * H_RESOLUTION) + px;
        end else begin
            blank <= 0;
            px <= 0;
            py <= 0;
            va_reg <= 0;
        end

        case (sw)
            2'b00: begin
                red <= vd[23:16];
                green <= vd[15:8];
                blue <= vd[7:0];
            end
            2'b01: begin
                red <= 8'hff;
                green <= 8'hff;
                blue <= 8'h00;
            end
            2'b10: begin
                red <= 8'h00;
                green <= 8'hff;
                blue <= 8'h00;
            end
            2'b11: begin
                red <= 8'hff;
                green <= 8'h00;
                blue <= 8'h00;
            end
        endcase

        if (btn[0]) begin
            px <= px + 1;
        end
        if (btn[1]) begin
            px <= px - 1;
        end
        if (btn[2]) begin
            py <= py + 1;
        end
        if (btn[3]) begin
            py <= py - 1;
        end
    end

    assign va = va_reg;

endmodule