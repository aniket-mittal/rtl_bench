module origen_131554 (
    input wire MRxClk,
    input wire Reset,
    input wire MRxDV,
    input wire RxValid,
    input wire StateIdle,
    input wire StateFFS,
    input wire StatePreamble,
    input wire [1:0] StateData,
    input wire StateFrmCrc,
    output wire TotalRecvNibCntEq0,
    output reg [15:0] TotalRecvNibCnt,
    output reg [7:0] RxRamAddr,
    output reg [3:0] FrmCrcNibCnt,
    output wire FrmCrcStateEnd
);

    // TotalRecvNibCnt counter
    always @(posedge MRxClk or posedge Reset) begin
        if (Reset)
            TotalRecvNibCnt <= 16'b0;
        else if (StateIdle && !MRxDV)
            TotalRecvNibCnt <= 16'b0;
        else if (RxValid)
            TotalRecvNibCnt <= TotalRecvNibCnt + 1'b1;
    end

    // TotalRecvNibCntEq0 signal
    assign TotalRecvNibCntEq0 = (TotalRecvNibCnt == 16'b0);

    // RxRamAddr counter
    always @(posedge MRxClk or posedge Reset) begin
        if (Reset)
            RxRamAddr <= 8'b0;
        else if (StateIdle || StateFFS || StatePreamble)
            RxRamAddr <= 8'b0;
        else if (RxValid)
            RxRamAddr <= RxRamAddr + 1'b1;
    end

    // FrmCrcNibCnt counter
    always @(posedge MRxClk or posedge Reset) begin
        if (Reset)
            FrmCrcNibCnt <= 4'b0;
        else if (StateIdle)
            FrmCrcNibCnt <= 4'b0;
        else if (StateFrmCrc && RxValid)
            FrmCrcNibCnt <= FrmCrcNibCnt + 1'b1;
    end

    // FrmCrcStateEnd signal
    assign FrmCrcStateEnd = StateFrmCrc && (FrmCrcNibCnt == 4'd7);

endmodule