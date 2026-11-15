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

    [MASKED]

endmodule