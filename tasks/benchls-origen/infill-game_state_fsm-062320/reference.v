module origen_062320(
    input CLK,
    input RESET,
    input BTNL,
    input BTNT,
    input BTNR,
    input BTND,
    input [3:0] SCORE,
    output [1:0] STATE_OUT
);

    reg [1:0] Curr_state, Next_state;

    // State definitions
    localparam INITIAL = 2'b00;
    localparam GAME_IN_PROGRESS = 2'b01;
    localparam GAME_OVER = 2'b10;

    // State register
    always @(posedge CLK or posedge RESET) begin
        if (RESET)
            Curr_state <= INITIAL;
        else
            Curr_state <= Next_state;
    end

    // Next state logic
    always @(*) begin
        case (Curr_state)
            INITIAL: begin
                if (BTNL | BTNT | BTNR | BTND)
                    Next_state = GAME_IN_PROGRESS;
                else
                    Next_state = INITIAL;
            end
            GAME_IN_PROGRESS: begin
                if (SCORE == 4'b0011)
                    Next_state = GAME_OVER;
                else
                    Next_state = GAME_IN_PROGRESS;
            end
            GAME_OVER: begin
                Next_state = GAME_OVER;
            end
            default: begin
                Next_state = INITIAL;
            end
        endcase
    end

    // Output logic
    assign STATE_OUT = Curr_state;

endmodule