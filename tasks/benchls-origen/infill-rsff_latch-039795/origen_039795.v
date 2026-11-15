// RSFF Module
module origen_039795 (
    input wire clk,
    input wire S,
    input wire R,
    input wire Qin,
    output reg Qout,
    output wire Qoutbar
);

    [MASKED]

    assign Qoutbar = (S == 1'b1 && R == 1'b1) ? 1'bx : ~Qout;

endmodule

// Testbench
module RSFF_tb;
    reg clk, S, R, Qin;
    wire Qout, Qoutbar;

    RSFF dut (
        .clk(clk),
        .S(S),
        .R(R),
        .Qin(Qin),
        .Qout(Qout),
        .Qoutbar(Qoutbar)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("Time=%0t S=%b R=%b Qin=%b Qout=%b Qoutbar=%b", $time, S, R, Qin, Qout, Qoutbar);

        S = 0; R = 0; Qin = 0;
        #10 S = 0; R = 0; Qin = 1;
        #10 S = 0; R = 1; Qin = 0;
        #10 S = 0; R = 1; Qin = 1;
        #10 S = 1; R = 0; Qin = 0;
        #10 S = 1; R = 0; Qin = 1;
        #10 S = 1; R = 1; Qin = 0;
        #10 S = 1; R = 1; Qin = 1;
        #10 ;
    end
endmodule