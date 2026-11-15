module origen_086314(
    input wire in1, in2, reset, clock,
    output reg out1, out2
);

    // Synchronous flip-flop
    always @(posedge clock) begin
        if (reset)
            out1 <= 1'b0;
        else
            out1 <= in1;
    end

    // Asynchronous flip-flop
    [MASKED]

endmodule

module test;
    reg in1, in2, reset, clock;
    wire out1, out2;

    sync_async uut (
        .in1(in1),
        .in2(in2),
        .reset(reset),
        .clock(clock),
        .out1(out1),
        .out2(out2)
    );

    initial begin
        $dumpfile("sync_async_test.vcd");
        $dumpvars(0, test);
        $monitor("Time=%0t in1=%b in2=%b reset=%b clock=%b out1=%b out2=%b",
                 $time, in1, in2, reset, clock, out1, out2);

        clock = 0;
        in1 = 0; in2 = 0; reset = 0;
        #10 in1 = 1; in2 = 1;
        #10 reset = 1;
        #10 reset = 0;
        #10 in1 = 0; in2 = 0;
        #10 in1 = 1; in2 = 1;
        #10 reset = 1;
        #10 in1 = 0; in2 = 0;
        #10 reset = 0;
        #10 ;
    end

    always #4 clock = ~clock;

endmodule