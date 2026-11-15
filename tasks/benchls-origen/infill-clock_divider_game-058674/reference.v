module origen_058674 (
    input wire Clock,
    input wire [3:0] Difficulty,
    output reg DisplayClock,
    output reg GameClock,
    output reg ScoreDisplayClock
);

    // Parameters for clock division
    parameter displayFlipTime = 1;
    parameter gameClockFlipTime = 500000;
    parameter scoreDisplayFlipTime = 250000;

    // Internal counters
    reg [31:0] displayCtr;
    reg [31:0] gameCtr;
    reg [31:0] scoreDisplayCtr;

    // Clock generation logic
    always @(posedge Clock) begin
        // DisplayClock generation
        if (displayCtr == displayFlipTime - 1) begin
            DisplayClock <= ~DisplayClock;
            displayCtr <= 0;
        end else begin
            displayCtr <= displayCtr + 1;
        end

        // GameClock generation
        if (gameCtr >= gameClockFlipTime - 1) begin
            GameClock <= ~GameClock;
            gameCtr <= 0;
        end else begin
            gameCtr <= gameCtr + Difficulty;
        end

        // ScoreDisplayClock generation
        if (scoreDisplayCtr == scoreDisplayFlipTime - 1) begin
            ScoreDisplayClock <= ~ScoreDisplayClock;
            scoreDisplayCtr <= 0;
        end else begin
            scoreDisplayCtr <= scoreDisplayCtr + 1;
        end
    end

    // Initial values
    initial begin
        DisplayClock = 0;
        GameClock = 0;
        ScoreDisplayClock = 0;
        displayCtr = 0;
        gameCtr = 0;
        scoreDisplayCtr = 0;
    end

endmodule