`define GATE_WIDTH 10
`define GATE_UPPER_BOUND 50
`define GATE_LOWER_BOUND 30

module origen_202818(
    input clk,
    input rst,
    input player_1_win,
    input player_2_win,
    input restart,
    output reg game_over,
    output reg [1:0] who_win,
    output reg [7:0] player_1_score,
    output reg [7:0] player_2_score
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            player_1_score <= 0;
            player_2_score <= 0;
            game_over <= 0;
            who_win <= 0;
        end
        else begin
            if (player_1_win) begin
                player_1_score <= player_1_score + 1;
            end
            if (player_2_win) begin
                player_2_score <= player_2_score + 1;
            end

            if (player_1_score == 8'd255 || player_2_score == 8'd255) begin
                game_over <= 1;
                if (player_1_score > player_2_score) begin
                    who_win <= 1;
                end
                else if (player_1_score < player_2_score) begin
                    who_win <= 2;
                end
                else begin
                    who_win <= 0; // Tie
                end
            end

            if (restart) begin
                player_1_score <= 0;
                player_2_score <= 0;
                game_over <= 0;
                who_win <= 0;
            end
        end
    end

endmodule