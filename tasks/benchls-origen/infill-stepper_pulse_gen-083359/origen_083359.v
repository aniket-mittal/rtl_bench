module origen_083359 #(
    parameter WIDTH = 16
) (
    input wire clk,
    input wire rst,
    input wire drv_dir,
    input wire enable,
    input wire counter_en,
    input wire [2*WIDTH-1:0] drv_period,
    input wire [2*WIDTH-1:0] PULSE_NUMBER,
    output reg [2*WIDTH-1:0] drv_pulse
);

    reg pulse_invert;
    reg drv_step;
    reg [WIDTH-1:0] count_N;
    reg [WIDTH-1:0] drv_count;

    [MASKED]

endmodule