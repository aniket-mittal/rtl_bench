module origen_105929 #(
    parameter FAST_SIM = 1'b0
)(
    input wire clk,
    input wire rst_n,
    input wire cadence,
    output reg cadence_filt
);

    reg ff1, metaStable, oldSignal;
    reg [15:0] stableCount;
    wire stable;

    // Two-stage synchronizer for metastability handling
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ff1 <= 1'b0;
            metaStable <= 1'b0;
        end else begin
            ff1 <= cadence;
            metaStable <= ff1;
        end
    end

    // Detect signal changes
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            oldSignal <= 1'b0;
        end else begin
            oldSignal <= metaStable;
        end
    end

    // Stability counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            stableCount <= 16'd0;
        end else if (metaStable != oldSignal) begin
            stableCount <= 16'd0;
        end else if (!stable) begin
            stableCount <= stableCount + 1'b1;
        end
    end

    // Determine stability based on FAST_SIM parameter
    assign stable = FAST_SIM ? (&stableCount[8:0]) : (&stableCount);

    // Update filtered output
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cadence_filt <= 1'b0;
        end else if (stable) begin
            cadence_filt <= metaStable;
        end
    end

endmodule