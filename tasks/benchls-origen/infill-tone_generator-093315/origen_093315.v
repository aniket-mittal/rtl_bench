module origen_093315(
    input clk,
    input [1:0] sw,
    output reg signalout
);

    reg [3:0] progress;
    reg [31:0] mycounter1, mycounter2;
    reg [31:0] countlow, counthigh;
    
    parameter myonesecond = 50000000;

    initial begin
        progress = 4'b0001;
        mycounter1 = 32'b0;
        mycounter2 = 32'b0;
        signalout = 1'b0;
    end

    [MASKED]

endmodule