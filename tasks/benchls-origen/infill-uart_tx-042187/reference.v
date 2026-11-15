module origen_042187 #(
    parameter CLOCK_FREQUENCY = 50_000_000,
    parameter BAUD_RATE = 9600
) (
    input wire clockIN,
    input wire nTxResetIN,
    input wire [7:0] txDataIN,
    input wire txLoadIN,
    output wire txIdleOUT,
    output wire txReadyOUT,
    output wire txOUT
);

    localparam BAUD_DIVIDER = CLOCK_FREQUENCY / BAUD_RATE;
    localparam COUNTER_WIDTH = $clog2(BAUD_DIVIDER);

    reg [COUNTER_WIDTH-1:0] txClkCounter;
    reg txBaudClk;
    reg [9:0] txReg;
    reg [3:0] txCounter;

    always @(posedge clockIN or negedge nTxResetIN) begin
        if (!nTxResetIN) begin
            txClkCounter <= 0;
            txBaudClk <= 0;
        end else begin
            if (txClkCounter == BAUD_DIVIDER - 1) begin
                txClkCounter <= 0;
                txBaudClk <= 1;
            end else begin
                txClkCounter <= txClkCounter + 1;
                txBaudClk <= 0;
            end
        end
    end

    always @(posedge clockIN or negedge nTxResetIN) begin
        if (!nTxResetIN) begin
            txReg <= 10'b1111111111;
            txCounter <= 0;
        end else if (txLoadIN && txIdleOUT) begin
            txReg <= {1'b1, txDataIN, 1'b0};
            txCounter <= 10;
        end else if (txBaudClk && !txIdleOUT) begin
            txReg <= {1'b1, txReg[9:1]};
            txCounter <= txCounter - 1;
        end
    end

    assign txOUT = txReg[0];
    assign txIdleOUT = (txCounter == 0);
    assign txReadyOUT = txIdleOUT;

endmodule