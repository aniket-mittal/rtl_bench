module origen_096771 #(
    parameter CLOCK_FREQUENCY = 50000000,
    parameter BAUD_RATE = 115200,
    parameter PARITY = 0
)(
    input wire clockIN,
    input wire nTxResetIN,
    input wire [7:0] txDataIN,
    input wire txLoadIN,
    output wire txIdleOUT,
    output wire txReadyOUT,
    output reg txOUT
);

    localparam BAUD_DIVIDER = CLOCK_FREQUENCY / BAUD_RATE;
    localparam COUNTER_WIDTH = $clog2(BAUD_DIVIDER);

    reg [COUNTER_WIDTH-1:0] txClkCounter;
    reg txBaudClk;
    reg [3:0] txCounter;
    reg [7:0] txShiftReg;
    reg txActive;
    reg parityBit;

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
            txCounter <= 4'h0;
            txShiftReg <= 8'h00;
            txOUT <= 1'b1;
            txActive <= 1'b0;
            parityBit <= 1'b0;
        end else if (txBaudClk) begin
            if (!txActive && txLoadIN) begin
                txActive <= 1'b1;
                txShiftReg <= txDataIN;
                txCounter <= 4'hC;
                parityBit <= (PARITY == 1) ? 1'b1 : 1'b0;
            end else if (txActive) begin
                case (txCounter)
                    4'hC: begin // Start bit
                        txOUT <= 1'b0;
                        txCounter <= txCounter - 1;
                    end
                    4'hB, 4'hA, 4'h9, 4'h8, 4'h7, 4'h6, 4'h5, 4'h4: begin // Data bits
                        txOUT <= txShiftReg[0];
                        txShiftReg <= {1'b0, txShiftReg[7:1]};
                        txCounter <= txCounter - 1;
                        if (PARITY != 0) begin
                            parityBit <= parityBit ^ txShiftReg[0];
                        end
                    end
                    4'h3: begin // Parity bit
                        if (PARITY != 0) begin
                            txOUT <= (PARITY == 1) ? ~parityBit : parityBit;
                            txCounter <= txCounter - 1;
                        end else begin
                            txOUT <= 1'b1;
                            txCounter <= 4'h1;
                        end
                    end
                    4'h2, 4'h1: begin // Stop bit(s)
                        txOUT <= 1'b1;
                        txCounter <= txCounter - 1;
                    end
                    4'h0: begin // Idle state
                        txOUT <= 1'b1;
                        txActive <= 1'b0;
                    end
                endcase
            end
        end
    end

    assign txReadyOUT = !txActive;
    assign txIdleOUT = txReadyOUT && !txLoadIN;

endmodule