module origen_154229 #(
    parameter CLK_FREQUENCY = 100_000_000,
    parameter PWM_PERIOD    = 1000
)
(
    input  wire        in_rst,
    input  wire        in_clk,
    input  wire [15:0] pwm_thres,
    output reg         pwm_out,
    output wire        out_reg_period_start
);

localparam TIMER_1US_CONTER  = CLK_FREQUENCY / 1_000_000;
localparam PWM_PERIOD_CONTER = (CLK_FREQUENCY * PWM_PERIOD) / 1_000_000_000;

reg  [7:0] timer_cnter;
reg        timer_1us;
reg [15:0] count;

assign out_reg_period_start = (count == 16'h0000) && (timer_cnter == 8'h00) && timer_1us;

[MASKED]

endmodule