module origen_191213(
    input CLK,
    input RSTn,
    input Start,
    output reg Over,
    output reg CLE,
    output reg WEn,
    output reg ALE
);

    parameter tWP_cnt = 6'd10;
    parameter tHOLD_cnt = 6'd5;

    reg [2:0] WR_CMD_FSM_state;
    reg [5:0] WP_CNT, HOLD_CNT;

    localparam WR_CMD_FSM_IDLE = 3'b000,
               WR_CMD_FSM_WEn_LOW = 3'b001,
               WR_CMD_FSM_WEn_HIGH = 3'b010,
               WR_CMD_FSM_OVER = 3'b011;

    [MASKED]

endmodule