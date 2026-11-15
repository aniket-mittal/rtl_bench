module origen_082117(
    input wire Clk,
    input wire Reset,
    input wire timer_clk,
    input wire top_monster_ctrl,
    input wire top_random,
    input wire play_flag,
    input wire gameover_ctrl,
    output reg [2:0] top_monster_sm,
    output reg top_gameover,
    output wire q_TM_Init,
    output wire q_TM_Empty,
    output wire q_TM_Full
);

    // State definitions
    localparam [2:0] INIT = 3'b000,
                     EMPTY = 3'b001,
                     FULL = 3'b010;

    reg [2:0] state, next_state;
    reg [3:0] top_timer;
    reg [3:0] top_delay;
    reg generate_monster;

    // State output assignments
    assign q_TM_Init = (state == INIT);
    assign q_TM_Empty = (state == EMPTY);
    assign q_TM_Full = (state == FULL);

    // Timer for monster presence
    always @(posedge timer_clk or posedge Reset) begin
        if (Reset)
            top_timer <= 4'b0000;
        else if (state == FULL)
            top_timer <= top_timer + 1'b1;
        else
            top_timer <= 4'b0000;
    end

    // Delay counter between monsters
    always @(posedge timer_clk or posedge Reset) begin
        if (Reset)
            top_delay <= 4'b0000;
        else if (state == EMPTY)
            top_delay <= top_delay + 1'b1;
        else
            top_delay <= 4'b0000;
    end

    // State machine logic
    always @(posedge Clk or posedge Reset) begin
        if (Reset)
            state <= INIT;
        else
            state <= next_state;
    end

    // Next state and output logic
    always @(*) begin
        next_state = state;
        top_monster_sm = 3'b000;
        top_gameover = 1'b0;
        generate_monster = 1'b0;

        case (state)
            INIT: begin
                if (play_flag)
                    next_state = EMPTY;
            end

            EMPTY: begin
                if (gameover_ctrl)
                    next_state = INIT;
                else if (top_monster_ctrl)
                    next_state = FULL;
                
                if (top_delay >= 4'b0011)
                    generate_monster = 1'b1;
                
                if (top_random && generate_monster)
                    top_monster_sm = 3'b001;
            end

            FULL: begin
                if (gameover_ctrl)
                    next_state = INIT;
                else if (!top_monster_ctrl)
                    next_state = EMPTY;
                
                if (top_timer >= 4'b1111) begin
                    top_gameover = 1'b1;
                    next_state = INIT;
                end

                top_monster_sm = 3'b010;
            end

            default: next_state = INIT;
        endcase
    end

endmodule