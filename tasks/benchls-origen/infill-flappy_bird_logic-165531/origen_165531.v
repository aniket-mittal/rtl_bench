module origen_165531(
    input OriginalClk,
    input VSync,
    input [3:0] State,
    input [9:0] BirdXPosition, BirdYPosition,
    input [9:0] PipeXPosition, PipeYPosition,
    input [9:0] SpeedUpXPosition, SpeedUpYPosition,
    input [9:0] HealthXPosition, HealthYPosition,
    output reg RequestSpeedUp,
    output reg RequestHealth,
    output reg RequestDie,
    output reg [7:0] Score,
    output reg [2:0] Health
);

reg [9:0] PrevPipeXPosition, PrevSpeedUpXPosition, PrevHealthXPosition;
reg [9:0] PrevPipeYPosition, PrevSpeedUpYPosition, PrevHealthYPosition;
reg FakeRequestDie;

[MASKED]
endmodule