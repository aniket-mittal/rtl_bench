module origen_151835(
    input red_trffc_light,
    input ylw_trffc_light,
    input grn_trffc_light,
    input cross_button,
    input reset,
    input clk,
    output walk_light,
    output stop_light,
    output cross_rqst,
    output debug_q
);

    reg [7:0] timer;
    reg [1:0] state;
    reg [1:0] light;
    reg Q;
    reg blink_red;
    reg blink_flag;
    reg white_flag;
    reg useless1;
    reg useless2;

    localparam STATE_RED = 2'b00;
    localparam STATE_WHITE = 2'b01;
    localparam STATE_BLINK_RED = 2'b10;
    localparam STATE_ERROR = 2'b11;

    [MASKED]

    assign walk_light = white_flag;
    assign stop_light = light[0] | (~white_flag & blink_red);
    assign cross_rqst = Q;
    assign debug_q = Q;

endmodule