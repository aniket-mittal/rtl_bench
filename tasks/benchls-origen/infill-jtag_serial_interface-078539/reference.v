module origen_078539 (
    input wire [7:0] iTxD_DATA,
    input wire iTxD_Start,
    input wire iRST_n,
    input wire iCLK,
    input wire TDI,
    input wire TCS,
    input wire TCK,
    output wire [7:0] oRxD_DATA,
    output wire oTxD_Done,
    output wire oRxD_Ready,
    output wire TDO
);

    wire tck_sync;
    reg tck_prev;

    always @(posedge iCLK or negedge iRST_n) begin
        if (!iRST_n)
            tck_prev <= 1'b0;
        else
            tck_prev <= TCK;
    end

    assign tck_sync = TCK & ~tck_prev;

    JTAG_REC receiver (
        .TDI(TDI),
        .TCS(TCS),
        .TCK(tck_sync),
        .iRST_n(iRST_n),
        .iCLK(iCLK),
        .oRxD_DATA(oRxD_DATA),
        .oRxD_Ready(oRxD_Ready)
    );

    JTAG_TRANS transmitter (
        .iTxD_DATA(iTxD_DATA),
        .iTxD_Start(iTxD_Start),
        .TCS(TCS),
        .TCK(tck_sync),
        .iRST_n(iRST_n),
        .iCLK(iCLK),
        .oTxD_Done(oTxD_Done),
        .TDO(TDO)
    );

endmodule

module JTAG_REC (
    input wire TDI,
    input wire TCS,
    input wire TCK,
    input wire iRST_n,
    input wire iCLK,
    output reg [7:0] oRxD_DATA,
    output reg oRxD_Ready
);

    reg [2:0] rCont;
    reg [7:0] rShiftReg;

    always @(posedge iCLK or negedge iRST_n) begin
        if (!iRST_n) begin
            rCont <= 3'b000;
            rShiftReg <= 8'b0;
            oRxD_DATA <= 8'b0;
            oRxD_Ready <= 1'b0;
        end else if (TCS) begin
            rCont <= 3'b000;
            oRxD_Ready <= 1'b0;
        end else if (TCK) begin
            rShiftReg <= {rShiftReg[6:0], TDI};
            rCont <= rCont + 1'b1;
            if (rCont == 3'b111) begin
                oRxD_DATA <= {rShiftReg[6:0], TDI};
                oRxD_Ready <= 1'b1;
            end else begin
                oRxD_Ready <= 1'b0;
            end
        end
    end

endmodule

module JTAG_TRANS (
    input wire [7:0] iTxD_DATA,
    input wire iTxD_Start,
    input wire TCS,
    input wire TCK,
    input wire iRST_n,
    input wire iCLK,
    output reg oTxD_Done,
    output reg TDO
);

    reg [2:0] rCont;
    reg [7:0] rShiftReg;
    reg rTxActive;

    always @(posedge iCLK or negedge iRST_n) begin
        if (!iRST_n) begin
            rCont <= 3'b000;
            rShiftReg <= 8'b0;
            oTxD_Done <= 1'b0;
            TDO <= 1'b0;
            rTxActive <= 1'b0;
        end else if (TCS) begin
            rCont <= 3'b000;
            oTxD_Done <= 1'b0;
            rTxActive <= 1'b0;
        end else if (iTxD_Start && !rTxActive) begin
            rShiftReg <= iTxD_DATA;
            rTxActive <= 1'b1;
            oTxD_Done <= 1'b0;
        end else if (TCK && rTxActive) begin
            TDO <= rShiftReg[7];
            rShiftReg <= {rShiftReg[6:0], 1'b0};
            rCont <= rCont + 1'b1;
            if (rCont == 3'b111) begin
                oTxD_Done <= 1'b1;
                rTxActive <= 1'b0;
            end
        end
    end

endmodule