module origen_199357(
    input clk,
    input reset,
    output reg r,
    output reg g,
    output reg y
);

reg [1:0] state, nextstate;
parameter start = 2'b00, red = 2'b01, yellow = 2'b10, green = 2'b11;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= start;
    end else begin
        state <= nextstate;
    end
end

always @(state) begin
    case (state)
        start: begin
            r = 0;
            g = 0;
            y = 0;
            nextstate = red;
        end
        red: begin
            r = 1;
            g = 0;
            y = 0;
            nextstate = yellow;
        end
        yellow: begin
            r = 0;
            g = 0;
            y = 1;
            nextstate = green;
        end
        green: begin
            r = 0;
            g = 1;
            y = 0;
            nextstate = red;
        end
        default: begin
            state <= start;
        end
    endcase
end

endmodule