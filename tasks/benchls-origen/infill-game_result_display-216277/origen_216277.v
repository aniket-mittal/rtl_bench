module origen_216277(
    input clk,
    input [1:0] state,
    input [1:0] game_status,
    output reg [6:0] a,
    output reg [6:0] b,
    output reg [6:0] c,
    output reg [6:0] d,
    output reg [6:0] e,
    output reg [6:0] f,
    output reg [6:0] g,
    output reg e1,
    output reg e2,
    output reg e3
);

parameter GAME_INIT = 2'b00;
parameter P1_TURN = 2'b01;
parameter P2_TURN = 2'b10;
parameter END_GAME = 2'b11;

parameter STILL_PLAYING = 2'b00;
parameter P1_WINS = 2'b01;
parameter P2_WINS = 2'b10;
parameter TIE = 2'b11;

[MASKED]

endmodule