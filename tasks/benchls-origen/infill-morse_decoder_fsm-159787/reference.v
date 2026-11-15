module origen_159787(
    input b,
    input clk,
    input reset_n,
    input [3:0] count,
    output reg dot,
    output reg dash,
    output reg LG,
    output reg WG,
    output reg count_reset
);

reg [2:0] state, next_state;
parameter s_idle = 3'd0, s0 = 3'd1, s1 = 3'd2, s2 = 3'd3, s3 = 3'd4, s4 = 3'd5, s5 = 3'd6, s6 = 3'd7;

always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        state <= s_idle;
    end
    else begin
        state <= next_state;
    end
end

always @(*) begin
    next_state = state;
    dot = 1'b0;
    dash = 1'b0;
    LG = 1'b0;
    WG = 1'b0;
    count_reset = 1'b0;

    case (state)
        s_idle: begin
            if (b) begin
                next_state = s0;
                count_reset = 1'b1;
            end
        end
        s0: begin
            if (b) begin
                next_state = s1;
            end
            else begin
                next_state = s4;
            end
        end
        s1: begin
            if (b) begin
                next_state = s2;
            end
            else begin
                next_state = s3;
            end
        end
        s2: begin
            if (b) begin
                next_state = s3;
                dash = 1'b1;
            end
            else begin
                next_state = s0;
                count_reset = 1'b1;
            end
        end
        s3: begin
            if (b) begin
                next_state = s1;
                dot = 1'b1;
            end
            else begin
                next_state = s0;
                count_reset = 1'b1;
            end
        end
        s4: begin
            if (count == 4'd3) begin
                next_state = s5;
                LG = 1'b1;
            end
            else begin
                next_state = s0;
            end
        end
        s5: begin
            if (count == 4'd7) begin
                next_state = s6;
                WG = 1'b1;
            end
            else begin
                next_state = s0;
            end
        end
        s6: begin
            next_state = s_idle;
        end
    endcase
end

endmodule