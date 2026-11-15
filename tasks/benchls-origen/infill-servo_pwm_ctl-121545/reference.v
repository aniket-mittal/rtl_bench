module origen_121545 #(
    parameter C_CLK_FREQ_HZ = 100_000_000,
    parameter C_PERIOD_US = 20_000,
    parameter C_DUTY_MIN_US = 500,
    parameter C_DUTY_MAX_US = 1800
) (
    input wire resetn,
    input wire clk,
    input wire signed [7:0] position,
    input wire signed [7:0] trim,
    input wire enable,
    output reg servo_ctl
);

    localparam PERIOD_COUNT = C_CLK_FREQ_HZ / 1_000_000 * C_PERIOD_US;
    localparam DUTY_MIN_COUNT = C_CLK_FREQ_HZ / 1_000_000 * C_DUTY_MIN_US;
    localparam DUTY_MAX_COUNT = C_CLK_FREQ_HZ / 1_000_000 * C_DUTY_MAX_US;
    localparam DUTY_RANGE = DUTY_MAX_COUNT - DUTY_MIN_COUNT;
    localparam DUTY_CENTER = (DUTY_MAX_COUNT + DUTY_MIN_COUNT) / 2;

    reg [31:0] pwm_counter;
    reg signed [7:0] current_position;
    reg signed [7:0] current_trim;
    reg [31:0] target_position;

    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            pwm_counter <= 0;
            current_position <= 0;
            current_trim <= 0;
            target_position <= DUTY_CENTER;
            servo_ctl <= 1'b0;
        end else begin
            if (pwm_counter >= PERIOD_COUNT - 1 || !enable) begin
                pwm_counter <= 0;
                current_position <= position;
                current_trim <= trim;
                target_position <= DUTY_CENTER + 
                    ((DUTY_RANGE * $signed({1'b0, position})) >>> 9) +
                    ((DUTY_RANGE * $signed({1'b0, trim})) >>> 12);
            end else begin
                pwm_counter <= pwm_counter + 1;
            end

            if (enable && (pwm_counter <= target_position || 
                           pwm_counter <= DUTY_MIN_COUNT || 
                           pwm_counter <= DUTY_MAX_COUNT)) begin
                servo_ctl <= 1'b1;
            end else begin
                servo_ctl <= 1'b0;
            end
        end
    end

endmodule