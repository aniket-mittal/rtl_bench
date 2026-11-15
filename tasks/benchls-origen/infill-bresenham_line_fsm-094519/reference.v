module origen_094519 (
    input wire i_clk,
    input wire i_reset,
    input wire i_start,
    input wire i_xgtx0,
    output reg o_set_x0x1y0y1,
    output reg o_set_steep,
    output reg o_set_x0gtx1,
    output reg o_set_params,
    output reg o_int_draw,
    output reg o_draw,
    output reg o_upd_err,
    output reg o_upd_xy,
    output reg o_done
);

    reg [3:0] current_state, next_state;

    localparam WAIT = 4'd0,
               SET_X0X1Y0Y1 = 4'd1,
               SET_STEEP = 4'd2,
               SET_X0GTX1 = 4'd3,
               SET_PARAMS = 4'd4,
               INT_DRAW = 4'd5,
               DRAW = 4'd6,
               UPD_ERR = 4'd7,
               UPD_XY = 4'd8,
               DONE = 4'd9;

    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset)
            current_state <= WAIT;
        else
            current_state <= next_state;
    end

    always @(*) begin
        next_state = current_state;
        o_set_x0x1y0y1 = 1'b0;
        o_set_steep = 1'b0;
        o_set_x0gtx1 = 1'b0;
        o_set_params = 1'b0;
        o_int_draw = 1'b0;
        o_draw = 1'b0;
        o_upd_err = 1'b0;
        o_upd_xy = 1'b0;
        o_done = 1'b0;

        case (current_state)
            WAIT: begin
                if (i_start)
                    next_state = SET_X0X1Y0Y1;
            end
            SET_X0X1Y0Y1: begin
                o_set_x0x1y0y1 = 1'b1;
                next_state = SET_STEEP;
            end
            SET_STEEP: begin
                o_set_steep = 1'b1;
                next_state = SET_X0GTX1;
            end
            SET_X0GTX1: begin
                o_set_x0gtx1 = 1'b1;
                next_state = SET_PARAMS;
            end
            SET_PARAMS: begin
                o_set_params = 1'b1;
                next_state = INT_DRAW;
            end
            INT_DRAW: begin
                o_int_draw = 1'b1;
                next_state = DRAW;
            end
            DRAW: begin
                o_draw = 1'b1;
                next_state = UPD_ERR;
            end
            UPD_ERR: begin
                o_upd_err = 1'b1;
                next_state = UPD_XY;
            end
            UPD_XY: begin
                o_upd_xy = 1'b1;
                next_state = i_xgtx0 ? DONE : DRAW;
            end
            DONE: begin
                o_done = 1'b1;
                next_state = WAIT;
            end
            default: next_state = WAIT;
        endcase
    end

endmodule