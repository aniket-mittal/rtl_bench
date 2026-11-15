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

    [MASKED]

endmodule