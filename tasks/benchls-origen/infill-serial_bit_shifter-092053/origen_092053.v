module origen_092053 (
    input [3:0] din,
    input clk,
    input rst,
    output reg dout
);

    reg [1:0] count;

    [MASKED]
endmodule

module tb;
    reg [3:0] din;
    reg clk, rst;
    wire dout;

    PISO uut (
        .din(din),
        .clk(clk),
        .rst(rst),
        .dout(dout)
    );

    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end

    initial begin
        $dumpfile("piso_waveform.vcd");
        $dumpvars(0, tb);

        rst = 1;
        din = 4'b0000;
        #5 rst = 0;

        repeat(10) begin
            #1 din = $random;
        end

        #5 ;
    end
endmodule