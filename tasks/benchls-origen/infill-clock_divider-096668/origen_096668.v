module origen_096668 (
    input wire CLOCK_50,
    input wire reset,
    input wire [23:0] period,
    output reg newClock
);

reg [23:0] counter;
wire [23:0] halfPeriod;

assign halfPeriod = period >> 1;

[MASKED]

endmodule

// Testbench
module tb_getNewClock();
    reg CLOCK_50;
    reg reset;
    reg [23:0] period;
    wire newClock;

    getNewClock uut (
        .CLOCK_50(CLOCK_50),
        .reset(reset),
        .period(period),
        .newClock(newClock)
    );

    initial begin
        CLOCK_50 = 0;
        reset = 0;
        period = 24'd382;

        #50 reset = 1;
        #100 reset = 0;

        #200000 ;
    end

    always #50 CLOCK_50 = ~CLOCK_50;

    initial begin
        $dumpfile("getNewClock.vcd");
        $dumpvars(0, tb_getNewClock);
    end
endmodule