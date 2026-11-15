module origen_065521 (
    input wire rst,
    input wire clk,
    input wire ph1,
    input wire ph2,
    input wire ph3,
    input wire ph4,
    input wire prgmReq,
    input wire [1:0] prgmDirection,
    input wire [31:0] prgmAcceleration,
    input wire [31:0] prgmAccelSamples,
    input wire [31:0] prgmCruiseSamples,
    output reg prgmAck,
    output reg busy,
    output reg mDir,
    output reg mStep
);

    reg [1:0] direction;
    reg [31:0] acceleration;
    reg [31:0] accelSamples;
    reg [31:0] cruiseSamples;
    reg [31:0] decelSamples;
    reg [31:0] currentAcceleration;
    reg [63:0] currentVelocity;
    reg [63:0] currentPosition;
    reg [63:0] lastPosition;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            direction <= 2'b00;
            acceleration <= 32'd0;
            accelSamples <= 32'd0;
            cruiseSamples <= 32'd0;
            decelSamples <= 32'd0;
            currentAcceleration <= 32'd0;
            currentVelocity <= 64'd0;
            currentPosition <= 64'd0;
            lastPosition <= 64'd0;
            prgmAck <= 1'b0;
            busy <= 1'b0;
            mDir <= 1'b0;
            mStep <= 1'b0;
        end else begin
            if (ph1) begin
                if (accelSamples > 0) begin
                    accelSamples <= accelSamples - 1;
                    currentAcceleration <= acceleration;
                end else if (cruiseSamples > 0) begin
                    cruiseSamples <= cruiseSamples - 1;
                    currentAcceleration <= 32'd0;
                end else if (decelSamples > 0) begin
                    decelSamples <= decelSamples - 1;
                    currentAcceleration <= -acceleration;
                end else begin
                    busy <= 1'b0;
                end
            end

            if (ph2) begin
                currentVelocity <= currentVelocity + currentAcceleration;
                currentPosition <= currentPosition + currentVelocity;
            end

            if (ph3) begin
                if (currentPosition != lastPosition) begin
                    mDir <= (currentPosition > lastPosition) ? 1'b1 : 1'b0;
                    mStep <= 1'b1;
                end else begin
                    mStep <= 1'b0;
                end
                lastPosition <= currentPosition;
            end

            if (ph4) begin
                if (!busy && prgmReq) begin
                    direction <= prgmDirection;
                    acceleration <= prgmAcceleration;
                    accelSamples <= prgmAccelSamples;
                    cruiseSamples <= prgmCruiseSamples;
                    decelSamples <= prgmAccelSamples;
                    currentAcceleration <= 32'd0;
                    currentVelocity <= 64'd0;
                    currentPosition <= 64'd0;
                    lastPosition <= 64'd0;
                    busy <= 1'b1;
                    prgmAck <= 1'b1;
                end else begin
                    prgmAck <= 1'b0;
                end
            end
        end
    end

endmodule