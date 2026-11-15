module origen_092570 (
    input wire RST_N,
    input wire CLK,
    input wire TX_PAUSE_ENABLE,
    input wire [15:0] PAUSE_QUANTA,
    input wire PAUSE_QUANTA_VALID,
    input wire PAUSE_QUANTA_SUB,
    output reg PAUSE_QUANTA_COMPLETE,
    output reg PAUSE_APPLY
);

reg PauseQuantaValidDl1, PauseQuantaValidDl2;
reg [15:0] PauseQuanta;
reg [15:0] PauseQuantaCount;
reg PauseApply;

always @(posedge CLK or negedge RST_N) begin
    if (!RST_N) begin
        PauseQuantaValidDl1 <= 1'b0;
        PauseQuantaValidDl2 <= 1'b0;
        PauseQuanta <= 16'b0;
        PauseQuantaCount <= 16'b0;
        PauseApply <= 1'b0;
        PAUSE_QUANTA_COMPLETE <= 1'b0;
        PAUSE_APPLY <= 1'b0;
    end else begin
        // Delay registers for PAUSE_QUANTA_VALID
        PauseQuantaValidDl1 <= PAUSE_QUANTA_VALID;
        PauseQuantaValidDl2 <= PauseQuantaValidDl1;

        // Detect rising edge of PAUSE_QUANTA_VALID
        if (PAUSE_QUANTA_VALID && !PauseQuantaValidDl1) begin
            PauseQuanta <= PAUSE_QUANTA;
            PauseQuantaCount <= PAUSE_QUANTA;
        end

        // Decrement PauseQuantaCount
        if (PAUSE_QUANTA_SUB && PauseQuantaCount > 16'b0) begin
            PauseQuantaCount <= PauseQuantaCount - 1'b1;
        end

        // Set PAUSE_APPLY
        if (TX_PAUSE_ENABLE && PauseQuantaCount > 16'b0) begin
            PauseApply <= 1'b1;
        end else if (PauseQuantaCount == 16'b0) begin
            PauseApply <= 1'b0;
        end

        // Set PAUSE_QUANTA_COMPLETE
        PAUSE_QUANTA_COMPLETE <= PauseQuantaValidDl1 && PauseQuantaValidDl2;

        // Output PAUSE_APPLY
        PAUSE_APPLY <= PauseApply;
    end
end

endmodule