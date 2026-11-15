module origen_141719 #(
    parameter PIPE_PIPELINE_STAGES = 0,
    parameter TCQ = 1
) (
    input wire pipe_tx_rcvr_det_i,
    input wire pipe_tx_reset_i,
    input wire pipe_tx_rate_i,
    input wire pipe_tx_deemph_i,
    input wire pipe_tx_margin_i,
    input wire pipe_tx_swing_i,
    input wire pipe_clk,
    input wire rst_n,

    output reg pipe_tx_rcvr_det_o,
    output reg pipe_tx_reset_o,
    output reg pipe_tx_rate_o,
    output reg pipe_tx_deemph_o,
    output reg pipe_tx_margin_o,
    output reg pipe_tx_swing_o
);

    reg pipe_tx_rcvr_det_r1, pipe_tx_reset_r1, pipe_tx_rate_r1, pipe_tx_deemph_r1, pipe_tx_margin_r1, pipe_tx_swing_r1;
    reg pipe_tx_rcvr_det_r2, pipe_tx_reset_r2, pipe_tx_rate_r2, pipe_tx_deemph_r2, pipe_tx_margin_r2, pipe_tx_swing_r2;

    always @(posedge pipe_clk or negedge rst_n) begin
        if (!rst_n) begin
            pipe_tx_rcvr_det_r1 <= #TCQ 1'b0;
            pipe_tx_reset_r1 <= #TCQ 1'b0;
            pipe_tx_rate_r1 <= #TCQ 1'b0;
            pipe_tx_deemph_r1 <= #TCQ 1'b0;
            pipe_tx_margin_r1 <= #TCQ 1'b0;
            pipe_tx_swing_r1 <= #TCQ 1'b0;

            pipe_tx_rcvr_det_r2 <= #TCQ 1'b0;
            pipe_tx_reset_r2 <= #TCQ 1'b0;
            pipe_tx_rate_r2 <= #TCQ 1'b0;
            pipe_tx_deemph_r2 <= #TCQ 1'b0;
            pipe_tx_margin_r2 <= #TCQ 1'b0;
            pipe_tx_swing_r2 <= #TCQ 1'b0;

            pipe_tx_rcvr_det_o <= #TCQ 1'b0;
            pipe_tx_reset_o <= #TCQ 1'b0;
            pipe_tx_rate_o <= #TCQ 1'b0;
            pipe_tx_deemph_o <= #TCQ 1'b0;
            pipe_tx_margin_o <= #TCQ 1'b0;
            pipe_tx_swing_o <= #TCQ 1'b0;
        end else begin
            pipe_tx_rcvr_det_r1 <= #TCQ pipe_tx_rcvr_det_i;
            pipe_tx_reset_r1 <= #TCQ pipe_tx_reset_i;
            pipe_tx_rate_r1 <= #TCQ pipe_tx_rate_i;
            pipe_tx_deemph_r1 <= #TCQ pipe_tx_deemph_i;
            pipe_tx_margin_r1 <= #TCQ pipe_tx_margin_i;
            pipe_tx_swing_r1 <= #TCQ pipe_tx_swing_i;

            pipe_tx_rcvr_det_r2 <= #TCQ pipe_tx_rcvr_det_r1;
            pipe_tx_reset_r2 <= #TCQ pipe_tx_reset_r1;
            pipe_tx_rate_r2 <= #TCQ pipe_tx_rate_r1;
            pipe_tx_deemph_r2 <= #TCQ pipe_tx_deemph_r1;
            pipe_tx_margin_r2 <= #TCQ pipe_tx_margin_r1;
            pipe_tx_swing_r2 <= #TCQ pipe_tx_swing_r1;

            case (PIPE_PIPELINE_STAGES)
                0: begin
                    pipe_tx_rcvr_det_o <= #TCQ pipe_tx_rcvr_det_i;
                    pipe_tx_reset_o <= #TCQ pipe_tx_reset_i;
                    pipe_tx_rate_o <= #TCQ pipe_tx_rate_i;
                    pipe_tx_deemph_o <= #TCQ pipe_tx_deemph_i;
                    pipe_tx_margin_o <= #TCQ pipe_tx_margin_i;
                    pipe_tx_swing_o <= #TCQ pipe_tx_swing_i;
                end
                1: begin
                    pipe_tx_rcvr_det_o <= #TCQ pipe_tx_rcvr_det_r1;
                    pipe_tx_reset_o <= #TCQ pipe_tx_reset_r1;
                    pipe_tx_rate_o <= #TCQ pipe_tx_rate_r1;
                    pipe_tx_deemph_o <= #TCQ pipe_tx_deemph_r1;
                    pipe_tx_margin_o <= #TCQ pipe_tx_margin_r1;
                    pipe_tx_swing_o <= #TCQ pipe_tx_swing_r1;
                end
                2: begin
                    pipe_tx_rcvr_det_o <= #TCQ pipe_tx_rcvr_det_r2;
                    pipe_tx_reset_o <= #TCQ pipe_tx_reset_r2;
                    pipe_tx_rate_o <= #TCQ pipe_tx_rate_r2;
                    pipe_tx_deemph_o <= #TCQ pipe_tx_deemph_r2;
                    pipe_tx_margin_o <= #TCQ pipe_tx_margin_r2;
                    pipe_tx_swing_o <= #TCQ pipe_tx_swing_r2;
                end
                default: begin
                    pipe_tx_rcvr_det_o <= #TCQ pipe_tx_rcvr_det_i;
                    pipe_tx_reset_o <= #TCQ pipe_tx_reset_i;
                    pipe_tx_rate_o <= #TCQ pipe_tx_rate_i;
                    pipe_tx_deemph_o <= #TCQ pipe_tx_deemph_i;
                    pipe_tx_margin_o <= #TCQ pipe_tx_margin_i;
                    pipe_tx_swing_o <= #TCQ pipe_tx_swing_i;
                end
            endcase
        end
    end

endmodule