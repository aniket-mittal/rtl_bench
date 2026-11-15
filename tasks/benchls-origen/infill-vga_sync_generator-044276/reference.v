module origen_044276
(
    input wire clk, reset,
    output wire hsync, vsync, video_on, p_tick,
    output wire [9:0] pixel_x, pixel_y
);

    // constant declarations for VGA sync parameters
    localparam H_DISPLAY       = 640; // horizontal display area
    localparam H_L_BORDER      =  48; // horizontal left border
    localparam H_R_BORDER      =  16; // horizontal right border
    localparam H_RETRACE       =  96; // horizontal retrace
    localparam H_MAX           = H_DISPLAY + H_L_BORDER + H_R_BORDER + H_RETRACE - 1;
    localparam START_H_RETRACE = H_DISPLAY + H_R_BORDER;
    localparam END_H_RETRACE   = H_DISPLAY + H_R_BORDER + H_RETRACE - 1;
    
    localparam V_DISPLAY       = 480; // vertical display area
    localparam V_T_BORDER      =  10; // vertical top border
    localparam V_B_BORDER      =  33; // vertical bottom border
    localparam V_RETRACE       =   2; // vertical retrace
    localparam V_MAX           = V_DISPLAY + V_T_BORDER + V_B_BORDER + V_RETRACE - 1;
    localparam START_V_RETRACE = V_DISPLAY + V_B_BORDER;
    localparam END_V_RETRACE   = V_DISPLAY + V_B_BORDER + V_RETRACE - 1;

    // mod-2 counter to generate 25 MHz pixel tick
    wire pixel_tick;
    reg [1:0] mod2_reg;

    // sync counters
    reg [9:0] h_count_reg, h_count_next;
    reg [9:0] v_count_reg, v_count_next;

    // output buffer
    reg v_sync_reg, h_sync_reg;
    wire v_sync_next, h_sync_next;

    // status signal
    wire h_end, v_end;

    // body
    // registers
    always @(posedge clk, posedge reset)
        if (reset)
            begin
            mod2_reg <= 2'b0;
            v_count_reg <= 0;
            h_count_reg <= 0;
            v_sync_reg <= 1'b0;
            h_sync_reg <= 1'b0;
            end
        else
            begin
            mod2_reg <= mod2_reg + 1;
            v_count_reg <= v_count_next;
            h_count_reg <= h_count_next;
            v_sync_reg <= v_sync_next;
            h_sync_reg <= h_sync_next;
            end

    // mod-2 circuit to generate pixel tick
    assign pixel_tick = mod2_reg == 2'b11;

    // status signals
    assign h_end = (h_count_reg == H_MAX);
    assign v_end = (v_count_reg == V_MAX);

    // next-state logic of mod-800 horizontal sync counter
    always @*
        if (pixel_tick)  // 25 MHz tick
            if (h_end)
                h_count_next = 0;
            else
                h_count_next = h_count_reg + 1;
        else
            h_count_next = h_count_reg;

    // next-state logic of mod-525 vertical sync counter
    always @*
        if (pixel_tick & h_end)
            if (v_end)
                v_count_next = 0;
            else
                v_count_next = v_count_reg + 1;
        else
            v_count_next = v_count_reg;

    // horizontal and vertical sync, buffered to avoid glitch
    assign h_sync_next = (h_count_reg >= START_H_RETRACE) && (h_count_reg <= END_H_RETRACE);
    assign v_sync_next = (v_count_reg >= START_V_RETRACE) && (v_count_reg <= END_V_RETRACE);

    // video on/off
    assign video_on = (h_count_reg < H_DISPLAY) && (v_count_reg < V_DISPLAY);

    // output
    assign hsync = h_sync_reg;
    assign vsync = v_sync_reg;
    assign pixel_x = h_count_reg;
    assign pixel_y = v_count_reg;
    assign p_tick = pixel_tick;

endmodule