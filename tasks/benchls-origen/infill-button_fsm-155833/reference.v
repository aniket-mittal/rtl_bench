module origen_155833 (
    input clk,
    input rst,
    input btn,
    output reg out,
    output reg [1:0] state_test
);

    parameter state_0 = 2'b00;
    parameter state_1 = 2'b01;
    parameter state_2 = 2'b10;

    reg [1:0] state, next_state;

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            state <= state_0;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case (state)
            state_0: begin
                if (btn) begin
                    next_state = state_1;
                    out = 1;
                end else begin
                    next_state = state_0;
                    out = 0;
                end
            end
            state_1: begin
                next_state = state_2;
                out = 0;
            end
            state_2: begin
                if (btn) begin
                    next_state = state_2;
                    out = 0;
                end else begin
                    next_state = state_0;
                    out = 0;
                end
            end
            default: begin
                next_state = state_0;
                out = 0;
            end
        endcase

        state_test = state;
    end

endmodule