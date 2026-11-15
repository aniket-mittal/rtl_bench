module origen_210189 (
    input i_clk,
    input i_pix_stb,
    input i_rst,
    output o_hs,
    output o_vs,
    output o_blanking,
    output o_active,
    output o_screenend,
    output o_animate,
    output [9:0] o_x,
    output [9:0] o_y
);

    parameter HS_STA = 96;
    parameter HS_END = 144;
    parameter HA_STA = 144;
    parameter VS_STA = 2;
    parameter VS_END = 6;
    parameter VA_END = 480;
    parameter LINE = 800;
    parameter SCREEN = 525;

    reg [9:0] h_count;
    reg [9:0] v_count;

    [MASKED]

    assign o_hs = (h_count >= HS_STA) && (h_count < HS_END);
    assign o_vs = (v_count >= VS_STA) && (v_count < VS_END);
    assign o_blanking = (h_count < HA_STA) || (v_count >= VA_END);
    assign o_active = (h_count >= HA_STA) && (v_count < VA_END);
    assign o_screenend = (v_count == (SCREEN - 1));
    assign o_animate = (v_count == (VA_END - 1));
    assign o_x = (h_count >= HA_STA) ? (h_count - HA_STA) : 0;
    assign o_y = (v_count < VA_END) ? v_count : 0;

endmodule