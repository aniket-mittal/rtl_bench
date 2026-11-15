module origen_062084 (
    output reg [23:0] tp_data,
    output reg        tp_vld,
    input      [23:0] cfg_tp_base,
    input      [23:0] cfg_tp_step,
    input      [23:0] cfg_ad_fix,
    input      [1:0]  cfg_ad_tp,
    input      [2:0]  cfg_sample,
    input      [3:0]  mod_id,
    input             syn_vld,
    input             clk_sys,
    input             rst_n
);

reg [23:0] cfg_tp_base_reg, cfg_tp_step_reg;
reg cfg_tp_change;
reg [15:0] tp_period;
reg [15:0] cnt_cycle;
reg period_vld;
reg [23:0] tp1_data, tp2_data, tp3_data;

// Configuration storage
always @(posedge clk_sys or negedge rst_n) begin
    if (!rst_n) begin
        cfg_tp_base_reg <= 24'h0;
        cfg_tp_step_reg <= 24'h0;
        cfg_tp_change <= 1'b0;
    end else begin
        cfg_tp_base_reg <= cfg_tp_base;
        cfg_tp_step_reg <= cfg_tp_step;
        cfg_tp_change <= (cfg_tp_base_reg != cfg_tp_base) || (cfg_tp_step_reg != cfg_tp_step);
    end
end

// Test pattern period
always @(*) begin
    case (cfg_sample)
        3'd0: tp_period = `ifdef SIM 16'd9 `else 16'd999 `endif;
        3'd1: tp_period = `ifdef SIM 16'd19 `else 16'd1999 `endif;
        3'd2: tp_period = `ifdef SIM 16'd39 `else 16'd3999 `endif;
        3'd3: tp_period = `ifdef SIM 16'd79 `else 16'd7999 `endif;
        3'd4: tp_period = `ifdef SIM 16'd159 `else 16'd15999 `endif;
        default: tp_period = `ifdef SIM 16'd9 `else 16'd999 `endif;
    endcase
end

// Cycle counter
always @(posedge clk_sys or negedge rst_n) begin
    if (!rst_n) begin
        cnt_cycle <= 16'd0;
        period_vld <= 1'b0;
    end else if (syn_vld) begin
        cnt_cycle <= 16'd0;
        period_vld <= 1'b0;
    end else if (cnt_cycle == tp_period - 1) begin
        cnt_cycle <= 16'd0;
        period_vld <= 1'b1;
    end else begin
        cnt_cycle <= cnt_cycle + 1'b1;
        period_vld <= 1'b0;
    end
end

// Test pattern generation
always @(posedge clk_sys or negedge rst_n) begin
    if (!rst_n) begin
        tp1_data <= 24'h0;
        tp2_data <= 24'h0;
        tp3_data <= 24'h0;
    end else begin
        tp1_data <= {20'h0, mod_id};
        if (period_vld || cfg_tp_change)
            tp2_data <= (period_vld) ? tp2_data + cfg_tp_step_reg : cfg_tp_base_reg;
        tp3_data <= cfg_ad_fix;
    end
end

// Output control
always @(posedge clk_sys or negedge rst_n) begin
    if (!rst_n) begin
        tp_data <= 24'h0;
        tp_vld <= 1'b0;
    end else begin
        tp_vld <= period_vld;
        case (cfg_ad_tp)
            2'd0: tp_data <= tp1_data;
            2'd1: tp_data <= tp2_data;
            2'd2: tp_data <= tp3_data;
            default: tp_data <= 24'h0;
        endcase
    end
end

endmodule