module origen_189845 #(
    parameter led_on_time = 62_500_000 // 62.5 ms at 1 MHz clock
) (
    input  wire        i_clk,
    input  wire        i_rst_n,
    output reg         o_reset_clk_pulse
);

    reg                r_reset_test;
    reg                r_reset_valid_flag;
    reg [31:0]         rv_time_cnt;

    localparam RESET_CHECK_S  = 1'b0;
    localparam CLOCK_CHECK_S  = 1'b1;
    reg                state;

    [MASKED]

endmodule