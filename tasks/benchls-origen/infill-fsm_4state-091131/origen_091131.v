module origen_091131(
    input [1:0] s,
    input clk,
    input res,
    output reg [1:0] state
);

    parameter st0 = 2'b00, st1 = 2'b01, st2 = 2'b10, st3 = 2'b11;

    [MASKED]
endmodule

module testbench;
    reg [1:0] ts;
    reg tclk, tres;
    wire [1:0] tstate;

    strange dut(.s(ts), .clk(tclk), .res(tres), .state(tstate));

    initial begin
        $dumpfile("strange.vcd");
        $dumpvars(0, testbench);

        tclk = 1;
        tres = 1;
        ts = 2'b00;

        #1 tres = 0;
        #1 tres = 1;

        #2 ts = 2'b01;
        #2 ts = 2'b10;
        #2 ts = 2'b11;
        #2 ts = 2'b00;
        #2 ts = 2'b01;
        #2 ts = 2'b10;
        #2 ts = 2'b11;
        #2 ts = 2'b00;
        #2 ts = 2'b01;
        #2 ts = 2'b10;
        #2 ts = 2'b11;
        #2 ts = 2'b00;

        #12 ;
    end

    always #1 tclk = ~tclk;
endmodule