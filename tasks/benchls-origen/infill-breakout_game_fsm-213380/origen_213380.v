module origen_213380(
    input pb1, pb2, foursec, nolives, collision, paddlegone,
    input [5:0] PS,
    output reg [5:0] NS,
    output reg movecarpet, moveball, movepaddle, resettimer,
    output reg decrementlives, loadlives, paddlehide,
    output reg timecount, resetpositions
);

localparam startgame = 6'b000001;
localparam idle = 6'b000010;
localparam play = 6'b000100;
localparam flash = 6'b001000;
localparam paddlefall = 6'b010000;
localparam nopaddles = 6'b100000;

[MASKED]

endmodule