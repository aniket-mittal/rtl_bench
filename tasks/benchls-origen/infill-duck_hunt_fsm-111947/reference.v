module origen_111947 (
    input logic Clk,
    input logic Reset,
    input logic start,
    input logic no_shots_left,
    input logic flew_away,
    input logic game_over,
    input logic bird_shot,
    input logic duck_ded_done,
    input logic dog_start,
    input logic dog_duck,
    output logic new_round,
    output logic reset_shots,
    output logic reset_score,
    output logic reset_birds,
    output logic [2:0] state
);

    typedef enum logic [3:0] {
        Start   = 4'b0000,
        P1      = 4'b0001,
        P1_1    = 4'b0010,
        P2      = 4'b0011,
        P2_1    = 4'b0100,
        P2_2    = 4'b0101,
        P2_2_1  = 4'b0110,
        P2_3    = 4'b0111,
        P3      = 4'b1000,
        Done    = 4'b1001
    } state_t;

    state_t current_state, next_state;

    always_ff @(posedge Clk) begin
        if (Reset)
            current_state <= Start;
        else
            current_state <= next_state;
    end

    always_comb begin
        next_state = current_state;
        new_round = 1'b0;
        reset_shots = 1'b0;
        reset_score = 1'b0;
        reset_birds = 1'b0;

        case (current_state)
            Start: begin
                reset_shots = 1'b1;
                reset_score = 1'b1;
                reset_birds = 1'b1;
                if (start)
                    next_state = P1_1;
            end
            P1_1: begin
                if (dog_start)
                    next_state = P1;
            end
            P1: begin
                new_round = 1'b1;
                next_state = P2;
            end
            P2: begin
                if (no_shots_left)
                    next_state = P2_1;
                else if (flew_away)
                    next_state = P3;
                else if (bird_shot)
                    next_state = P2_2;
            end
            P2_1: begin
                if (flew_away)
                    next_state = P3;
            end
            P2_2: begin
                if (duck_ded_done)
                    next_state = P2_3;
            end
            P2_3: begin
                if (dog_duck)
                    next_state = P3;
            end
            P3: begin
                reset_shots = 1'b1;
                if (game_over)
                    next_state = Done;
                else
                    next_state = P1;
            end
            Done: begin
                reset_score = 1'b1;
                reset_birds = 1'b1;
                if (start)
                    next_state = Start;
            end
            default: next_state = Start;
        endcase
    end

    assign state = current_state[2:0];

endmodule