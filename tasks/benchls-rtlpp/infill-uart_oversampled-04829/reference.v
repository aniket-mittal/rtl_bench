module rtlpp_04829 (
    input clk,
    input baudX7,
    input [7:0] txData,
    input txStb,
    output tx,
    output txRdy,
    input rx,
    output [7:0] rxData,
    input rxAck,
    output rxRdy
);

reg baudTick = 0;
reg [2:0] baud7Xcnt = 0;
reg [3:0] rxCnt = 0;
reg [8:0] rxBuf = 0;
reg [3:0] nextMiddle = 0;
reg rxReady = 0;
reg [9:0] txBuf = 0;
reg [3:0] txCnt = 0;
reg txTriggered = 0;

always @(posedge clk) begin
    if (baudX7) baud7Xcnt <= baud7Xcnt + 1;
    if (baud7Xcnt > 6) begin
        baud7Xcnt <= 0;
        baudTick <= 1;
    end else begin
        baudTick <= 0;
    end
end

always @(posedge clk) begin
    if (rxAck) rxReady <= 0;
    if (baudX7) begin
        if (rxCnt == 0) begin
            if (~rx) begin
                nextMiddle <= 8;
                rxCnt <= rxCnt + 1;
                rxBuf <= 0;
                rxReady <= 0;
            end
        end else if (nextMiddle != 0) begin
            nextMiddle <= nextMiddle - 1;
        end else begin
            rxBuf <= rxBuf >> 1;
            rxBuf[8] <= rx;
            rxCnt <= rxCnt + 1;
            nextMiddle <= 6;
            if (rxCnt > 8) begin
                rxCnt <= 0;
                rxReady <= 1;
            end
        end
    end
end

assign rxData = rxBuf[7:0];
assign rxRdy = rxReady;

always @(posedge clk) begin
    if (txStb) begin
        txBuf <= {1'b0, ~txData, 1'b1};
        txTriggered <= 1;
    end else if (txTriggered & baudTick) begin
        txTriggered <= 0;
        txCnt <= 9;
    end else if (txCnt > 0 & baudTick) begin
        txBuf <= txBuf >> 1;
        txCnt <= txCnt - 1;
    end
end

assign tx = ~txBuf[0] | txTriggered;
assign txRdy = (txCnt == 0) & ~txTriggered;

endmodule