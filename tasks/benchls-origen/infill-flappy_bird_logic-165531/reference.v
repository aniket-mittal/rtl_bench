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

always @(posedge VSync) begin
    // Update previous positions
    PrevPipeXPosition <= PipeXPosition;
    PrevPipeYPosition <= PipeYPosition;
    PrevSpeedUpXPosition <= SpeedUpXPosition;
    PrevSpeedUpYPosition <= SpeedUpYPosition;
    PrevHealthXPosition <= HealthXPosition;
    PrevHealthYPosition <= HealthYPosition;

    // Calculate horizontal distance between bird and pipe
    if (BirdXPosition > PipeXPosition) begin
        if ((BirdXPosition - PipeXPosition) < 50) begin
            FakeRequestDie <= 1'b1;
        end else begin
            FakeRequestDie <= 1'b0;
        end
    end else begin
        if ((PipeXPosition - BirdXPosition) < 50) begin
            FakeRequestDie <= 1'b1;
        end else begin
            FakeRequestDie <= 1'b0;
        end
    end

    // Update score, health, and RequestDie
    case (State)
        4'b0001: begin // Running
            if (BirdXPosition > PrevPipeXPosition) begin
                Score <= Score + 1'b1;
            end
            if (FakeRequestDie) begin
                Health <= Health - 1'b1;
                RequestDie <= 1'b1;
            end else begin
                RequestDie <= 1'b0;
            end
            if ((BirdYPosition >= HealthYPosition - 15) && (BirdYPosition <= HealthYPosition + 15) &&
                (BirdXPosition >= HealthXPosition - 15) && (BirdXPosition <= HealthXPosition + 15)) begin
                Health <= Health + 1'b1;
                RequestHealth <= 1'b1;
            end else begin
                RequestHealth <= 1'b0;
            end
            if ((BirdYPosition >= SpeedUpYPosition - 15) && (BirdYPosition <= SpeedUpYPosition + 15) &&
                (BirdXPosition >= SpeedUpXPosition - 15) && (BirdXPosition <= SpeedUpXPosition + 15)) begin
                RequestSpeedUp <= 1'b1;
            end else begin
                RequestSpeedUp <= 1'b0;
            end
        end
        4'b0010: begin // Pause
            // Maintain score and health
            RequestDie <= 1'b0;
            RequestHealth <= 1'b0;
            RequestSpeedUp <= 1'b0;
        end
        4'b0100: begin // Welcome
            Score <= 8'b0;
            Health <= 3'b001;
            RequestDie <= 1'b0;
            RequestHealth <= 1'b0;
            RequestSpeedUp <= 1'b0;
        end
        4'b1000: begin // GameOver
            // Maintain score and health
            RequestDie <= 1'b0;
            RequestHealth <= 1'b0;
            RequestSpeedUp <= 1'b0;
        end
        default: begin
            // Maintain score and RequestDie
            RequestHealth <= 1'b0;
            RequestSpeedUp <= 1'b0;
        end
    endcase
end
endmodule