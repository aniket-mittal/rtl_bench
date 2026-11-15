module origen_024355 (
    input wire i_clk,
    input wire i_pix_stb,
    input wire i_rst,
    output wire o_hs,
    output wire o_vs,
    output wire o_animate,
    output wire [9:0] o_x,
    output wire [8:0] o_y
);

    // Horizontal timing parameters
    localparam HS_STA = 16;
    localparam HS_END = 16 + 96;
    localparam HA_STA = 16 + 96 + 48;
    localparam LINE   = 800;

    // Vertical timing parameters
    localparam VS_STA = 10;
    localparam VS_END = 10 + 2;
    localparam VA_STA = 10 + 2 + 33;
    localparam FRAME  = 525;

    reg [9:0] h_count;
    reg [9:0] v_count;

    assign o_hs = ~((h_count >= HS_STA) & (h_count < HS_END));
    assign o_vs = ~((v_count >= VS_STA) & (v_count < VS_END));

    assign o_x = (h_count < HA_STA) ? 0 : (h_count - HA_STA);
    assign o_y = (v_count < VA_STA) ? 0 : (v_count - VA_STA);

    assign o_animate = ((v_count == FRAME - 1) & (h_count == LINE - 1));

    always @(posedge i_clk)
    begin
        if (i_rst)
        begin
            h_count <= 0;
            v_count <= 0;
        end
        else if (i_pix_stb)
        begin
            if (h_count == LINE - 1)
            begin
                h_count <= 0;
                if (v_count == FRAME - 1)
                    v_count <= 0;
                else
                    v_count <= v_count + 1;
            end
            else
                h_count <= h_count + 1;
        end
    end

endmodule