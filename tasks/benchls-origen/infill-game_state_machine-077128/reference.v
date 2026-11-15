module origen_077128(
    input wire Clk,
    input wire BtnU,
    input wire Reset,
    input wire gameover_ctrl,
    output reg play_flag,
    output wire q_Init,
    output wire q_Play,
    output wire q_GameOver
);

    // State encoding
    localparam INIT     = 3'b001;
    localparam PLAY     = 3'b010;
    localparam GAMEOVER = 3'b100;
    localparam UNK      = 3'bXXX;

    reg [2:0] state;

    // State machine
    always @(posedge Clk or posedge Reset) begin
        if (Reset) begin
            state <= INIT;
            play_flag <= 1'b0;
        end else begin
            case (state)
                INIT: begin
                    if (play_flag) begin
                        state <= PLAY;
                    end
                    if (BtnU) begin
                        play_flag <= 1'b1;
                    end
                end
                PLAY: begin
                    if (gameover_ctrl) begin
                        state <= GAMEOVER;
                    end
                end
                GAMEOVER: begin
                    play_flag <= 1'b0;
                end
                default: state <= UNK;
            endcase
        end
    end

    // Output assignments
    assign q_Init = state[0];
    assign q_Play = state[1];
    assign q_GameOver = state[2];

endmodule