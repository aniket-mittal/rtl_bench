// D Flip-Flop Module
module origen_100437 (
    input Clock,
    input Reset,
    input d,
    output reg q
);

[MASKED]

endmodule

// Testbench Module
module Dflipflop_testbench;

reg clk, rst, d;
wire q;

// Instantiate the D flip-flop
Dflipflop dut (
    .Clock(clk),
    .Reset(rst),
    .d(d),
    .q(q)
);

// Clock generation
parameter CLOCK_PERIOD = 100;
initial clk = 0;
always #(CLOCK_PERIOD/2) clk = ~clk;

// Test sequence
initial begin
    // Initialize inputs
    rst = 1;
    d = 0;

    // Reset for one clock cycle
    #CLOCK_PERIOD rst = 0;

    // Set d to 1 for three clock cycles
    d = 1;
    #(3*CLOCK_PERIOD);

    // Set d to 0 for three clock cycles
    d = 0;
    #(3*CLOCK_PERIOD);

    // Set d to 1 for three clock cycles
    d = 1;
    #(3*CLOCK_PERIOD);

    // End simulation
    ;
end

endmodule