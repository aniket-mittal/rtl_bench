module origen_177644(
    input CLK,
    input [3:0] C,
    output reg [3:0] R,
    output reg startSet
);

reg [1:0] round;
reg isPush;
reg [31:0] negCnt;
reg [31:0] posCnt;

initial begin
    R = 4'b0111;
    startSet = 0;
    round = 0;
    isPush = 0;
    negCnt = 0;
    posCnt = 0;
end

[MASKED]

endmodule