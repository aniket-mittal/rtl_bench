// D Flip-Flop Module
module origen_045490 (
    input wire Clk,
    input wire D,
    input wire reset,
    input wire enable,
    output reg Q
);

[MASKED]

endmodule

// Testbench
module Dff_tb;

reg Clk, D, reset, enable;
wire Q;

// Instantiate the DFF
Dff dut (
    .Clk(Clk),
    .D(D),
    .reset(reset),
    .enable(enable),
    .Q(Q)
);

// Clock generation
always begin
    #5 Clk = ~Clk;
end

// Testbench stimulus
initial begin
    // Initialize inputs
    Clk = 0;
    D = 0;
    reset = 0;
    enable = 0;

    // Apply stimuli
    #10 D = 1; reset = 0; enable = 0;
    #10 enable = 1;
    #10 reset = 1;

    // Run for 50ns
    #20 ;
end

// Optional: Monitor changes
initial begin
    $monitor("Time=%0t Clk=%b D=%b reset=%b enable=%b Q=%b", $time, Clk, D, reset, enable, Q);
end

endmodule