module origen_145625 (
    input wire clk,
    input wire reset,
    input wire p1_move,
    input wire p2_move,
    input wire p1_win,
    input wire p2_win,
    input wire tie,
    output reg turno_p1,
    output reg turno_p2,
    output reg win_game,
    output reg loss_game,
    output reg tie_game,
    output reg send_state
);

    // State encoding
    localparam [2:0] 
        P1_MOVE  = 3'b000,
        P1_STATUS = 3'b001,
        P2_MOVE  = 3'b010,
        P2_STATUS = 3'b011,
        WIN     = 3'b100,
        TIE     = 3'b101,
        LOSS    = 3'b110;

    reg [2:0] current_state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= P1_MOVE;
        else
            current_state <= next_state;
    end

    // Next state logic
    [MASKED]

    // Output logic
    always @(*) begin
        turno_p1 = 0;
        turno_p2 = 0;
        win_game = 0;
        loss_game = 0;
        tie_game = 0;
        send_state = 0;

        case (current_state)
            P1_MOVE: begin
                turno_p1 = 1;
                send_state = 1;
            end
            P2_MOVE: begin
                turno_p2 = 1;
                send_state = 1;
            end
            WIN: begin
                win_game = 1;
                send_state = 1;
            end
            TIE: begin
                tie_game = 1;
                send_state = 1;
            end
            LOSS: begin
                loss_game = 1;
                send_state = 1;
            end
        endcase
    end

endmodule