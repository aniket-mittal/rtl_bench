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

    always @(posedge CLK or negedge RSTn) begin
        if (!RSTn) begin
            WR_CMD_FSM_state <= WR_CMD_FSM_IDLE;
            WP_CNT <= 6'b0;
            HOLD_CNT <= 6'b0;
            Over <= 1'b0;
            CLE <= 1'b0;
            WEn <= 1'b1;
            ALE <= 1'b0;
        end
        else begin
            case (WR_CMD_FSM_state)
                WR_CMD_FSM_IDLE: begin
                    if (Start) begin
                        WR_CMD_FSM_state <= WR_CMD_FSM_WEn_LOW;
                        WP_CNT <= 6'b0;
                        HOLD_CNT <= 6'b0;
                        CLE <= 1'b1;
                        WEn <= 1'b0;
                        ALE <= 1'b0;
                    end
                    else begin
                        WR_CMD_FSM_state <= WR_CMD_FSM_IDLE;
                        Over <= 1'b0;
                        CLE <= 1'b0;
                        WEn <= 1'b1;
                        ALE <= 1'b0;
                    end
                end
                WR_CMD_FSM_WEn_LOW: begin
                    if (WP_CNT == tWP_cnt) begin
                        WR_CMD_FSM_state <= WR_CMD_FSM_WEn_HIGH;
                        WP_CNT <= 6'b0;
                        HOLD_CNT <= 6'b0;
                        CLE <= 1'b1;
                        WEn <= 1'b1;
                        ALE <= 1'b0;
                    end
                    else begin
                        WR_CMD_FSM_state <= WR_CMD_FSM_WEn_LOW;
                        WP_CNT <= WP_CNT + 6'b1;
                        CLE <= 1'b1;
                        WEn <= 1'b0;
                        ALE <= 1'b0;
                    end
                end
                WR_CMD_FSM_WEn_HIGH: begin
                    if (HOLD_CNT == tHOLD_cnt) begin
                        WR_CMD_FSM_state <= WR_CMD_FSM_OVER;
                        HOLD_CNT <= 6'b0;
                        Over <= 1'b1;
                        CLE <= 1'b0;
                        WEn <= 1'b1;
                        ALE <= 1'b0;
                    end
                    else begin
                        WR_CMD_FSM_state <= WR_CMD_FSM_WEn_HIGH;
                        HOLD_CNT <= HOLD_CNT + 6'b1;
                        CLE <= 1'b1;
                        WEn <= 1'b1;
                        ALE <= 1'b0;
                    end
                end
                WR_CMD_FSM_OVER: begin
                    WR_CMD_FSM_state <= WR_CMD_FSM_IDLE;
                    Over <= 1'b0;
                    CLE <= 1'b0;
                    WEn <= 1'b1;
                    ALE <= 1'b0;
                end
                default: begin
                    WR_CMD_FSM_state <= WR_CMD_FSM_IDLE;
                    Over <= 1'b0;
                    CLE <= 1'b0;
                    WEn <= 1'b1;
                    ALE <= 1'b0;
                end
            endcase
        end
    end

endmodule