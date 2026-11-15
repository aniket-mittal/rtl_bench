module origen_096668 (
    input wire CLOCK_50,
    input wire reset,
    input wire [23:0] period,
    output reg newClock
);

reg [23:0] counter;
wire [23:0] halfPeriod;

assign halfPeriod = period >> 1;

always @(posedge CLOCK_50) begin
    if (reset) begin
        counter <= 24'd0;
        newClock <= 1'b0;
    end else begin
        if (counter >= halfPeriod - 1) begin
            counter <= 24'd0;
            newClock <= ~newClock;
        end else begin
            counter <= counter + 1'b1;
        end
    end
end

endmodule

// Testbench
