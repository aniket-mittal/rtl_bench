module origen_138494 (
    input wire clk,
    input wire reset,
    input wire [15:0] current_a,
    input wire [15:0] current_b,
    input wire [15:0] current_c,
    input wire [15:0] position,
    input wire [15:0] speed_ref,
    output wire [15:0] clark_x,
    output wire [15:0] clark_y,
    output wire [15:0] park_x,
    output wire [15:0] park_y,
    output wire [15:0] error_d,
    output wire [15:0] error_q,
    output wire [15:0] v_a,
    output wire [15:0] v_b,
    output wire [15:0] v_c,
    output wire [7:0] pwm_a,
    output wire [7:0] pwm_b,
    output wire [7:0] pwm_c,
    output wire [15:0] integrator_d,
    output wire [15:0] integrator_q
);

    // Parameters
    parameter MAX_SPEED = 16'd3000;
    parameter RATED_VOLTAGE = 16'd24;
    parameter RATED_POWER = 16'd1000;

    // Internal signals
    reg [15:0] clark_x_reg, clark_y_reg;
    reg [15:0] park_x_reg, park_y_reg;
    reg [15:0] error_d_reg, error_q_reg;
    reg [15:0] v_a_reg, v_b_reg, v_c_reg;
    reg [7:0] pwm_a_reg, pwm_b_reg, pwm_c_reg;
    reg [15:0] integrator_d_reg, integrator_q_reg;

    // Trigonometric functions (simplified for synthesis)
    function [15:0] cos;
        input [15:0] angle;
        begin
            cos = angle[15:14] == 2'b00 ? 16'h7FFF :
                  angle[15:14] == 2'b01 ? -16'h7FFF :
                  angle[15:14] == 2'b10 ? -16'h7FFF :
                  16'h7FFF;
        end
    endfunction

    function [15:0] sin;
        input [15:0] angle;
        begin
            sin = angle[15:14] == 2'b00 ? 16'h7FFF :
                  angle[15:14] == 2'b01 ? 16'h7FFF :
                  angle[15:14] == 2'b10 ? -16'h7FFF :
                  -16'h7FFF;
        end
    endfunction

    // Clarke transformation
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            clark_x_reg <= 16'd0;
            clark_y_reg <= 16'd0;
        end else begin
            clark_x_reg <= current_a;
            clark_y_reg <= ((current_b - current_c) * 16'd577) >>> 10; // 1/sqrt(3) ≈ 0.577
        end
    end

    // Park transformation
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            park_x_reg <= 16'd0;
            park_y_reg <= 16'd0;
        end else begin
            park_x_reg <= ((clark_x_reg * cos(position)) + (clark_y_reg * sin(position))) >>> 14;
            park_y_reg <= ((clark_y_reg * cos(position)) - (clark_x_reg * sin(position))) >>> 14;
        end
    end

    // PI Controller
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            error_d_reg <= 16'd0;
            error_q_reg <= 16'd0;
            integrator_d_reg <= 16'd0;
            integrator_q_reg <= 16'd0;
        end else begin
            error_d_reg <= speed_ref - park_x_reg;
            error_q_reg <= 16'd0 - park_y_reg;
            integrator_d_reg <= integrator_d_reg + error_d_reg;
            integrator_q_reg <= integrator_q_reg + error_q_reg;
        end
    end

    // Inverse Park transformation
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            v_a_reg <= 16'd0;
            v_b_reg <= 16'd0;
            v_c_reg <= 16'd0;
        end else begin
            v_a_reg <= ((error_d_reg * cos(position)) - (error_q_reg * sin(position))) >>> 14;
            v_b_reg <= ((error_d_reg * cos(position + 16'd21845)) - (error_q_reg * sin(position + 16'd21845))) >>> 14; // 21845 ≈ 2π/3
            v_c_reg <= ((error_d_reg * cos(position + 16'd43690)) - (error_q_reg * sin(position + 16'd43690))) >>> 14; // 43690 ≈ 4π/3
        end
    end

    // PWM generation
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pwm_a_reg <= 8'd0;
            pwm_b_reg <= 8'd0;
            pwm_c_reg <= 8'd0;
        end else begin
            pwm_a_reg <= (v_a_reg * 8'd255) / RATED_VOLTAGE;
            pwm_b_reg <= (v_b_reg * 8'd255) / RATED_VOLTAGE;
            pwm_c_reg <= (v_c_reg * 8'd255) / RATED_VOLTAGE;
        end
    end

    // Output assignments
    assign clark_x = clark_x_reg;
    assign clark_y = clark_y_reg;
    assign park_x = park_x_reg;
    assign park_y = park_y_reg;
    assign error_d = error_d_reg;
    assign error_q = error_q_reg;
    assign v_a = v_a_reg;
    assign v_b = v_b_reg;
    assign v_c = v_c_reg;
    assign pwm_a = pwm_a_reg;
    assign pwm_b = pwm_b_reg;
    assign pwm_c = pwm_c_reg;
    assign integrator_d = integrator_d_reg;
    assign integrator_q = integrator_q_reg;

endmodule