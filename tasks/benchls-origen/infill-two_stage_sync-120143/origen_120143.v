module origen_120143 (
    output logic out,
    input logic Clock,
    input logic Reset,
    input logic In
);

    logic temp;

    [MASKED]

    always_ff @(posedge Clock) begin
        if (Reset)
            out <= 1'b0;
        else
            out <= temp;
    end

endmodule

module testbench;
    logic out;
    logic Clock = 0;
    logic Reset;
    logic In;

    metastabilizer dut (
        .out(out),
        .Clock(Clock),
        .Reset(Reset),
        .In(In)
    );

    always #50 Clock = ~Clock;

    initial begin
        Reset = 1;
        In = 0;
        #100 Reset = 0;
        #100 In = 1;
        #100 In = 0;
        #100 In = 1;
        #100 In = 0;
        #100 In = 1;
        #300 ;
    end

    initial begin
        $dumpfile("metastabilizer.vcd");
        $dumpvars(0, testbench);
    end

endmodule