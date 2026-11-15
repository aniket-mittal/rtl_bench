module origen_187438(
    input uclock,
    input msClock,
    input tobuzzer,
    output reg buzzer
);

reg [9:0] waitTime;
reg [3:0] state;
reg [3:0] nextState;

always @(posedge uclock) begin
    state <= nextState;
end

always @(posedge msClock) begin
    if (waitTime >= 10'd1020)
        waitTime <= 10'd0;
    else if (tobuzzer)
        waitTime <= waitTime + 10'd1;
    else
        waitTime <= 10'd0;
end

always @(*) begin
    case (state)
        4'd0: begin
            buzzer = 1'b0;
            if (tobuzzer)
                nextState = 4'd1;
            else
                nextState = 4'd0;
        end
        4'd1: begin
            buzzer = 1'b1;
            if (tobuzzer && waitTime >= 10'd80 && waitTime < 10'd1020)
                nextState = 4'd2;
            else
                nextState = 4'd1;
        end
        4'd2: begin
            buzzer = 1'b0;
            if (tobuzzer && waitTime >= 10'd140)
                nextState = 4'd3;
            else
                nextState = 4'd2;
        end
        4'd3: begin
            buzzer = 1'b1;
            if (tobuzzer && waitTime >= 10'd20)
                nextState = 4'd4;
            else
                nextState = 4'd3;
        end
        4'd4: begin
            buzzer = 1'b0;
            if (tobuzzer && waitTime >= 10'd20)
                nextState = 4'd5;
            else
                nextState = 4'd4;
        end
        4'd5: begin
            buzzer = 1'b1;
            if (tobuzzer && waitTime >= 10'd20)
                nextState = 4'd6;
            else
                nextState = 4'd5;
        end
        4'd6: begin
            buzzer = 1'b0;
            if (tobuzzer && waitTime >= 10'd20)
                nextState = 4'd7;
            else
                nextState = 4'd6;
        end
        4'd7: begin
            buzzer = 1'b1;
            if (tobuzzer && waitTime >= 10'd20)
                nextState = 4'd8;
            else
                nextState = 4'd7;
        end
        4'd8: begin
            buzzer = 1'b0;
            if (tobuzzer)
                nextState = 4'd1;
            else
                nextState = 4'd0;
        end
        default: begin
            buzzer = 1'b0;
            nextState = 4'd0;
        end
    endcase
end

endmodule