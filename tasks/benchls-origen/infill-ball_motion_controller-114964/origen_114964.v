module origen_114964 (
    input logic Reset, frame_clk,
    input logic [7:0] keycode,
    output logic [9:0] BallX, BallY, BallS,
    output logic [9:0] BallWidth, BallHeight,
    output logic gameover, gamewin
);

    parameter [9:0] Ball_X_Center = 10'd320;
    parameter [9:0] Ball_Y_Center = 10'd240;
    parameter [9:0] Ball_X_Min = 10'd0;
    parameter [9:0] Ball_X_Max = 10'd639;
    parameter [9:0] Ball_Y_Min = 10'd0;
    parameter [9:0] Ball_Y_Max = 10'd479;
    parameter [9:0] Ball_X_Step = 10'd1;
    parameter [9:0] Ball_Y_Step = 10'd1;
    parameter [9:0] Ball_Size = 10'd4;
    parameter [9:0] Honeycomb = 10'd300;
    parameter [9:0] Honeycomb_top = 10'd200;

    logic [9:0] Ball_X_Motion, Ball_Y_Motion;
    logic [9:0] Ball_X_Pos, Ball_Y_Pos;

    assign BallS = Ball_Size;
    assign BallWidth = 10'd8;
    assign BallHeight = 10'd8;

    [MASKED]

    assign BallX = Ball_X_Pos;
    assign BallY = Ball_Y_Pos;

endmodule