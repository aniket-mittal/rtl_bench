module origen_108400 (
    input wire clk,
    input wire reset_n,
    input wire [7:0] r, g, b,
    input wire [10:0] x_in, y_in,
    output reg is_red, is_yellow, is_green, is_blue, is_pink, is_unknown,
    output reg [10:0] x_out, y_out
);

    // Stage 1 registers
    reg [7:0] r_reg, g_reg, b_reg;
    reg [10:0] x_reg1, y_reg1;

    // Stage 2 registers
    reg [31:0] dist_red, dist_yellow, dist_green, dist_blue, dist_pink, dist_unknown;
    reg [10:0] x_reg2, y_reg2;

    // Color points
    localparam [23:0] RED_POINT    = 24'hFF0000;
    localparam [23:0] YELLOW_POINT = 24'hFFFF00;
    localparam [23:0] GREEN_POINT  = 24'h00FF00;
    localparam [23:0] BLUE_POINT   = 24'h0000FF;
    localparam [23:0] PINK_POINT   = 24'hFFC0CB;

    // Stage 1: Register inputs
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            r_reg <= 8'b0;
            g_reg <= 8'b0;
            b_reg <= 8'b0;
            x_reg1 <= 11'b0;
            y_reg1 <= 11'b0;
        end else begin
            r_reg <= r;
            g_reg <= g;
            b_reg <= b;
            x_reg1 <= x_in;
            y_reg1 <= y_in;
        end
    end

    // Stage 2: Calculate distances
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            dist_red <= 32'b0;
            dist_yellow <= 32'b0;
            dist_green <= 32'b0;
            dist_blue <= 32'b0;
            dist_pink <= 32'b0;
            dist_unknown <= 32'b0;
            x_reg2 <= 11'b0;
            y_reg2 <= 11'b0;
        end else begin
            dist_red <= (r_reg - RED_POINT[23:16])*(r_reg - RED_POINT[23:16]) +
                        (g_reg - RED_POINT[15:8])*(g_reg - RED_POINT[15:8]) +
                        (b_reg - RED_POINT[7:0])*(b_reg - RED_POINT[7:0]);
            dist_yellow <= (r_reg - YELLOW_POINT[23:16])*(r_reg - YELLOW_POINT[23:16]) +
                           (g_reg - YELLOW_POINT[15:8])*(g_reg - YELLOW_POINT[15:8]) +
                           (b_reg - YELLOW_POINT[7:0])*(b_reg - YELLOW_POINT[7:0]);
            dist_green <= (r_reg - GREEN_POINT[23:16])*(r_reg - GREEN_POINT[23:16]) +
                          (g_reg - GREEN_POINT[15:8])*(g_reg - GREEN_POINT[15:8]) +
                          (b_reg - GREEN_POINT[7:0])*(b_reg - GREEN_POINT[7:0]);
            dist_blue <= (r_reg - BLUE_POINT[23:16])*(r_reg - BLUE_POINT[23:16]) +
                         (g_reg - BLUE_POINT[15:8])*(g_reg - BLUE_POINT[15:8]) +
                         (b_reg - BLUE_POINT[7:0])*(b_reg - BLUE_POINT[7:0]);
            dist_pink <= (r_reg - PINK_POINT[23:16])*(r_reg - PINK_POINT[23:16]) +
                         (g_reg - PINK_POINT[15:8])*(g_reg - PINK_POINT[15:8]) +
                         (b_reg - PINK_POINT[7:0])*(b_reg - PINK_POINT[7:0]);
            dist_unknown <= r_reg*r_reg + g_reg*g_reg + b_reg*b_reg;
            x_reg2 <= x_reg1;
            y_reg2 <= y_reg1;
        end
    end

    // Stage 3: Color classification
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            is_red <= 1'b0;
            is_yellow <= 1'b0;
            is_green <= 1'b0;
            is_blue <= 1'b0;
            is_pink <= 1'b0;
            is_unknown <= 1'b0;
            x_out <= 11'b0;
            y_out <= 11'b0;
        end else begin
            is_red <= (dist_red < 30000) && (r_reg > g_reg) && (r_reg > b_reg);
            is_yellow <= (dist_yellow < 20000) && (r_reg > b_reg) && (g_reg > b_reg) && (r_reg - g_reg < 30);
            is_green <= (dist_green < 35000) && (g_reg > r_reg) && (g_reg > b_reg) && (g_reg - r_reg > 30);
            is_blue <= (dist_blue < 44000) && (b_reg > g_reg) && (g_reg > r_reg);
            is_pink <= (dist_pink < 33000) && (r_reg > g_reg) && (b_reg > g_reg) && (r_reg - b_reg < 50);
            is_unknown <= (dist_unknown < 2000);
            x_out <= x_reg2;
            y_out <= y_reg2;
        end
    end

endmodule