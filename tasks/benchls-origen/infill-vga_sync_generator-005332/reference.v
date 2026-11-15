module origen_005332 (
    input wire i_clk,
    input wire i_rst,
    output reg o_hs,
    output reg o_vs,
    output wire dp_en,
    output reg [10:0] line_count,
    output reg [10:0] pixel_count,
    output reg [10:0] px,
    output reg [10:0] py
);

    // Timing parameters
    localparam H_ACTIVE = 1024;
    localparam H_FRONT_PORCH = 24;
    localparam H_SYNC_PULSE = 136;
    localparam H_BACK_PORCH = 160;
    localparam H_TOTAL = H_ACTIVE + H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH;

    localparam V_ACTIVE = 768;
    localparam V_FRONT_PORCH = 3;
    localparam V_SYNC_PULSE = 6;
    localparam V_BACK_PORCH = 29;
    localparam V_TOTAL = V_ACTIVE + V_FRONT_PORCH + V_SYNC_PULSE + V_BACK_PORCH;

    reg h_en, v_en;
    reg [1:0] px_div;
    reg [1:0] py_div;

    always @(posedge i_clk or posedge i_rst) begin
        if (i_rst) begin
            pixel_count <= 11'd0;
            line_count <= 11'd0;
            o_hs <= 1'b1;
            o_vs <= 1'b1;
            h_en <= 1'b0;
            v_en <= 1'b0;
            px <= 11'd0;
            py <= 11'd0;
            px_div <= 2'd0;
            py_div <= 2'd0;
        end else begin
            // Pixel counter
            if (pixel_count == H_TOTAL - 1) begin
                pixel_count <= 11'd0;
                if (line_count == V_TOTAL - 1)
                    line_count <= 11'd0;
                else
                    line_count <= line_count + 1'b1;
            end else begin
                pixel_count <= pixel_count + 1'b1;
            end

            // Horizontal sync
            if (pixel_count == H_ACTIVE + H_FRONT_PORCH - 1)
                o_hs <= 1'b0;
            else if (pixel_count == H_ACTIVE + H_FRONT_PORCH + H_SYNC_PULSE - 1)
                o_hs <= 1'b1;

            // Vertical sync
            if (line_count == V_ACTIVE + V_FRONT_PORCH - 1)
                o_vs <= 1'b0;
            else if (line_count == V_ACTIVE + V_FRONT_PORCH + V_SYNC_PULSE - 1)
                o_vs <= 1'b1;

            // Display enable
            h_en <= (pixel_count < H_ACTIVE);
            v_en <= (line_count < V_ACTIVE);

            // Pixel coordinates
            if (h_en) begin
                px_div <= px_div + 1'b1;
                if (px_div == 2'd1) begin
                    px <= (px == H_ACTIVE - 1) ? 11'd0 : px + 1'b1;
                end
            end else begin
                px <= 11'd0;
                px_div <= 2'd0;
            end

            if (v_en) begin
                if (pixel_count == H_TOTAL - 1) begin
                    py_div <= py_div + 1'b1;
                    if (py_div == 2'd2) begin
                        py <= (py == V_ACTIVE - 1) ? 11'd0 : py + 1'b1;
                        py_div <= 2'd0;
                    end
                end
            end else begin
                py <= 11'd0;
                py_div <= 2'd0;
            end
        end
    end

    assign dp_en = h_en & v_en;

endmodule