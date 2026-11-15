module origen_083132 (
    input wire CLK,
    input wire i_rst,
    input wire i_pix_stb,
    output wire o_hs,
    output wire o_vs,
    output wire o_is_blanking,
    output wire o_is_active,
    output wire o_screened_tick,
    output wire o_animate_tick,
    output wire [10:0] o_x,
    output wire [10:0] o_y
);

    // Timing constants
    localparam HS_STA = 1344;
    localparam HS_END = 1480;
    localparam HA_STA = 0;
    localparam HA_END = 1024;
    localparam VS_STA = 771;
    localparam VS_END = 777;
    localparam VA_STA = 0;
    localparam VA_END = 768;
    localparam LINE = 1504;
    localparam SCREEN = 806;

    reg [10:0] h_count;
    reg [10:0] v_count;
    
    assign o_hs = ~((h_count >= HS_STA) & (h_count < HS_END));
    assign o_vs = ~((v_count >= VS_STA) & (v_count < VS_END));

    assign o_x = (h_count < HA_END) ? h_count : 11'd0;
    assign o_y = (v_count < VA_END) ? v_count : 11'd0;

    assign o_is_blanking = ((h_count >= HA_END) | (v_count >= VA_END));
    assign o_is_active = ~o_is_blanking;

    assign o_screened_tick = ((v_count == SCREEN - 1) & (h_count == LINE - 1));
    assign o_animate_tick = ((v_count == VA_END - 1) & (h_count == HA_END - 1));

    always @(posedge CLK) begin
        if (i_rst) begin
            h_count <= 11'd0;
            v_count <= 11'd0;
        end else if (i_pix_stb) begin
            if (h_count == LINE - 1) begin
                h_count <= 11'd0;
                if (v_count == SCREEN - 1)
                    v_count <= 11'd0;
                else
                    v_count <= v_count + 1'b1;
            end else
                h_count <= h_count + 1'b1;
        end
    end

endmodule