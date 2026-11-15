module origen_156664(
    input clk,
    input rst,
    input one_shot_button,
    input time_out,
    output reg en_subiendo,
    output reg en_counter
);

    reg [1:0] state, next_state;
    parameter FALL = 2'b00, UP = 2'b01;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= FALL;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case (state)
            FALL: begin
                en_subiendo = 1'b0;
                en_counter = 1'b0;
                if (one_shot_button) begin
                    next_state = UP;
                end
                else begin
                    next_state = FALL;
                end
            end
            UP: begin
                en_subiendo = 1'b1;
                en_counter = 1'b1;
                if (time_out) begin
                    next_state = FALL;
                end
                else begin
                    next_state = UP;
                end
            end
            default: begin
                next_state = FALL;
                en_subiendo = 1'b0;
                en_counter = 1'b0;
            end
        endcase
    end

endmodule