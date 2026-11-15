module origen_177649 #(
    parameter DATA_WIDTH = 12
)(
    input           req,
    input           rst,
    input           clk,
    input  [DATA_WIDTH-1:0] start_x,
    input  [DATA_WIDTH-1:0] start_y,
    input  [DATA_WIDTH-1:0] end_x,
    input  [DATA_WIDTH-1:0] end_y,
    output [DATA_WIDTH-1:0] out_x,
    output [DATA_WIDTH-1:0] out_y,
    output           ack
);

    localparam DIRECTION_SET = 4'd0;
    localparam SLOPE_SET     = 4'd1;
    localparam LOW_SLOPE     = 4'd2;
    localparam HIGH_SLOPE    = 4'd3;
    localparam POINT_FINISH_HI = 4'd4;
    localparam POINT_FINISH_LO = 4'd5;

    reg  [3:0]  status_reg;
    reg  [DATA_WIDTH:0] dx, dy;
    reg  [DATA_WIDTH:0] decision;
    reg  [DATA_WIDTH:0] delta_A, delta_B;
    reg  [DATA_WIDTH-1:0] x, y;
    reg   [1:0] inc_x, inc_y;

    assign out_x = x;
    assign out_y = y;
    assign ack = (status_reg == POINT_FINISH_HI) || (status_reg == POINT_FINISH_LO);

    // Custom absolute value function
    function [DATA_WIDTH:0] abs_val;
        input [DATA_WIDTH:0] value;
        if (value[DATA_WIDTH]) begin
            abs_val = ~value + 1;
        end else begin
            abs_val = value;
        end
    endfunction

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            status_reg <= DIRECTION_SET;
            dx <= 0;
            dy <= 0;
            decision <= 0;
            delta_A <= 0;
            delta_B <= 0;
            x <= 0;
            y <= 0;
            inc_x <= 0;
            inc_y <= 0;
        end else begin
            case (status_reg)
                DIRECTION_SET: begin
                    if (req) begin
                        dx <= end_x - start_x;
                        dy <= end_y - start_y;
                        inc_x <= (dx >= 0) ? 1 : -1;
                        inc_y <= (dy >= 0) ? 1 : -1;
                        status_reg <= SLOPE_SET;
                    end
                end
                SLOPE_SET: begin
                    if (abs_val(dx) >= abs_val(dy)) begin
                        decision <= 2 * abs_val(dy) - abs_val(dx);
                        delta_A <= 2 * abs_val(dy);
                        delta_B <= 2 * (abs_val(dy) - abs_val(dx));
                        status_reg <= LOW_SLOPE;
                    end else begin
                        decision <= 2 * abs_val(dx) - abs_val(dy);
                        delta_A <= 2 * abs_val(dx);
                        delta_B <= 2 * (abs_val(dx) - abs_val(dy));
                        status_reg <= HIGH_SLOPE;
                    end
                end
                LOW_SLOPE: begin
                    if (req) begin
                        x <= start_x;
                        y <= start_y;
                        if (decision < 0) begin
                            decision <= decision + delta_A;
                            x <= x + inc_x;
                        end else begin
                            decision <= decision + delta_B;
                            x <= x + inc_x;
                            y <= y + inc_y;
                        end
                        if (x == end_x) begin
                            status_reg <= POINT_FINISH_HI;
                        end
                    end
                end
                HIGH_SLOPE: begin
                    if (req) begin
                        x <= start_x;
                        y <= start_y;
                        if (decision < 0) begin
                            decision <= decision + delta_A;
                            x <= x + inc_x;
                            y <= y + inc_y;
                        end else begin
                            decision <= decision + delta_B;
                            x <= x + inc_x;
                        end
                        if (y == end_y) begin
                            status_reg <= POINT_FINISH_LO;
                        end
                    end
                end
                POINT_FINISH_HI: begin
                    if (!req) begin
                        status_reg <= DIRECTION_SET;
                    end
                end
                POINT_FINISH_LO: begin
                    if (!req) begin
                        status_reg <= DIRECTION_SET;
                    end
                end
                default: begin
                    status_reg <= DIRECTION_SET;
                end
            endcase
        end
    end

endmodule