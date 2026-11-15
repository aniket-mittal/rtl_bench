module origen_181647(
    input clock,
    input [7:0] user_input,
    input reset_signal,
    output reg [4:0] ypos,
    output reg game_over,
    output reg correct,
    output reg [7:0] letter
);

reg [25:0] fall_clock;
reg [7:0] random_letter;

initial begin
    fall_clock = 0;
    ypos = 0;
    random_letter = 27; // ASCII value for Escape character
end

always @(posedge clock) begin
    random_letter = random_letter + 1;
end

always @(posedge clock) begin
    if (reset_signal) begin
        letter = random_letter;
        correct = 0;
        game_over = 0;
        ypos = 23;
        fall_clock = 0;
    end
    else begin
        if (user_input == letter) begin
            correct = 1;
        end
        else begin
            correct = 0;
        end

        if (fall_clock >= 50_000_000) begin
            fall_clock = 0;
            if (ypos < 22) begin
                ypos = ypos + 1;
            end
            else begin
                game_over = 1;
            end
        end
        else begin
            fall_clock = fall_clock + 1;
        end
    end
end
endmodule