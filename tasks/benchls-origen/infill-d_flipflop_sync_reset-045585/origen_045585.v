// D Flip-Flop Module
module origen_045585 (
    input wire clk,
    input wire in,
    input wire rst,
    output reg q,
    output wire q1
);

[MASKED]

assign q1 = ~q;

endmodule

// Testbench Module
module tb_dsync;

reg clk, in, rst;
wire q, q1;

// Instantiate the D flip-flop
d_sync dut (
    .clk(clk),
    .in(in),
    .rst(rst),
    .q(q),
    .q1(q1)
);

// Clock generation
always #1 clk = ~clk;

// Stimulus and simulation control
initial begin
    $dumpfile("tb_dsync.vcd");
    $dumpvars(0, tb_dsync);

    clk = 0;
    rst = 1;
    in = 0;

    #2 rst = 0;
    #1 in = 1;
    #1 rst = 1;
    #1 rst = 0;

    #3 ;
end

// Output monitoring
always @(posedge clk) begin
    ;
end

endmodule