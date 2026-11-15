module origen_148613 #(
    parameter PIPE_PIPELINE_STAGES = 0
) (
    input wire pipe_tx_rcvr_det_i,
    input wire pipe_tx_reset_i,
    input wire pipe_tx_rate_i,
    input wire pipe_tx_deemph_i,
    input wire [2:0] pipe_tx_margin_i,
    input wire pipe_tx_swing_i,
    input wire pipe_clk,
    input wire rst_n,

    output reg pipe_tx_rcvr_det_o,
    output reg pipe_tx_reset_o,
    output reg pipe_tx_rate_o,
    output reg pipe_tx_deemph_o,
    output reg [2:0] pipe_tx_margin_o,
    output reg pipe_tx_swing_o
);

    // Internal signals for pipeline stages
    reg pipe_tx_rcvr_det_r1, pipe_tx_rcvr_det_r2;
    reg pipe_tx_reset_r1, pipe_tx_reset_r2;
    reg pipe_tx_rate_r1, pipe_tx_rate_r2;
    reg pipe_tx_deemph_r1, pipe_tx_deemph_r2;
    reg [2:0] pipe_tx_margin_r1, pipe_tx_margin_r2;
    reg pipe_tx_swing_r1, pipe_tx_swing_r2;

    // Pipeline logic
    always @(posedge pipe_clk or negedge rst_n) begin
        if (!rst_n) begin
            pipe_tx_rcvr_det_r1 <= 1'b0;
            pipe_tx_reset_r1 <= 1'b1;
            pipe_tx_rate_r1 <= 1'b0;
            pipe_tx_deemph_r1 <= 1'b0;
            pipe_tx_margin_r1 <= 3'b000;
            pipe_tx_swing_r1 <= 1'b0;

            pipe_tx_rcvr_det_r2 <= 1'b0;
            pipe_tx_reset_r2 <= 1'b1;
            pipe_tx_rate_r2 <= 1'b0;
            pipe_tx_deemph_r2 <= 1'b0;
            pipe_tx_margin_r2 <= 3'b000;
            pipe_tx_swing_r2 <= 1'b0;
        end else begin
            pipe_tx_rcvr_det_r1 <= pipe_tx_rcvr_det_i;
            pipe_tx_reset_r1 <= pipe_tx_reset_i;
            pipe_tx_rate_r1 <= pipe_tx_rate_i;
            pipe_tx_deemph_r1 <= pipe_tx_deemph_i;
            pipe_tx_margin_r1 <= pipe_tx_margin_i;
            pipe_tx_swing_r1 <= pipe_tx_swing_i;

            pipe_tx_rcvr_det_r2 <= pipe_tx_rcvr_det_r1;
            pipe_tx_reset_r2 <= pipe_tx_reset_r1;
            pipe_tx_rate_r2 <= pipe_tx_rate_r1;
            pipe_tx_deemph_r2 <= pipe_tx_deemph_r1;
            pipe_tx_margin_r2 <= pipe_tx_margin_r1;
            pipe_tx_swing_r2 <= pipe_tx_swing_r1;
        end
    end

    // Output selection based on PIPE_PIPELINE_STAGES
    always @(*) begin
        case (PIPE_PIPELINE_STAGES)
            0: begin
                pipe_tx_rcvr_det_o = pipe_tx_rcvr_det_i;
                pipe_tx_reset_o = pipe_tx_reset_i;
                pipe_tx_rate_o = pipe_tx_rate_i;
                pipe_tx_deemph_o = pipe_tx_deemph_i;
                pipe_tx_margin_o = pipe_tx_margin_i;
                pipe_tx_swing_o = pipe_tx_swing_i;
            end
            1: begin
                pipe_tx_rcvr_det_o = pipe_tx_rcvr_det_r1;
                pipe_tx_reset_o = pipe_tx_reset_r1;
                pipe_tx_rate_o = pipe_tx_rate_r1;
                pipe_tx_deemph_o = pipe_tx_deemph_r1;
                pipe_tx_margin_o = pipe_tx_margin_r1;
                pipe_tx_swing_o = pipe_tx_swing_r1;
            end
            2: begin
                pipe_tx_rcvr_det_o = pipe_tx_rcvr_det_r2;
                pipe_tx_reset_o = pipe_tx_reset_r2;
                pipe_tx_rate_o = pipe_tx_rate_r2;
                pipe_tx_deemph_o = pipe_tx_deemph_r2;
                pipe_tx_margin_o = pipe_tx_margin_r2;
                pipe_tx_swing_o = pipe_tx_swing_r2;
            end
            default: begin
                pipe_tx_rcvr_det_o = pipe_tx_rcvr_det_i;
                pipe_tx_reset_o = pipe_tx_reset_i;
                pipe_tx_rate_o = pipe_tx_rate_i;
                pipe_tx_deemph_o = pipe_tx_deemph_i;
                pipe_tx_margin_o = pipe_tx_margin_i;
                pipe_tx_swing_o = pipe_tx_swing_i;
            end
        endcase
    end

endmodule