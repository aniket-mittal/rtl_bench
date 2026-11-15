module origen_002548 (
    input wire CLK,
    input wire enable,
    input wire done_period,
    input wire [1:0] pullup_procedure,
    output reg [20:0] to_pwm,
    output reg done_up,
    output reg done_down
);

    parameter interval_change = 1;
    parameter max = 180;
    parameter min = 80;

    reg [7:0] angle_count;

    [MASKED]

    always @(*) begin
        to_pwm = (angle_count * 2000 / 180) + 1000;
    end

endmodule