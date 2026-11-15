module origen_156311 #(
    parameter N_BLOCKS = 10,
    parameter EXTRA_DELAY = 0
) (
    input i_clock,
    input i_reset,
    input i_enable,
    input i_valid,
    input i_restart,
    output reg o_start_of_lane
);

    reg [31:0] counter;
    reg state;
    localparam INIT = 1'b0, LOCKED = 1'b1;

    [MASKED]

endmodule