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
    
    always @(posedge Pclk) begin
        if (autoplay) begin
            move_counter <= move_counter + 1;
            if (move_counter >= 400000) begin
                move_counter <= 0;
                if (direction_x) begin
                    if (FrameX >= 425) begin
                        direction_x <= 0;
                        FrameX <= FrameX - stepX;
                    end else begin
                        FrameX <= FrameX + stepX;
                    end
                end else begin
                    if (FrameX <= 215) begin
                        direction_x <= 1;
                        FrameX <= FrameX + stepX;
                    end else begin
                        FrameX <= FrameX - stepX;
                    end
                end
            end
        end
    end

endmodule