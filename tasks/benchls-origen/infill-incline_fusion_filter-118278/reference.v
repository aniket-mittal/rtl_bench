module origen_118278 (
    input wire clk,
    input wire rst_n,
    input wire vld,
    input wire signed [15:0] roll_rt,
    input wire signed [15:0] yaw_rt,
    input wire signed [15:0] AY,
    input wire signed [15:0] AZ,
    output reg signed [12:0] incline
);

    // Parameters
    parameter YAW_RT_OFFSET = 16'sd20;
    parameter ROLL_THRES = 13'sd2048;
    parameter AY_FACTOR = 16'sd82;
    parameter AZ_FACTOR = 16'sd82;
    parameter FUSION_OFFSET = 24'sd16384;

    // Internal signals
    reg vld_ff, vld_ff2;
    reg signed [15:0] yaw_rt_comp;
    reg signed [23:0] incline_int, roll_int;
    reg signed [15:0] incline_accel, roll_accel;
    reg signed [23:0] incline_fusion, roll_fusion;
    reg signed [12:0] incline_out, roll_out;

    // Two-stage pipeline for data validation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            vld_ff <= 1'b0;
            vld_ff2 <= 1'b0;
        end else begin
            vld_ff <= vld;
            vld_ff2 <= vld_ff;
        end
    end

    // Yaw rate compensation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            yaw_rt_comp <= 16'sd0;
        end else if (vld_ff) begin
            yaw_rt_comp <= yaw_rt - YAW_RT_OFFSET;
        end
    end

    // Integrators
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            incline_int <= 24'sd0;
            roll_int <= 24'sd0;
        end else if (vld_ff2) begin
            incline_int <= incline_int + {{8{yaw_rt_comp[15]}}, yaw_rt_comp} + incline_fusion;
            roll_int <= roll_int + {{8{roll_rt[15]}}, roll_rt} + roll_fusion;
        end
    end

    // Acceleration processing
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            incline_accel <= 16'sd0;
            roll_accel <= 16'sd0;
        end else if (vld_ff) begin
            incline_accel <= (AY * AY_FACTOR) >>> 7;
            roll_accel <= (AZ * AZ_FACTOR) >>> 7;
        end
    end

    // Sensor fusion
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            incline_fusion <= 24'sd0;
            roll_fusion <= 24'sd0;
        end else if (vld_ff2) begin
            incline_fusion <= (incline_int[23:8] < incline_accel) ? FUSION_OFFSET : -FUSION_OFFSET;
            roll_fusion <= (roll_int[23:8] < roll_accel) ? FUSION_OFFSET : -FUSION_OFFSET;
        end
    end

    // Output extraction
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            incline_out <= 13'sd0;
            roll_out <= 13'sd0;
        end else if (vld_ff2) begin
            incline_out <= incline_int[23:11];
            roll_out <= roll_int[23:11];
        end
    end

    // Output conditioning
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            incline <= 13'sd0;
        end else if (vld_ff2) begin
            incline <= (roll_out > ROLL_THRES || roll_out < -ROLL_THRES) ? 13'sd0 : incline_out;
        end
    end

endmodule