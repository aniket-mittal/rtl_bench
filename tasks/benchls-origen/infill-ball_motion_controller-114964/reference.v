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

    always_ff @(posedge frame_clk or posedge Reset) begin
        if (Reset) begin
            Ball_Y_Motion <= 10'd0;
            Ball_X_Motion <= 10'd0;
            Ball_Y_Pos <= Ball_Y_Center;
            Ball_X_Pos <= Ball_X_Center;
        end
        else begin
            if (Ball_Y_Pos >= Honeycomb)
                Ball_Y_Motion <= -Ball_Y_Step;
            else if (Ball_Y_Pos <= Honeycomb_top)
                Ball_Y_Motion <= Ball_Y_Step;
            else
                Ball_Y_Motion <= Ball_Y_Step;

            if (Ball_X_Pos + Ball_Size >= Ball_X_Max)
                Ball_X_Motion <= 10'd0;

            if (keycode == 8'h1A) begin
                Ball_Y_Motion <= (~(Ball_Y_Step) + 1'b1);
                Ball_X_Motion <= Ball_X_Step;
            end

            Ball_Y_Pos <= (Ball_Y_Pos + Ball_Y_Motion);
            Ball_X_Pos <= (Ball_X_Pos + Ball_X_Motion);
        end
    end

    assign BallX = Ball_X_Pos;
    assign BallY = Ball_Y_Pos;

endmodule