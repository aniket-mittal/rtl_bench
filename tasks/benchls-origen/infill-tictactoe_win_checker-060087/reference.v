module origen_060087(
    input [1:0] pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9,
    input no_space,
    output reg player_win,
    output reg computer_win,
    output reg drawn
);

    parameter player = 6'b010101;
    parameter computer = 6'b101010;

    wire [5:0] win_chance1, win_chance2, win_chance3, win_chance4;
    wire [5:0] win_chance5, win_chance6, win_chance7, win_chance8;

    assign win_chance1 = {pos1, pos2, pos3};
    assign win_chance2 = {pos4, pos5, pos6};
    assign win_chance3 = {pos7, pos8, pos9};
    assign win_chance4 = {pos1, pos4, pos7};
    assign win_chance5 = {pos2, pos5, pos8};
    assign win_chance6 = {pos3, pos6, pos9};
    assign win_chance7 = {pos1, pos5, pos9};
    assign win_chance8 = {pos3, pos5, pos7};

    wire temp1, temp2;

    assign temp1 = (win_chance1 == player) | (win_chance2 == player) | (win_chance3 == player) |
                   (win_chance4 == player) | (win_chance5 == player) | (win_chance6 == player) |
                   (win_chance7 == player) | (win_chance8 == player);

    assign temp2 = (win_chance1 == computer) | (win_chance2 == computer) | (win_chance3 == computer) |
                   (win_chance4 == computer) | (win_chance5 == computer) | (win_chance6 == computer) |
                   (win_chance7 == computer) | (win_chance8 == computer);

    always @(*) begin
        if (temp1) begin
            player_win = 1'b1;
            computer_win = 1'b0;
            drawn = 1'b0;
        end
        else if (temp2) begin
            player_win = 1'b0;
            computer_win = 1'b1;
            drawn = 1'b0;
        end
        else if (no_space) begin
            player_win = 1'b0;
            computer_win = 1'b0;
            drawn = 1'b1;
        end
        else begin
            player_win = 1'b0;
            computer_win = 1'b0;
            drawn = 1'b0;
        end
    end

endmodule