module origen_066342 #(
    parameter CLOCK_FREQUENCY = 50_000_000,
    parameter PWM_FREQUENCY = 1_000,
    parameter MAX_VALUE = 1000,
    parameter DEEP_FILL_FACTOR = 10
) (
    input wire IN_CLOCK,
    input wire IN_RESET,
    input wire IN_ENABLE,
    input wire [DEEP_FILL_FACTOR-1:0] IN_FILL_FACTOR,
    output reg OUT_PWM_SIGNAL
);

    localparam PERIOD = CLOCK_FREQUENCY / PWM_FREQUENCY;
    localparam COUNTER_WIDTH = $clog2(PERIOD);

    reg [COUNTER_WIDTH-1:0] period_counter;
    reg [COUNTER_WIDTH-1:0] high_cycles;
    reg REG_RESET_SEPARATE;

    always @(posedge IN_CLOCK or posedge IN_RESET) begin
        if (IN_RESET) begin
            REG_RESET_SEPARATE <= 1'b1;
        end else begin
            REG_RESET_SEPARATE <= 1'b0;
        end
    end

    always @(posedge IN_CLOCK) begin
        if (REG_RESET_SEPARATE) begin
            period_counter <= 0;
            high_cycles <= (PERIOD * IN_FILL_FACTOR) / MAX_VALUE;
            OUT_PWM_SIGNAL <= (IN_FILL_FACTOR > 0) ? 1'b1 : 1'b0;
        end else begin
            if (IN_ENABLE) begin
                if (period_counter < PERIOD - 1) begin
                    period_counter <= period_counter + 1;
                end else begin
                    period_counter <= 0;
                    high_cycles <= (PERIOD * IN_FILL_FACTOR) / MAX_VALUE;
                end

                if (period_counter < high_cycles) begin
                    OUT_PWM_SIGNAL <= 1'b1;
                end else begin
                    OUT_PWM_SIGNAL <= 1'b0;
                end
            end else begin
                OUT_PWM_SIGNAL <= 1'b0;
            end
        end
    end

endmodule