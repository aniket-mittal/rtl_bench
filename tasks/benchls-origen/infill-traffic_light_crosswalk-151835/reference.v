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

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= STATE_RED;
            light <= 2'b01;
            Q <= 1'b0;
            blink_red <= 1'b0;
            blink_flag <= 1'b0;
            white_flag <= 1'b1;
            timer <= 8'b0;
        end
        else begin
            case (state)
                STATE_RED: begin
                    if (cross_button) begin
                        Q <= 1'b1;
                    end
                    else begin
                        Q <= 1'b0;
                    end
                    light <= 2'b01;
                    blink_red <= 1'b0;
                    white_flag <= 1'b0;
                    if (red_trffc_light) begin
                        state <= STATE_WHITE;
                        timer <= 8'b11111111;
                    end
                    else begin
                        state <= STATE_ERROR;
                    end
                end
                STATE_WHITE: begin
                    Q <= 1'b0;
                    light <= 2'b10;
                    blink_red <= 1'b0;
                    white_flag <= 1'b1;
                    if (timer == 8'b0) begin
                        state <= STATE_BLINK_RED;
                        timer <= 8'b00001010;
                    end
                    else begin
                        timer <= timer - 1'b1;
                    end
                end
                STATE_BLINK_RED: begin
                    Q <= 1'b0;
                    light[0] <= ~blink_flag;
                    blink_red <= 1'b1;
                    white_flag <= 1'b0;
                    if (timer == 8'b0) begin
                        state <= STATE_RED;
                    end
                    else begin
                        timer <= timer - 1'b1;
                        blink_flag <= ~blink_flag;
                    end
                end
                STATE_ERROR: begin
                    Q <= 1'b0;
                    light <= 2'b11;
                    blink_red <= 1'b1;
                    white_flag <= 1'b0;
                    if (red_trffc_light) begin
                        state <= STATE_RED;
                    end
                end
                default: begin
                    state <= STATE_ERROR;
                end
            endcase
        end
    end

    assign walk_light = white_flag;
    assign stop_light = light[0] | (~white_flag & blink_red);
    assign cross_rqst = Q;
    assign debug_q = Q;

endmodule