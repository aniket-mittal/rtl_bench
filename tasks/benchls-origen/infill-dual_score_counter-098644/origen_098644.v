module origen_098644(
    input wire clk,
    input wire reset,
    input wire p1_scored,
    input wire p2_scored,
    output reg [31:0] p1_score,
    output reg [31:0] p2_score
);

    [MASKED]

endmodule

module scoreboard_testbench();
    reg clk;
    reg reset;
    reg p1_scored;
    reg p2_scored;
    wire [31:0] p1_score;
    wire [31:0] p2_score;

    scoreboard dut (.*);

    initial begin
        clk = 0;
        forever #20 clk = ~clk;
    end

    initial begin
        reset = 1;
        p1_scored = 0;
        p2_scored = 0;
        #40 reset = 0;

        #40 p1_scored = 1;
        #40 p1_scored = 0;

        #40;

        #40 p2_scored = 1;
        #40 p2_scored = 0;

        #40 p1_scored = 1;
        #40 p1_scored = 0;

        #40;

        #40 ;
    end

endmodule