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
    [MASKED]

    // Output assignments
    assign q_Init = state[0];
    assign q_Play = state[1];
    assign q_GameOver = state[2];

endmodule