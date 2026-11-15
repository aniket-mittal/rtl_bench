// Main Module
module origen_116042(
    input wire Clr,
    input wire Clock,
    output reg [2:0] Q
);

    parameter MaxCount = 3'b111;  // Maximum count value (8)

    [MASKED]

endmodule

// Testbench Module
module shift_tb;

    reg Clr;
    reg Clock;
    wire [2:0] Q;

    // Instantiate the Unit Under Test (UUT)
    shift_HELLO uut (
        .Clr(Clr),
        .Clock(Clock),
        .Q(Q)
    );

    // Clock generation
    initial begin
        Clock = 0;
        forever #10 Clock = ~Clock;
    end

    // Test sequence
    initial begin
        // Initialize inputs
        Clr = 1;

        // Wait for 400 time units with Clr asserted
        #400;

        // De-assert Clr and run for 200 time units
        Clr = 0;
        #200;

        // Stop simulation
        ;
    end

    // Optional: Monitor for observing outputs
    initial begin
        $monitor("Time=%0t Clr=%b Clock=%b Q=%b", $time, Clr, Clock, Q);
    end

endmodule