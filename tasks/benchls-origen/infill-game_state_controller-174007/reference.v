module origen_174007(
    input clock,
    input reset_game_control,
    input play_game,
    input all_bricks_down,
    input ball_down,
    input play_again,
    input startup_done,
    input over_done,
    output reg reset_startup_counter,
    output reg enable_startup_counter,
    output reg reset_over_counter,
    output reg enable_over_counter,
    output reg startup_plot,
    output reg over_plot,
    output reg reset_brick_count,
    output reg enable_brick_count,
    output reg run_game,
    output reg reset_control,
    output reg [1:0] sel_screen
);

    localparam RESET_GAME = 2'b00;
    localparam SHOW_STARTUP_SCREEN = 2'b01;
    localparam PLAY_GAME = 2'b10;
    localparam GAME_OVER_SCREEN = 2'b11;

    reg [1:0] current_state, next_state;

    always @(posedge clock or negedge reset_game_control) begin
        if (!reset_game_control) begin
            current_state <= RESET_GAME;
        end else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        case (current_state)
            RESET_GAME: begin
                next_state = SHOW_STARTUP_SCREEN;
                reset_startup_counter = 1'b1;
                enable_startup_counter = 1'b0;
                reset_over_counter = 1'b1;
                enable_over_counter = 1'b0;
                startup_plot = 1'b1;
                over_plot = 1'b0;
                reset_brick_count = 1'b1;
                enable_brick_count = 1'b0;
                run_game = 1'b0;
                reset_control = 1'b1;
                sel_screen = RESET_GAME;
            end
            SHOW_STARTUP_SCREEN: begin
                next_state = (play_game) ? PLAY_GAME : SHOW_STARTUP_SCREEN;
                reset_startup_counter = 1'b0;
                enable_startup_counter = 1'b1;
                reset_over_counter = 1'b1;
                enable_over_counter = 1'b0;
                startup_plot = 1'b1;
                over_plot = 1'b0;
                reset_brick_count = 1'b1;
                enable_brick_count = 1'b0;
                run_game = 1'b0;
                reset_control = 1'b0;
                sel_screen = SHOW_STARTUP_SCREEN;
            end
            PLAY_GAME: begin
                next_state = (all_bricks_down) ? SHOW_STARTUP_SCREEN : (ball_down) ? GAME_OVER_SCREEN : PLAY_GAME;
                reset_startup_counter = 1'b1;
                enable_startup_counter = 1'b0;
                reset_over_counter = 1'b1;
                enable_over_counter = 1'b0;
                startup_plot = 1'b0;
                over_plot = 1'b0;
                reset_brick_count = 1'b0;
                enable_brick_count = 1'b1;
                run_game = 1'b1;
                reset_control = 1'b0;
                sel_screen = PLAY_GAME;
            end
            GAME_OVER_SCREEN: begin
                next_state = (play_again) ? RESET_GAME : GAME_OVER_SCREEN;
                reset_startup_counter = 1'b1;
                enable_startup_counter = 1'b0;
                reset_over_counter = 1'b0;
                enable_over_counter = 1'b1;
                startup_plot = 1'b0;
                over_plot = 1'b1;
                reset_brick_count = 1'b1;
                enable_brick_count = 1'b0;
                run_game = 1'b0;
                reset_control = 1'b0;
                sel_screen = GAME_OVER_SCREEN;
            end
        endcase
    end

endmodule