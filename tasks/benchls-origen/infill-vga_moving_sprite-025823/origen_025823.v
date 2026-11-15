module origen_025823 #(
    parameter stepX = 1,
    parameter stepY = 1,
    parameter autoplay = 1
)(
    input [9:0] xx,
    input [9:0] yy,
    input aactive,
    input is_in_state,
    input Pclk,
    output FSpriteOn,
    output [11:0] dataout
);

    reg [9:0] FrameX = 320;
    reg [9:0] FrameY = 240;
    reg [9:0] FrameWidth = 3;
    reg [9:0] FrameHeight = 35;
    
    reg direction_x = 1;
    reg [31:0] move_counter = 0;
    
    assign FSpriteOn = (xx >= FrameX && xx < FrameX + FrameWidth) &&
                       (yy >= FrameY && yy < FrameY + FrameHeight) &&
                       aactive && is_in_state;
    
    assign dataout = (FSpriteOn) ? 12'hFFF : 12'h000;
    
    [MASKED]

endmodule