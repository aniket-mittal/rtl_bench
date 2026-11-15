module origen_189043(
    input rst,
    input clk,
    input op,
    input start,
    input x_gt_y,
    input x_eq_y,
    input x_ls_y,
    output reg x_sel,
    output reg y_sel,
    output reg x_en,
    output reg y_en,
    output reg [1:0] x_op,
    output reg [1:0] y_op,
    output reg done_en
);

    reg [1:0] state;
    parameter STATE_INIT = 2'b00, STATE_EXEC = 2'b01, STATE_DONE = 2'b10;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= STATE_INIT;
            x_sel <= 1'b0;
            y_sel <= 1'b0;
            x_en <= 1'b0;
            y_en <= 1'b0;
            x_op <= 2'b0;
            y_op <= 2'b0;
            done_en <= 1'b0;
        end
        else begin
            case (state)
                STATE_INIT: begin
                    if (start) begin
                        state <= STATE_EXEC;
                    end
                    else begin
                        state <= STATE_INIT;
                    end
                    x_sel <= 1'b0;
                    y_sel <= 1'b0;
                    x_en <= 1'b0;
                    y_en <= 1'b0;
                    x_op <= 2'b0;
                    y_op <= 2'b0;
                    done_en <= 1'b0;
                end
                STATE_EXEC: begin
                    if (x_gt_y) begin
                        x_sel <= 1'b1;
                        y_sel <= 1'b0;
                        x_en <= 1'b1;
                        y_en <= 1'b0;
                        x_op <= (op) ? 2'b01 : 2'b10;
                        y_op <= 2'b0;
                    end
                    else if (x_eq_y) begin
                        x_sel <= 1'b1;
                        y_sel <= 1'b1;
                        x_en <= 1'b1;
                        y_en <= 1'b1;
                        x_op <= (op) ? 2'b01 : 2'b10;
                        y_op <= (op) ? 2'b01 : 2'b10;
                    end
                    else begin
                        x_sel <= 1'b0;
                        y_sel <= 1'b1;
                        x_en <= 1'b0;
                        y_en <= 1'b1;
                        x_op <= 2'b0;
                        y_op <= (op) ? 2'b01 : 2'b10;
                    end
                    state <= STATE_DONE;
                    done_en <= 1'b1;
                end
                STATE_DONE: begin
                    state <= STATE_INIT;
                    x_sel <= 1'b0;
                    y_sel <= 1'b0;
                    x_en <= 1'b0;
                    y_en <= 1'b0;
                    x_op <= 2'b0;
                    y_op <= 2'b0;
                    done_en <= 1'b0;
                end
                default: begin
                    state <= STATE_INIT;
                end
            endcase
        end
    end

endmodule