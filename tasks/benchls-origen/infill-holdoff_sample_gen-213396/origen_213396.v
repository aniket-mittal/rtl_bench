module origen_213396 (
    input clk,
    input rst,
    input if1a_ready_in,
    output reg if1a_valid_out,
    output reg [9:0] if1a_counter_out
);

    // Parameters
    parameter HOLDOFF = 20;
    parameter DISTANCE = 6;

    // Registers
    reg [7:0] holdoff_counter;
    reg [3:0] distance_counter;
    reg valid;

    // Combinational logic
    wire holdoff_counting = (holdoff_counter != 0);
    wire distance_restart = (distance_counter == DISTANCE);

    // Sequential logic
    [MASKED]

    // Output assignments
    assign if1a_valid_out = valid;

endmodule