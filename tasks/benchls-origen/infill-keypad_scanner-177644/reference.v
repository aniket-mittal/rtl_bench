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

always @(posedge CLK) begin
    if (!isPush) begin
        if (C == 4'b1111) begin
            startSet = 0;
            posCnt = 0;
            case (round)
                0: R = 4'b0111;
                1: R = 4'b1011;
                2: R = 4'b1101;
                3: R = 4'b1110;
            endcase
            round = round + 1;
        end
    end else begin
        if (C == 4'b1111) begin
            negCnt = 0;
            if (posCnt < 4000)
                posCnt = posCnt + 1;
            if (posCnt == 4000)
                isPush = 0;
        end else if (negCnt < 4000)
            negCnt = negCnt + 1;
        if (negCnt == 4000) begin
            startSet = 1;
            negCnt = 0;
            posCnt = 0;
            isPush = 0;
        end
    end
end

endmodule