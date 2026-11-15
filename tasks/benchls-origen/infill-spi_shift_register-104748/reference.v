module origen_104748 (
    input wire sck,
    input wire serialDataIn,
    input wire setNewData,
    input wire [7:0] dataToSend,
    output wire serialDataOut,
    output reg [7:0] dataReceived
);

    reg [7:0] shiftReg;

    always @(negedge sck or posedge setNewData) begin
        if (setNewData)
            shiftReg <= {dataToSend[0], dataToSend[1], dataToSend[2], dataToSend[3],
                         dataToSend[4], dataToSend[5], dataToSend[6], dataToSend[7]};
        else
            shiftReg <= {1'b0, shiftReg[7:1]};
    end

    always @(posedge sck) begin
        dataReceived <= {dataReceived[6:0], serialDataIn};
    end

    assign serialDataOut = shiftReg[0];

endmodule

module dataCtrl (
    input wire cs,
    input wire sck,
    output wire setNewData
);

    reg [3:0] bitCount;
    reg byteOut, byteOutNegEdge;

    always @(posedge sck or posedge cs) begin
        if (cs) begin
            bitCount <= 4'b0000;
            byteOut <= 1'b1;
        end else begin
            bitCount <= bitCount + 1'b1;
            byteOut <= (bitCount[2:0] == 3'b111);
        end
    end

    always @(negedge sck or posedge cs) begin
        if (cs)
            byteOutNegEdge <= 1'b1;
        else
            byteOutNegEdge <= byteOut;
    end

    reg setNewDataLatch;

    always @(byteOutNegEdge or byteOut) begin
        if (byteOutNegEdge)
            setNewDataLatch <= byteOut;
    end

    assign setNewData = setNewDataLatch;

endmodule